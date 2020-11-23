unit align;

// Translated (and fixed) to Object Pascal by Angel Caparrós from Stefan Keller-Tuberg's  ansi C implementation of Toshimi Taki matrix transform
//
// To use:
// (a) fill Z1, Z2 and Z3 with the telescope error values. 0.0=no error.
// The three values are Kalman error coefficients. You can find
// out how to calculate them by reading "Telescope Control" by
// Trueblood and Genet. An alternate algorithm is provided in
// Mel Bartel's source code zip file.
// It's also OK to use the routines in the no-error mode.
//
// (b) align on either two or three stars, filling STAR structs for each.
// When the shaft encoders are polled to determine the telescope
// coordinates, the system tick counter must also be polled and
// the value stored in the STAR structure.
//
// (c) call DSC_generate_transform_matrix (&star1, &star2, &star3)
// For two star alignment, set star3 to (STAR *)0
//
// (d) To determine RA/DEC from a known ALT/AZ/sys_ticks reading,
// partially fill a STAR structure and then call
// DSC_Alt_Az_from_Ra_Dec (&star_structure)
//
// To determine ALT/AZ from a known RA/DEC/sys_ticks reading,
// partially fill a STAR structure and then call
// DSC_Ra_Dec_from_Alt_Az (&star_structure)
//
// The unfilled fields of the STAR structure will be filled out
// upon return.
//
// Note:
// It is feasible to perform a two star alignment and then, later in the
// night, call DSC_generate_transform_matrix with a third star. In this
// case, there is no need to reinitialise any matrices. Simply call
// DSC_generate_transform_matrix with any three valid STAR structures.
interface

uses Math, windows;

const

  // DEGREES_PER_RAD =(180/ PI);
  SID_TO_SOLAR_CONSTANT = 1 / 1.002737908;
  // 1.00273790935; // multiply sidereal time by this to get solar time
  // frequency of the system ticker in Hz. This must be very accurate.
  SECONDS_IN_DAY = 60 * 60 * 24;
  DBL_MAX = high(longword);

type
  matrix = array [0 .. 2, 0 .. 2] of extended;
  vector = array [0 .. 2] of extended;

  STAR = record

    ra, dec, alt, az: extended; // ra and dec of actual star
    sys_ticks: int64; // alt and az reading from the shaft encoders
    // time at which the alt/az readings were taken
  end;

procedure set_z(zs1, zs2, zs3: extended);
Procedure set_star(var tstar: STAR; ra, dec, az, alt: extended; tick: int64);
procedure DSC_generate_transform_matrices(star1, star2, star3: STAR);
procedure DSC_Alt_Az_from_Ra_Dec(var STAR: STAR);
procedure DSC_Ra_Dec_from_Alt_Az(var STAR: STAR);

implementation

var
  Telescope, Actual, Transform_to_Ra_Dec, Transform_to_Alt_Az: matrix;
  Z1, Z2, Z3: extended;
  TICK_FREQ: int64;

procedure DSC_fill_3x3_matrix(var matrix: matrix; value: Double);
var
  i, j: byte;
begin

  for i := 0 to 2 do
    for j := 0 to 2 do
      matrix[i, j] := value;
end;

