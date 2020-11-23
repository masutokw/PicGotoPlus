unit ptool;

interface

uses Windows, SysUtils, Classes, Controls;
function FormatString(StringIn, DivideAt: String): TStringList;
function Inttodec(de: Integer; prec: Byte): String;
function IntToAr(ar: Integer; prec: Byte): String;
function LX200Dectoint(dec: String; prec: Boolean): Integer;
function LX200Artoint(ar: String; prec: Boolean): Integer;
function Artoint(ar: String): Integer;
function longitudetohr(ar: String): Extended;
function longitudetodeg(ar: String): Extended;
function latitudetodeg(ar: String): Extended;
procedure GoSleepp(SleepSecs: Integer);
function Signo(n: Integer): Integer;
function Signof(f: Double): Double;
function Signof1(f: Double): Integer;
function DoubletoLXdec(de: Double; prec: Byte): string;
function DoubleToLXAr(ra: Double; prec: Byte): string;
function GetEnvVarValue(const VarName: string): string;

implementation

function FormatString(StringIn, DivideAt: String): TStringList;
var
  Lop, StartAt: Integer;
begin

  Result := TStringList.Create;
  (* First clear the Starting Point, it should set to 1, as
    the Copy() function picks the first character twice when
    Starting at 0. *)

  StartAt := 1;
  (* Now start the loop for every string character: *)
  for Lop := 1 to Length(StringIn) - 1 do
    if Copy(StringIn, Lop, Length(DivideAt)) = DivideAt then
    begin
      (* The adding starts here: *)
      Result.Add(Copy(StringIn, StartAt, Lop - StartAt));
      (* Redefine StartAt, to the Current point + Length of DivideAt: *)
      StartAt := Lop + Length(DivideAt);
    end (* If the 'DivideAt' variable is found, add the text to the stringlist: *);
  Result.Add(Copy(StringIn, StartAt, Lop - StartAt + 1));
end;

// ----------------------------------------------------------------------------
function Inttodec(de: Integer; prec: Byte): String;
var
  g, m, s, tmp, sg: Integer;
  sig: Char;
  destr: Pchar;
begin

  destr := StrAlloc(100);

  sig := '+';
  sg := 1;
  if (de = 0) then
    sg := 0;
  if (de < 0) then
  begin
    sg := -1;
    de := abs(de);
    sig := '-';
  end;
  g := de DIV 3600;
  tmp := de MOD 3600;
  m := tmp DIV 60;
  s := tmp MOD 60;
  case prec of
    0:
      StrFmt(destr, '%s%0.2d°%0.2d''%0.2d"', [sig, g, m, s]);
    1:
      StrFmt(destr, '%s%0.2dß%0.2d''%0.2d#', [sig, g, m, s]);
    2:
      StrFmt(destr, '%s%0.2dß%0.2d#', [sig, g, m]);
    3:
      StrFmt(destr, '%0.3dß%0.2d''%0.2d#', [g, m, s]);
    4:
      StrFmt(destr, '%0.3dß%0.2d#', [g, m]); // ß
  end;

  Inttodec := String(destr);
  StrDispose(destr);
end;

// ------------------------------------------------------------------------
function IntToAr(ar: Integer; prec: Byte): String;
var
  h, m, s, tmp, de: Integer;
  arstr: Pchar;
begin
  arstr := StrAlloc(100);
  // de:=abs(ar mod 150);
  if prec = 0 then
  begin
    de := abs(ar MOD 150);
    ar := ar DIV 10;
  end;
  ar := ar DIV 15;
  ar := ar MOD (24 * 3600);
  if (ar < 0) then
    ar := (24 * 3600) + ar;

  h := (ar DIV 3600);
  tmp := ar MOD 3600;
  m := tmp DIV 60;
  s := tmp MOD 60;
  case prec of
    0:
      StrFmt(arstr, '%0.2dh%0.2dm%0.2ds.%0.3ds', [h, m, s, de]);
    1:
      StrFmt(arstr, '%0.2d:%0.2d:%0.2d#', [h, m, s]);
    2:
      begin
        s := s DIV 6;
        StrFmt(arstr, '%0.2d:%0.2d.%0.1d#', [h, m, s])
      end;
    3:
      StrFmt(arstr, '%0.2dh%0.2dm%0.2ds', [h, m, s]);
  end;
  IntToAr := String(arstr);
  StrDispose(arstr);
end;

procedure GoSleepp(SleepSecs: Integer);
var
  StartValue: Longint;
begin
  StartValue := GetTickCount;
  while ((GetTickCount - StartValue) <= (SleepSecs)) do
    // Aplication.ProcessMessages;
end;

function LX200Dectoint(dec: String; prec: Boolean): Integer;
var
  temp, Signo: Integer;
begin

  if (dec[4] = '-') then
    Signo := -1
  else
    Signo := 1;

  temp := strtoint(Copy(dec, 4, 3)) * 3600 + strtoint(Copy(dec, 8, 2)) *
    60 * Signo;
  if prec then
    temp := temp + strtoint(Copy(dec, 11, 2)) * Signo;
  LX200Dectoint := temp;
end;

function LX200Artoint(ar: String; prec: Boolean): Integer;
var
  temp: Integer;
begin

  if prec then
    temp := (strtoint(Copy(ar, 4, 2)) * 3600 + strtoint(Copy(ar, 7, 2)) * 60 +
      strtoint(Copy(ar, 10, 2))) * 15
  else
    temp := (strtoint(Copy(ar, 4, 2)) * 3600 + strtoint(Copy(ar, 7,
      2) + Copy(ar, 10, 1)) * 6) * 15;
  LX200Artoint := temp;
end;

function Artoint(ar: String): Integer;
var
  temp: Integer;
begin

  temp := 15 * (strtoint(Copy(ar, 1, 2)) * 3600 + strtoint(Copy(ar, 4, 2)) * 60
    + strtoint(Copy(ar, 7, 2))) + strtoint(Copy(ar, 11, 2));
  Artoint := temp;
end;

function longitudetohr(ar: String): Extended;
var
  temp: Integer;
begin

  temp := (strtoint(Copy(ar, 2, 3)) * 3600 + strtoint(Copy(ar, 6, 2)) * 60 +
    strtoint(Copy(ar, 9, 2)));
  longitudetohr := (temp / (3600.00 * 15.0));
end;

function longitudetodeg(ar: String): Extended;
var
  temp: Integer;
begin

  temp := (strtoint(Copy(ar, 2, 3)) * 3600 + strtoint(Copy(ar, 6, 2)) * 60 +
    strtoint(Copy(ar, 9, 2)));
  longitudetodeg := (temp / (3600.00));
end;

function latitudetodeg(ar: String): Extended;
var
  temp: Integer;
begin

  temp := (strtoint(Copy(ar, 2, 2)) * 3600 + strtoint(Copy(ar, 5, 2)) * 60 +
    strtoint(Copy(ar, 8, 2)));
  if ar[1] = '-' then
    temp := -temp;
  latitudetodeg := (temp / (3600.00));
end;

function Signo;
begin
  if n = 0 then
    Signo := 0
  else if n < 0 then
    Signo := -1
  else
    Signo := 1;
end;

function Signof;
begin
  if f = 0 then
    Signof := 0.0
  else if f < 0.0 then
    Signof := -1.0
  else
    Signof := 1.0;
end;

function Signof1;
begin
  if f = 0 then
    Signof1 := 0
  else if f < 0.0 then
    Signof1 := -1
  else
    Signof1 := 1;
end;

// Function
// #:Sr 11:46.3#:Sd +50ß33#
// #:Sr 12:24:11#:Sd +51ß32:41#
function DoubletoLXdec(de: Double; prec: Byte): string;
var
  g, m, s, sg: Integer;
  tmp: Double;
  sig: Char;
  destr: Pchar;
begin

  destr := StrAlloc(15);

  sig := '+';
  // sg:=1;
  // if (de=0.0)then  sg:=0 ;
  if (de < 0.0) then
  begin
    // sg:=-1;
    de := -de;
    sig := '-';
  end;
  g := trunc(de);
  tmp := (de - g);
  m := trunc(tmp * 60);
  tmp := (tmp * 60.0 - m);
  s := trunc(tmp * 60);
  case prec of
    0:
      StrFmt(destr, '%s%0.2d°%0.2d''%0.2d"', [sig, g, m, s]);
    1:
      StrFmt(destr, '%s%0.2dß%0.2d''%0.2d#', [sig, g, m, s]);
    2:
      StrFmt(destr, '%s%0.2dß%0.2d#', [sig, g, m]);
    3:
      StrFmt(destr, '%0.3dß%0.2d''%0.2d#', [g, m, s]);
    4:
      StrFmt(destr, '%0.3dß%0.2d#', [g, m]); // ß
  end;

  DoubletoLXdec := string(destr);
  StrDispose(destr);
End;

function DoubleToLXAr(ra: Double; prec: Byte): string;
var
  h, m, s, de: Integer;
  tmp: Double;
  arstr: Pchar;
begin
  arstr := StrAlloc(15);

  h := trunc(ra);
  tmp := (ra - h);
  m := trunc(tmp * 60);
  tmp := (tmp * 60.0 - m);
  s := trunc(tmp * 60);
  case prec of
    // 0:  StrFmt(arstr,'%0.2dh%0.2dm%0.2ds.%0.3ds',[h,m,s,de]);
    1:
      StrFmt(arstr, '%0.2d:%0.2d:%0.2d#', [h, m, s]);
    2:
      begin
        s := s div 6;
        StrFmt(arstr, '%0.2d:%0.2d.%0.1d#', [h, m, s])
      end;
    3:
      StrFmt(arstr, '%0.2dh%0.2dm%0.2ds', [h, m, s]);
  end;
  DoubleToLXAr := string(arstr);
  StrDispose(arstr);
end;

function GetEnvVarValue(const VarName: string): string;
var
  BufSize: Integer; // buffer size required for value
begin
  // Get required buffer size (inc. terminal #0)
  BufSize := GetEnvironmentVariable(Pchar(VarName), nil, 0);
  if BufSize > 0 then
  begin
    // Read env var value into result string
    SetLength(Result, BufSize - 1);
    GetEnvironmentVariable(Pchar(VarName), Pchar(Result), BufSize);
  end
  else
    // No such environment variable
    Result := '';
end;

end.