procedure DSC_clear_matrices();
begin
  fillchar(Telescope, sizeof(matrix), #0);
  fillchar(Actual, sizeof(matrix), #0);
  fillchar(Transform_to_Ra_Dec, sizeof(matrix), #0);
  fillchar(Transform_to_Alt_Az, sizeof(matrix), #0);
end;

procedure DSC_init_array_column(var dest: matrix; col: byte; var src: vector);
var
  i: byte;
begin

  for i := 0 to 2 do
    dest[i, col] := src[i]
end;

function DSC_determinant(var A: matrix): extended;
begin
  Result := A[0, 0] * (A[1, 1] * A[2, 2] - A[1, 2] * A[2, 1]) - A[0, 1] *
    (A[1, 0] * A[2, 2] - A[1, 2] * A[2, 0]) + A[0, 2] *
    (A[1, 0] * A[2, 1] - A[1, 1] * A[2, 0]);
end;

procedure DSC_multiply_3x3_with_3x3(var Result, A, B: matrix);

begin

  Result[0, 0] := A[0, 0] * B[0, 0] + A[0, 1] * B[1, 0] + A[0, 2] * B[2, 0];
  Result[0, 1] := A[0, 0] * B[0, 1] + A[0, 1] * B[1, 1] + A[0, 2] * B[2, 1];
  Result[0, 2] := A[0, 0] * B[0, 2] + A[0, 1] * B[1, 2] + A[0, 2] * B[2, 2];

  Result[1, 0] := A[1, 0] * B[0, 0] + A[1, 1] * B[1, 0] + A[1, 2] * B[2, 0];
  Result[1, 1] := A[1, 0] * B[0, 1] + A[1, 1] * B[1, 1] + A[1, 2] * B[2, 1];
  Result[1, 2] := A[1, 0] * B[0, 2] + A[1, 1] * B[1, 2] + A[1, 2] * B[2, 2];

  Result[2, 0] := A[2, 0] * B[0, 0] + A[2, 1] * B[1, 0] + A[2, 2] * B[2, 0];
  Result[2, 1] := A[2, 0] * B[0, 1] + A[2, 1] * B[1, 1] + A[2, 2] * B[2, 1];
  Result[2, 2] := A[2, 0] * B[0, 2] + A[2, 1] * B[1, 2] + A[2, 2] * B[2, 2];

end;

procedure DSC_multiply_3x3_with_1x3(var Result: vector; var A: matrix;
  var B: vector);
// var i,j:byte;
begin

  Result[0] := A[0, 0] * B[0] + A[0, 1] * B[1] + A[0, 2] * B[2];
  Result[1] := A[1, 0] * B[0] + A[1, 1] * B[1] + A[1, 2] * B[2];
  Result[2] := A[2, 0] * B[0] + A[2, 1] * B[1] + A[2, 2] * B[2];

end;

procedure DSC_transpose_3x3(var A: matrix);
var
  i, j: byte;
  tmp: extended;
begin
  // Transpose the rows and columns of the matrix

  for i := 0 to 2 do
    for j := 0 to 2 do
    begin
      tmp := A[i, j];
      A[i, j] := A[j, i];
      A[j, i] := tmp;
    end;
end;

procedure DSC_spherical_to_rect(var Result: vector; var STAR: STAR);
var
  x, y: extended;
begin

  x := (2.0 * PI) - STAR.az;
  y := STAR.alt + Z3;

  if ((Z1 <> 0.0) or (Z2 <> 0.0)) then
  begin
    Result[0] := cos(x) * cos(y) * cos(Z2) - sin(x) * cos(Z1) * sin(Z2) + sin(x)
      * sin(y) * sin(Z1) * cos(Z2);
    Result[1] := sin(x) * cos(y) * cos(Z2) + cos(x) * cos(Z1) * sin(Z2) - cos(x)
      * sin(y) * sin(Z1) * cos(Z2);
    Result[2] := sin(y) * cos(Z1) * cos(Z2) + sin(Z1) * sin(Z2);
  end
  else
  begin
    Result[0] := cos(x) * cos(y);
    Result[1] := sin(x) * cos(y);
    Result[2] := sin(y);
  end;
end;

function DSC_calc_sidereal_time(STAR: STAR): extended;
begin
  Result := STAR.sys_ticks *
    ((2.0 * PI) / (SID_TO_SOLAR_CONSTANT * (TICK_FREQ) * (SECONDS_IN_DAY)));
end;

procedure DSC_init_star(var STAR: STAR; col: byte);

var
  vectorl: vector;
  sid_time: extended;
begin
  sid_time := DSC_calc_sidereal_time(STAR);
  vectorl[0] := cos(STAR.dec) * cos(STAR.ra - sid_time);
  vectorl[1] := cos(STAR.dec) * sin(STAR.ra - sid_time);
  vectorl[2] := sin(STAR.dec);

  DSC_init_array_column(Actual, col, vectorl);
  DSC_spherical_to_rect(vectorl, STAR);
  DSC_init_array_column(Telescope, col, vectorl);
end;

procedure DSC_kludge_third_star(var matrix: matrix);

var
  A, B, c, length: extended;
  vectorl: vector;
begin
  A := matrix[1][0] * matrix[2][1] - matrix[2][0] * matrix[1][1];
  B := matrix[2][0] * matrix[0][1] - matrix[0][0] * matrix[2][1];
  c := matrix[0][0] * matrix[1][1] - matrix[1][0] * matrix[0][1];

  length := sqrt(sqr(A) + sqr(B) + sqr(c));

  if (length = 0.0) then
  begin
    vectorl[0] := DBL_MAX;
    vectorl[1] := DBL_MAX;
    vectorl[2] := DBL_MAX
  end
  else
  begin
    vectorl[0] := A / length;
    vectorl[1] := B / length;
    vectorl[2] := c / length;
  end;

  DSC_init_array_column(matrix, 2, vectorl);
end;

procedure DSC_generate_transform_matrices(star1, star2, star3: STAR);
var
  determinant: extended;
  i, j, k: byte;
  tmp1, tmp2: matrix;
begin
  // initialise the Actual and Telescope matrices

  DSC_clear_matrices();
  DSC_init_star(star1, 0);
  DSC_init_star(star2, 1);

  // if (star3 = 0)then
  if true then
  begin
    DSC_kludge_third_star(Actual);
    DSC_kludge_third_star(Telescope);
  end
  else
    DSC_init_star(star3, 2);

  // Now calculate the transform matrices

  determinant := DSC_determinant(Actual);

  if (determinant = 0.0) then
    DSC_fill_3x3_matrix(tmp2, DBL_MAX)
  else
  begin
    for i := 0 to 2 do
    begin
      move(Actual, tmp1, sizeof(matrix));
      for j := 0 to 2 do
      begin
        for k := 0 to 2 do
          tmp1[k, i] := ifthen(k = j, 1.0);

        tmp2[i][j] := DSC_determinant(tmp1) / determinant;
      end;
    end;
  end;

  DSC_multiply_3x3_with_3x3(Transform_to_Alt_Az, Telescope, tmp2);
  DSC_transpose_3x3(Transform_to_Alt_Az);

  determinant := DSC_determinant(Transform_to_Alt_Az);

  if (determinant = 0.0) then
    DSC_fill_3x3_matrix(Transform_to_Ra_Dec, DBL_MAX)
  else
  begin
    for i := 0 to 2 do
    begin
      move(Transform_to_Alt_Az, tmp1, sizeof(matrix));
      for j := 0 to 2 do
      begin
        for k := 0 to 2 do
          tmp1[k, i] := ifthen(k = j, 1.0);
        Transform_to_Ra_Dec[i][j] := DSC_determinant(tmp1) / determinant;
      end;
    end;
  end;
end;

procedure DSC_Ra_Dec_from_Alt_Az(var STAR: STAR);

// The RA/DEC is calculated by converting the ALT/AZ to rectangular coordinates
// and multiplying by the transform matrix. The resulting rectangular transform
// must be converted back to spherical to determine the RA/DEC. Incremental
// sidereal time must then be added to the RA.

var
  vectorl, Result: vector;
begin
  DSC_spherical_to_rect(vectorl, STAR);
  DSC_multiply_3x3_with_1x3(Result, Transform_to_Ra_Dec, vectorl);

  STAR.dec := arctan2(Result[2], sqrt(sqr(Result[0]) + sqr(Result[1])));

  STAR.ra := arctan2(Result[1], Result[0]);
  STAR.ra := STAR.ra + DSC_calc_sidereal_time(STAR);

  if (STAR.ra < 0.0) then // convert from -PI..PI to 0..2*PI
    STAR.ra := STAR.ra + PI + PI;
end;

procedure DSC_Alt_Az_from_Ra_Dec(var STAR: STAR);
var
  vectorl, Result: vector;
  normalised_ra: extended;
  az, alt: extended;
begin

  normalised_ra := STAR.ra - DSC_calc_sidereal_time(STAR);

  vectorl[0] := cos(STAR.dec) * cos(normalised_ra);
  vectorl[1] := cos(STAR.dec) * sin(normalised_ra);
  vectorl[2] := sin(STAR.dec);

  DSC_multiply_3x3_with_1x3(Result, Transform_to_Alt_Az, vectorl);

  alt := arctan2(Result[2], sqrt(sqr(Result[0]) + sqr(Result[1])));
  az := arctan2(Result[1], Result[0]);

  // account for mount errors

  if ((Z1 <> 0.0) or (Z2 <> 0.0)) then
  begin
    Result[0] := cos(az) * cos(alt) + sin(az) * sin(Z2) * cos(Z1) / cos(Z2) -
      sin(az) * sin(alt) * sin(Z1);
    Result[1] := sin(az) * cos(alt) - cos(az) * sin(Z2) * cos(Z1) / cos(Z2) +
      cos(az) * sin(alt) * sin(Z1);
    Result[2] := (sin(alt) - sin(Z1) * sin(Z2)) / (cos(Z1) * cos(Z2));
  end
  else
  begin
    Result[0] := cos(az) * cos(alt);
    Result[1] := sin(az) * cos(alt);
    Result[2] := sin(alt);
  end;

  STAR.alt := arctan2(Result[2], sqrt(sqr(Result[0]) + sqr(Result[1]))) - Z3;
  STAR.az := -arctan2(Result[1], Result[0]);

  if (STAR.az < 0) then // convert from -PI..PI to 0..2*PI
    STAR.az := STAR.az + PI + PI;
end;

Procedure set_star(var tstar: STAR; ra, dec, az, alt: extended; tick: int64);
begin
  tstar.ra := degtorad(ra * 15);
  tstar.dec := degtorad(dec);
  tstar.az := degtorad(az);
  tstar.alt := degtorad(alt);
  tstar.sys_ticks := tick;

end;

procedure set_z(zs1, zs2, zs3: extended);
begin
  Z1 := zs1;
  Z2 := zs2;
  Z3 := zs3;
end;
begin
  QueryPerformanceFrequency(TICK_FREQ)

end.
