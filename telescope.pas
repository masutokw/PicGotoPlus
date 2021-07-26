{ -------------------------------------------------------------------------
  Telescope2 Class 26/07/2010
  Autor: Angel Caparrós
  License:
  Version 3.4.4
  Implements low level control for Picgoto Microcontrol System
  Encapsulates use for serial port , parse and translate LX200 commands
  ------------------------------------------------------------------------ }
unit telescope;

interface

uses Windows, SysUtils, serial, Classes, Ptool, Math, DateUtils, dialogs, taki,
  align, picplus;

type
  rate = (SLEW, FIND, CENTER, GUIDE, SIDERAL, SLEWDEC, FINDDEC, CENTERDEC,
    GUIDEDEC, GUIDEEAST);
  mmode = (ECUATOR, ALTAZ, ALIGNED);

  TTelescope = class
  public
    port: THandle;
    ahora: extended;
    Aceleration, autoguide_mode: Boolean;
    // AR parameters
    ArStepSize, ArRed, delta, GuideRate: Real;
    ArTarget, DecTarget, ARCurrent, DecCurrent: extended;
    ArGear, Arsteps, ArPos, Ardest, EncoderRaRes, rr, deccounter: Integer;
    current_rate: rate;
    SlewSpeed, FindSpeed, CenterSpeed, GuideSpeed, GuideSpeedEast, SelectSpeed,
      SideralSpeed, ActualSpeed, Nearspeed: Integer;
    SelectSpeedf, Nearspeedf: double;
    Slewrate, FindRate, CenterRate, NearRate, RaRamp: Integer;
    tArSpeed, var_step_speed: double;
    tick: double;
    zeropec, pe_size: Integer;
    // DE parameters
    DecStepSize, DecRed, GuideRateDec: Real;
    DecGear, DecSteps, DecPos, DecDest, EncoderDecRes: Integer;
    SlewSpeedDec, FindSpeedDec, CenterSpeedDec, GuideSpeedDec, SelectSpeedDec,
      ActualSpeedDec, NearspeedDec: Integer;
    SelectSpeedDecf, NearspeedDecf: double;
    SlewrateDec, FindRateDec, CenterRateDec, NearRatedec, DERamp: Integer;
    vlong, vlat: extended;
    var_step_speed_dec, tdecspeed: double;
    // focus
    focuspos, FLspeed, FFSpeed, focusdest: Integer;
    eye1, eye2, eye3, eye4: Integer;
    FocusStepSize: double;
    focusmaxStep, focusbackslash: Integer;
    FocusSeleclSpeed: Boolean;
    // aux
    baserate: byte;
    auxpos, AXLspeed, AXFSpeed: Integer;
    aux: array [0 .. 8] of Integer;
    auxindex: byte;
    auxStepSize: double;
    auxmaxStep, auxbackslash: Integer;
    Connected: Boolean;
    Preci: Boolean;
    RA_timertick, DE_timertick: Real;
    Longitude, Latitude: double;
    // float control
    current_ra_speed, target_ra_speed, ra_accel: double;
    current_de_speed, target_de_speed, de_accel: double;
    forbidden_min, forbidden_max, forbidden_min_dec, forbidden_max_dec: double;
    forbidden_enable: Boolean;
    Gmtoffset: Integer;
    Track_Start, solar: Boolean;
    eqmount: mmode;
    RA_Thread: Integer;
    Id: Longword;
    Msg1: Longword;
    Sp, Spd: Integer;
    Run, RaSlew, DeSlew, autoslew, focusmoving: Boolean;
    radius_RA, radius_de: Integer;
    starA: array [1 .. 3] of star;
    starw, starz: star;
    ahorai: int64;
    alignmode: byte;
    decpulse, arpulse: Integer;
    pguiding, guidelock: Boolean;
    tracesp: array [1 .. 20] of Integer;
    tracecount: Integer;
    trackbit, lineal,basespeedbool: Boolean;
    procedure PicCal;
    procedure GetMount(Ag, Dg, Ast, Dst: Integer; Ar, Dr: Real;
      Sr, Fr, Cr, Nr: Integer; Gr: Real; Srd, Frd, Crd, Nrd: Integer;
      Grd, ttick: Real; track: Boolean; ra_ra, ra_de: Integer);

    procedure SetSpeeds(S, F, C, G, sid, N: Integer;
      Sd, Fd, Cd, Gd, Ne: Integer; Ge: Integer);
    constructor create();
    function SetFocuserSpeed(Speed: Smallint): Boolean;
    function SetAuxSpeed(Speed: Smallint): Boolean;
    function SetRaSpeed(Speed: Integer): Boolean;
    function GoNorth: Boolean;
    function GoSouth: Boolean;
    function GoWest: Boolean;
    function GoEast: Boolean;
    function GetPos: String;
    function SetSideralSpeed: Boolean;
    procedure GotoDec(de: Integer);
    procedure GotoAr(Ar: Integer);
    function StopAR: Boolean;
    procedure GotoSlew;
    procedure GotoSlewdec;
    procedure GotoSlewAr;
    procedure Adjust(ad: Smallint);
    function ReturnAr: String; OVERLOAD;
    function ReturnAr(b: Boolean): String; OVERLOAD;
    function ReturnArDest: String; OVERLOAD;
    function ReturnArDest(b: Boolean): String; OVERLOAD;
    function ReturnAR_h: extended;
    function ReturnDec: String; OVERLOAD;
    function ReturnDec(b: Boolean): String; OVERLOAD;
    function ReturnDecdest(b: Boolean): String; OVERLOAD;
    function ReturnDecdest: String; OVERLOAD;
    procedure LoadPos(Ar, dec: String);
    function StopDec: Boolean;
    procedure SetActualSpeed(v: rate);
    procedure SetDeviceSpeed(value: Integer; index: rate; device: word);
    procedure SincroniceallDeviceSpeeds(device: word);
    procedure SaveEEPROMSettings;
    procedure CalcStepSize();
    procedure connect(comport: String; baudrate: String; QUICK: Boolean);
    procedure disconnect;
    procedure Torque(b: Integer);
    procedure SetMountWestSide;
    procedure SetMountEastSide;
    procedure FocusHiSpeed;
    procedure FocusLowSpeed;
    procedure Focusp;
    procedure Focusl;
    procedure FocuStop;
    procedure SetFocuserPos(x: Integer);
    function ProcessLX200C(command: String): String;
    procedure Sync(piersideeast: Boolean);
    procedure SetPWMAr(index, value: Integer);
    procedure SetPWMde(index, value: Integer);
    function Ar_Halt: Boolean;
    procedure SetLocation(long, lat: String; offset: Integer);
    function Local_Sideral_Time(localdatetime: Tdatetime): double;
    function Local_RA_Position(localdatetime: Tdatetime): double;
    function Azimuth(localdatetime: Tdatetime): double;
    function Altitude(localdatetime: Tdatetime): double;
    procedure SetZeroPos;
    function Pier_Side_East: Boolean;
    procedure SavePrescaler(p: byte);
    procedure SaveBaudRate(p: Char);
    function SetDecSpeed(Speed: Integer): Boolean;
    function ThreadedMotorControl(Parameter: Pointer): Integer;
    procedure GotoFocuser(de: Integer);
    procedure GotoAux(au: Integer);
    procedure SetauxPos(x: Integer);
    procedure FocusConfig(res: double; max, back, s1, s2, f1, f2, f3,
      f4: Integer);
    procedure AuxConfig(res: double; max, back, s1, s2, f1, f2, f3, f4, f5, f6,
      f7, f8: Integer);
    Procedure set_az_speed(mstep_speed: double);
    Procedure set_alt_speed(mstep_speed: double);
    Procedure set_az_speed_direct(mstep_speed: double);
    Procedure set_alt_speed_direct(mstep_speed: double);
    procedure sendcmd(S: string);
    procedure GotoAuxIndex(index: Integer);
    procedure calib(b: Integer);
    procedure calibdec(b: Integer);
    procedure arblock();
    procedure deblock();
    procedure SetPWM_Hz(p: Char);
    function get_current_filter(): Smallint;
    procedure Eq_to_alaz(Ar, dec: extended; var az, alt: extended;
      localdatetime: Tdatetime);
    procedure altaztoEQ(var Ar, dec: extended; az, alt: extended;
      localdatetime: Tdatetime);
    function returneq(arreq: Boolean): string;
    procedure alt_az_sync;
    Procedure gotoslew_AltAz;
    Procedure track_speeds(var vaz, valt: extended);
    Procedure Geo_data_align;
    procedure get_Zenith(var ra, dec: extended);
    procedure get_Zenith1(var ra, dec: extended);
    procedure set_align_star(RightAscension, Declination: double);
    procedure align_now;
    procedure equ_to_mount(var starp: star);
    procedure mount_to_equ(var starp: star);
    procedure setRAbackslash(backslash: Smallint; active: byte);
    procedure setDEcbackslash(backslash: Smallint; active: byte);
    procedure SetauxbackslashStatus(active: byte);
    procedure SetfocusbackslashStatus(active: byte);
    function GetRaSpeed: Integer;
    function decguide: Integer;
    function arguide: Integer;
    procedure changeM(piersideeast: Boolean);
    procedure setzeropec();
    function worm_angle(): Real;
    function ReturnAr(b: Boolean; Dst: Real): String; overload;
    function PicTime(): cardinal;
  end;

implementation

// const DE_timertick = 0.4e-6;
Const
  DEVICE_AR = 254; // ar

Const
  DEVICE_DE = 253; // de

const
  FC_TIMER_TICK = 51.2E-6;

const
  SIDERALF = 15.041068558362671057482635080546;

const
  SOLARF = 15.0;

const
  LUNARF = 14.685;

const
  KINGF = 15.0369;

constructor TTelescope.create;
begin
  inherited create;
  ArStepSize := 0.02;
  DecStepSize := 0.5;
  Connected := FALSE;
  Preci := FALSE;
  Aceleration := FALSE;
  RaRamp := 200;
  DERamp := 200;
  FocusSeleclSpeed := true;
  focusmoving := FALSE;
  autoguide_mode := FALSE;
  eqmount := ECUATOR;
  alignmode := 0;
  pguiding := FALSE;
  guidelock := FALSE;
  forbidden_enable := FALSE;
  baserate := 0;
end;

// ---------------------------------------------------------------------------
procedure TTelescope.PicCal;
var
  SidStepPeriod, basespeed, SidStepPeriodDe, BaseSpeedDe: extended;
  period, periodDe, Eastspeedguide: Integer;
  precharge, N: Integer;

begin
  EncoderRaRes := Round(ArRed * ArGear * Arsteps);
  EncoderDecRes := Round(DecRed * DecGear * DecSteps);

  // calc period for one step at sideral speed
  SidStepPeriod := (86164.09065) / (ArRed * ArGear * Arsteps);

  basespeed := SidStepPeriod / RA_timertick;
  basespeedbool:=basespeed<65535;
  // cambio de base de tiempo linea original    basespeed:=SidStepPeriod/(3.981e-7*;
  period := Round(basespeed); // +1; 242
  SidStepPeriodDe := 86164.09065 / (DecRed * DecGear * DecSteps);
  BaseSpeedDe := SidStepPeriodDe / RA_timertick;
  periodDe := trunc(BaseSpeedDe + 1); // +1; 242
  if (GuideRate > 1) then
    Eastspeedguide := -(65535 - Round(period / (GuideRate - 1)))
  else if (GuideRate = 1) then
    Eastspeedguide := 0
  else
  begin
    Eastspeedguide := (65535 - Round(period / (GuideRate)));
    if Eastspeedguide <= 0 then
      Eastspeedguide := 1;
  end;
  SetSpeeds(65535 - (period DIV Slewrate), 65535 - (period DIV FindRate),
    65535 - (period DIV CenterRate), 65535 - Round(period / (GuideRate + 1)),
    (65535 - period), 65535 - (period DIV NearRate),
    65535 - (periodDe DIV SlewrateDec), 65535 - (periodDe DIV FindRateDec),
    65535 - (periodDe DIV CenterRateDec),
    65535 - Round(periodDe / GuideRateDec), 65535 - (periodDe div NearRatedec),
    Eastspeedguide);

end;

procedure TTelescope.GetMount;
begin
  ArGear := Ag;
  DecGear := Dg;
  Arsteps := Ast;
  DecSteps := Dst;
  ArRed := Ar;
  DecRed := Dr;
  Slewrate := Sr;
  FindRate := Fr;
  CenterRate := Cr;
  GuideRate := Gr;
  SlewrateDec := Srd;
  FindRateDec := Frd;
  CenterRateDec := Crd;
  GuideRateDec := Grd;
  NearRate := Nr;
  NearRatedec := Nrd;
  RA_timertick := ttick;
  DE_timertick := ttick;
  CalcStepSize;
  Track_Start := track;
  PicCal;
  radius_RA := ra_ra;
  radius_de := ra_de;
  pe_size := trunc(ArRed * Arsteps);
end;

function TTelescope.SetFocuserSpeed;
begin
  focusmoving := (Speed <> 0);
  result := AuxSetPeriod(DEVICE_AR, Speed);

end;

function TTelescope.SetAuxSpeed;
begin

  result := AuxSetPeriod(DEVICE_DE, Speed);
end;

// ---------------------------------------------------------------------------
function TTelescope.SetRaSpeed;
var
  buff: String;
  speedt: word;
  count: Integer;
begin
  speedt := abs(Speed);
  ActualSpeed := Speed;
  result := MotorSetPeriod(DEVICE_AR, speedt, signo(Speed));

end;

function TTelescope.SetDecSpeed;
var
  speedt: word;

begin
  speedt := abs(Speed);
  ActualSpeedDec := Speed;
  result := MotorSetPeriod(DEVICE_DE, speedt, signo(Speed));
end;

function TTelescope.Ar_Halt;
begin
  MotorSetPeriod(DEVICE_AR, 0, 0);
  sleep(100);
  SetMotorCounter(DEVICE_AR, ArPos);
  sleep(100);
  SetMotorCounter(DEVICE_DE, deccounter); // decpos);
  sleep(100);
  SetAuxCounter(DEVICE_AR, focuspos);
  SaveCounters(DEVICE_AR);
  sleep(100);
  result := SaveCounters(DEVICE_DE);
  sleep(100);
end;

// ---------------------------------------------------------------------------
function TTelescope.GoNorth;
var
  p: Integer;
begin

  if Pier_Side_East then
    p := 1
  else
    p := -1;
  if Aceleration then
    // spd :=  p * SelectSpeedDec
    target_de_speed := p * SelectSpeedDecf
  else
    GoNorth := SetDecSpeed(p * SelectSpeedDec);
end;
// ---------------------------------------------------------------------------

function TTelescope.GoSouth;
var
  p: Integer;
begin

  if Pier_Side_East then
    p := -1
  else
    p := 1;
  if Aceleration then
    // spd :=  p * SelectSpeedDec
    target_de_speed := p * SelectSpeedDecf
  else
    GoSouth := SetDecSpeed(p * SelectSpeedDec);
end;

// ---------------------------------------------------------------------------
function TTelescope.GoWest;
begin
  if Aceleration then
    // sp := SelectSpeed
    target_ra_speed := SelectSpeedf // +integer( SelectSpeed = FindSpeed)
  else
    GoWest := SetRaSpeed(SelectSpeed);

end;

// ---------------------------------------------------------------------------
function TTelescope.GoEast;
var
  vel: Integer;
  guidet: Boolean;
begin
  guidet := (SelectSpeed = GuideSpeed);
  if guidet then
    vel := GuideSpeedEast
  else
    vel := -SelectSpeed;

  if Aceleration then
  begin
    if guidet then
      target_ra_speed := 2 * SIDERALF - SelectSpeedf
    else
      target_ra_speed := -SelectSpeedf // -integer( SelectSpeed = FindSpeed)
  end
  else
    GoEast := SetRaSpeed(vel);
end;

// ---------------------------------------------------------------------------
function TTelescope.SetSideralSpeed;
begin
  if Aceleration then
  begin
    // sp := SideralSpeed //GoSideral:=GoAccelAr(SideralSpeed)
    if eqmount = ECUATOR then
    begin
      case baserate of
        0:
          target_ra_speed := SIDERALF;
        2:
          target_ra_speed := SOLARF;
        1:
          target_ra_speed := LUNARF;
        3:
          target_ra_speed := KINGF;
        4:
          target_ra_speed := 0;
      end;
    end
    else
      target_ra_speed := 0.0;
  end
  else
    SetSideralSpeed := SetRaSpeed(SideralSpeed);
  trackbit := true;
end;

// ---------------------------------------------------------------------------
function TTelescope.StopAR;

begin

  if Aceleration then
    // StopAR := SetRaSpeed(0)
    target_ra_speed := 0
  else

    StopAR := SetRaSpeed(0);
end;

function TTelescope.StopDec;

begin
  if Aceleration then
    // Stopdec:= GoaccelDec( 0)
    target_de_speed := 0.0
  else

    // StopDec:=GoFreeDec(0);
    StopDec := SetDecSpeed(0)
end;

// ---------------------------------------------------------------------------
procedure TTelescope.Adjust(ad: Smallint);
var
  buff: String;
  count: Integer;
begin
  // count := 5;
  // buff := SmintToStr(1280, ad, DEVICE_AR);
  // WriteCom(port, buff, count);

end;

// -----------------------------------------------------------------------
procedure TTelescope.GotoDec(de: Integer);
begin
  SetMotorTarget(DEVICE_DE, de);
end;

// -----------------------------------------------------------------------
procedure TTelescope.GotoAr(Ar: Integer);
begin
  SetMotorTarget(DEVICE_AR, Ar);
end;

// -----------------------------------------------------------------------
function TTelescope.GetPos;
var
  artemp, dectemp, focustemp, auxtemp: Integer;
  checka, checkd: byte;
begin

  purgebuffer(port);
  // sleep(10);
  ReadCounters(DEVICE_AR);
   sleep(10);
  if GetCounters(artemp, focustemp, checka) and (checka = 44) then
  begin
    ArPos := artemp;
    ARCurrent := (ArPos * ArStepSize);
    focuspos := focustemp;
  end;
  // purgebuffer(port);
  ;
  ReadCounters(DEVICE_DE);
  // sleep(50);

  if GetCounters(dectemp, auxtemp, checkd) and (checkd = 44) then
  begin
    deccounter := dectemp;
    if dectemp > (EncoderDecRes div 2) then
      dectemp := dectemp - EncoderDecRes;

    DecPos := dectemp;
    auxpos := auxtemp;
    DecCurrent := (DecPos * DecStepSize)
  end;
  // purgebuffer(port);
  result := inttostr(checka * 100 + checkd);

end;

{
  function TTelescope.GetPos;
  var
  artemp,dectemp,focustemp,auxtemp,timeaux: Integer;
  checka,checkd:byte;
  begin

  purgebuffer(port);
  // sleep(10);
  ReadCounters(DEVICE_AR);
  //sleep(30);
  if GetCounters(artemp,focustemp,checka) and (checka=44) then
  begin
  arpos:=artemp; ARCurrent:=(Arpos*arstepSize);
  focuspos:=focustemp;
  end;
  //purgebuffer(port);
  ; // sleep(50);
  ReadCounters(DEVICE_DE);


  if GetCountersTime(dectemp,auxtemp,timeaux,checkd) and (checkd=44) then
  begin
  deccounter:=dectemp;
  if dectemp > (encoderDecres div 2) then dectemp := dectemp - encoderDecRes;

  decpos:=dectemp;
  auxpos := auxtemp;
  DecCurrent:=(decpos *decstepSize)
  end;
  // purgebuffer(port);
  result := inttostr(checka*100+checkd);

  end; }
// ---------------------------------------------------------------------------
procedure TTelescope.SetSpeeds;
begin
  SlewSpeed := S;
  FindSpeed := F;
  CenterSpeed := C;
  GuideSpeed := G;
  Nearspeed := N;
  if sid > 0 then
    SideralSpeed := sid
  else
    SideralSpeed := 1;
  SlewSpeedDec := Sd;
  FindSpeedDec := Fd;
  CenterSpeedDec := Cd;
  GuideSpeedDec := Gd;
  GuideSpeedEast := Ge;
  NearspeedDec := Ne;
end;

procedure TTelescope.CalcStepSize;
begin
  ArStepSize := (1296000 / (ArGear * ArRed * Arsteps));
  DecStepSize := (1296000 / (DecGear * DecRed * DecSteps));
end;
// ---------------------------------------------------------------------------

procedure TTelescope.SetActualSpeed(v: rate);
begin

  case v of

    SLEW:
      begin
        SelectSpeed := SlewSpeed;
        SelectSpeedDec := SlewSpeedDec;
        SelectSpeedf := Slewrate * SIDERALF;
        SelectSpeedDecf := SlewrateDec * SIDERALF;
      end;
    FIND:
      begin
        SelectSpeed := FindSpeed;
        SelectSpeedDec := FindSpeedDec;
        SelectSpeedf := FindRate * SIDERALF;
        SelectSpeedDecf := FindRateDec * SIDERALF;
      end;
    CENTER:
      begin
        SelectSpeed := CenterSpeed;
        SelectSpeedDec := CenterSpeedDec;
        SelectSpeedf := CenterRate * SIDERALF;
        SelectSpeedDecf := CenterRateDec * SIDERALF;
      end;
    GUIDE:
      begin
        SelectSpeed := GuideSpeed;
        SelectSpeedDec := GuideSpeedDec;
        SelectSpeedf := SIDERALF + GuideRate * SIDERALF;
        SelectSpeedDecf := GuideRateDec * SIDERALF;
      end;
    SIDERAL:
      SelectSpeed := SideralSpeed;
  end;
end;
// ---------------------------------------------------------------------------

function TTelescope.ReturnAr: String;
var
  tmp: Real;
  tmp1: byte;
  p: Integer;
begin
  if Preci then
    tmp1 := 1
  else
    tmp1 := 2;
  tmp := (Local_Sideral_Time(now) * 15.0 * 3600.0) - (ArPos * ArStepSize);
  if Pier_Side_East then
    p := 0
  else
    p := Round(ArStepSize * (EncoderRaRes DIV 2));
  ReturnAr := Inttoar(Round(tmp) + p, tmp1);
end;

function TTelescope.ReturnArDest: String;
var
  tmp: Real;
  tmp1: byte;
  p: Integer;
begin
  if Preci then
    tmp1 := 1
  else
    tmp1 := 2;
  // tmp:= (local_sideral_time(now)*150.0*3600.0)-(Ardest*10)  ;
  tmp := (Ardest * 10);
  if Pier_Side_East then
    p := 0
  else
    p := 1800 * 3600;
  ReturnArDest := Inttoar(Round(tmp) + p, 0);
end;

function TTelescope.ReturnArDest(b: Boolean): String;
var
  tmp: Real;
  tmp1: byte;
  p: Integer;
begin
  if Preci then
    tmp1 := 1
  else
    tmp1 := 2;
  // tmp:= (local_sideral_time(now)*150.0*3600.0)-(Ardest*10)  ;
  tmp := (Ardest * 1);
  if Pier_Side_East then
    p := 0
  else
    p := 1800 * 3600;
  ReturnArDest := Inttoar(Round(tmp) + p, tmp1);
end;

function TTelescope.ReturnAr(b: Boolean): String;
var
  tmp: Real;
  p: Integer;
begin
  tmp := (Local_Sideral_Time(now) * 150.0 * 3600.0) - (ArPos * ArStepSize * 10);
  if Pier_Side_East then
    p := 0
  else
    p := Round(ArStepSize * EncoderRaRes * 5);
  ReturnAr := Inttoar(Round(tmp) + p, 0);
end;

function TTelescope.ReturnAr(b: Boolean; Dst: Real): String;
var
  tmp: Real;
  p: Integer;
begin
  tmp := (Local_Sideral_Time(now) * 150.0 * 3600.0) -
    (ArPos * ArStepSize * 10) - Dst * 10;
  if Pier_Side_East then
    p := 0
  else
    p := Round(ArStepSize * EncoderRaRes * 5);
  ReturnAr := Inttoar(Round(tmp) + p, 0);
end;

function TTelescope.ReturnAR_h: extended;
var
  tmp: Real;
begin

  ReturnAR_h := (Local_Sideral_Time(now) * 15.0 * 3600.0) - (ArPos * ArStepSize)
  // return deg
end;

// ---------------------------------------------------------------------------
function TTelescope.ReturnDec(): String;
var
  tmp: Real;
  tmp1: byte;
begin
  if Preci then
    tmp1 := 1
  else
    tmp1 := 2;
  if NOT(Pier_Side_East) then
    tmp := (signo(DecPos) * EncoderDecRes DIV 2 - DecPos) * DecStepSize
  else
    tmp := (DecPos) * DecStepSize;
  ReturnDec := IntToDec(trunc(tmp), tmp1);
end;

function TTelescope.ReturnDec(b: Boolean): String;
var
  tmp: Real;

begin
  if NOT(Pier_Side_East) then
    tmp := (signo(DecPos) * EncoderDecRes DIV 2 - DecPos) * DecStepSize
  else
    tmp := (DecPos) * DecStepSize;
  ReturnDec := IntToDec(trunc(tmp), 0);
end;

function TTelescope.ReturnDecdest(b: Boolean): String;
var
  tmp: Real;

begin
  if NOT(Pier_Side_East) then
    tmp := signo(DecDest) * 180 * 3600 - DecDest
    // tmp :=  Decdest
  else
    tmp := DecDest; // *decStepSiz;
  ReturnDecdest := IntToDec(trunc(tmp), 0);
end;

function TTelescope.ReturnDecdest(): String;
var
  tmp: Real;
  tmp1: byte;
begin
  if Preci then
    tmp1 := 1
  else
    tmp1 := 2;
  if NOT(Pier_Side_East) then
    tmp := signo(DecDest) * 180 * 3600 - DecDest
  else
    tmp := DecDest; // *decStepSiz;
  ReturnDecdest := IntToDec(trunc(tmp), tmp1);
end;

// ---------------------------------------------------------------------------
procedure TTelescope.LoadPos(Ar, dec: String);
begin
  Ar := '   ' + trim(Ar);
  dec := '   ' + trim(dec);
  Ardest := LX200Artoint(Ar, true);
  DecDest := LX200Dectoint(dec, true);

  if NOT Pier_Side_East then
  begin
    if DecDest > 0 then
      DecDest := 180 * 3600 - DecDest
    else
      DecDest := -180 * 3600 - DecDest;
    Ardest := (Ardest + 180 * 3600) MOD (3600 * 360)
  end;

end;

// ---------------------------------------------------------------------------
procedure TTelescope.connect;

begin

  Connected := OpenCom(port, '\\.\' + comport, baudrate, 'N', '8', '1', '100',
    '100', QUICK);
  fh := port;
  // PurgeBuffer(port);

end;

// ---------------------------------------------------------------------------
procedure TTelescope.disconnect;
begin
  CloseCom(port);

  Connected := FALSE;
end;

// ---------------------------------------------------------------------------
procedure TTelescope.Sync(piersideeast: Boolean);
var
  buff: String;
  artemp: extended;
  count: Integer;
  dectemp: Integer;
  angle:integer;
begin
  GetPos();
   angle := (ArPos - zeropec) mod pe_size;
  artemp := (Local_Sideral_Time(now) * 15.0 * 3600) - Ardest;
  if artemp < 0 then
    artemp := 3600 * 360 + artemp;

  SetMotorCounter(DEVICE_AR, trunc(artemp / ArStepSize));
  zeropec:= trunc(artemp / ArStepSize) -angle;
  sleep(200);
  dectemp := trunc(DecDest / DecStepSize);

  if piersideeast then
  begin
    if dectemp < 0 then
      dectemp := dectemp + EncoderDecRes;
  end
  else
    // if dectemp<0  then dectemp :=  dectemp + encoderdecres;
    if dectemp < 0 then
      dectemp := dectemp + EncoderDecRes;

  SetMotorCounter(DEVICE_DE, dectemp);
  sleep(200);
end;

procedure TTelescope.GotoSlewdec;
var
  tmp, dest: extended;
  gotospeed: extended;
  t, t1: Integer;
  b: Boolean;
begin

  b := FALSE;
  tmp := DecDest / DecStepSize;
  t := Round(tmp);
  t1 := t;
  if t1 < 0 then
    t1 := t1 + EncoderDecRes;
  GotoDec(t1);

  if abs(t - DecPos) > trunc(2 / DecStepSize) then

  begin
    DeSlew := true;
    if autoslew then
    begin
      // if abs(t - decpos) <= trunc(radius_DE * 60.0 / decstepsize)  then selectspeeddec := nearspeeddec
      if abs(t - DecPos) <= trunc(radius_de * 60.0 / DecStepSize) then
      begin
        if lineal then
          SelectSpeedDecf := NearRatedec * SIDERALF
        else
          SelectSpeedDecf := MIN(SlewrateDec * SIDERALF,
            abs(t - DecPos) * DecStepSize);
        Set_Motor_slew_bit(DEVICE_DE, 255)
      end

      else
      begin
        SelectSpeedDecf := SlewrateDec * SIDERALF;
        Set_Motor_slew_bit(DEVICE_DE, 0)
      end;
    end;
    if Pier_Side_East then
    begin
      if t < DecPos then
        GoSouth
      else
        GoNorth;
    end
    else if signo(DecPos) > 0 then
      if (t < DecPos) then
        if t < 0 then
          GoSouth
        else
          GoNorth
      else
        GoSouth
    else if (t > DecPos) then
      if t < 0 then
        GoSouth
      else
        GoNorth
    else
      GoNorth;
  end;
end;
{
procedure TTelescope.GotoSlewAr;
var
  tmp, dest: extended;
  gotospeed: extended;
  t, t1: Integer;
  b: Boolean;
begin
  // Getpos();
  dest := (15 * 3600.0 * Local_Sideral_Time(now)) - Ardest;
  if dest < 0 then
    dest := 3600 * 360 + dest;
  delta := (Local_RA_Position(now) * 3600 * 15) - dest;

  if (abs(delta) > (360 * 1800)) then
  begin
    delta := ((360 * 3600) - abs(delta)) * sign(-delta);
    b := true;
  end;
  if autoslew then
  begin
    // if abs(delta) <= trunc(radius_RA * 60.0 / arstepsize)  then SelectSpeedf:=Nearrate*SIDERALF
    if abs(delta) <= trunc(radius_RA * 60.0) then
    begin
      if lineal then
        SelectSpeedf := NearRate * SIDERALF
      else
     //  SelectSpeedf := MIN(Slewrate * SIDERALF,Max(SIDERALF, abs(delta)));
        SelectSpeedf := MIN(Slewrate * SIDERALF,abs(delta));
      Set_Motor_slew_bit(DEVICE_AR, 255)
      // selectspeed := nearspeed
    end

    else
    begin
      SelectSpeedf := Slewrate * SIDERALF; // ; SetActualSpeed(CENTE;
      Set_Motor_slew_bit(DEVICE_AR, 0)
    end;
  end;
  // gotospeed := abs((65535 - sideralSpeed) / (65535 - selectspeed));
  gotospeed := SelectSpeedf / SIDERALF;
  // tmp := (delta) / (gotospeed) * sign(delta);
  tmp := (delta) / (gotospeed / ArStepSize) * sign(delta);
  t := Round(tmp);
  GotoAr(trunc((dest + tmp) / ArStepSize));
  if abs(delta) > trunc(4.0 / ArStepSize) then
  // if abs(delta)> 4 then
  begin
    RaSlew := true;
    if delta < 0 then
      GoWest
    else
      GoEast;
  end
//  {
 else
   begin
   Raslew:=false;
   SelectSpeedf := SIDERALF;
    target_ra_speed := SelectSpeedf ;
  end;
 //
end;  }

procedure TTelescope.GotoSlewAr;
var
  tmp, dest: extended;
  gotospeed: extended;
  t, t1: Integer;
  b: Boolean;
begin
  // Getpos();
  dest := (15 * 3600.0 * Local_Sideral_Time(now)) - Ardest;
  if dest < 0 then
    dest := 3600 * 360 + dest;
  delta := (Local_RA_Position(now) * 3600 * 15) - dest;

  if (abs(delta) > (360 * 1800)) then
  begin
    delta := ((360 * 3600) - abs(delta)) * sign(-delta);
    b := true;
  end;
  if autoslew then
  begin
    // if abs(delta) <= trunc(radius_RA * 60.0 / arstepsize)  then SelectSpeedf:=Nearrate*SIDERALF
    if abs(delta) <= trunc(radius_RA * 60.0) then
    begin
      if lineal then
        SelectSpeedf := NearRate * SIDERALF
      else
       SelectSpeedf := MIN(Slewrate * SIDERALF,Max(SIDERALF, abs(delta)));
       // SelectSpeedf := MIN(Slewrate * SIDERALF,abs(delta));
     if basespeedbool then Set_Motor_slew_bit(DEVICE_AR, 255)
      // selectspeed := nearspeed
    end

    else
    begin
      SelectSpeedf := Slewrate * SIDERALF; // ; SetActualSpeed(CENTE;
      if basespeedbool then  Set_Motor_slew_bit(DEVICE_AR, 0)
    end;
  end;
  // gotospeed := abs((65535 - sideralSpeed) / (65535 - selectspeed));
  gotospeed := SelectSpeedf / SIDERALF;
  // tmp := (delta) / (gotospeed) * sign(delta);
  tmp := (delta) / (gotospeed / ArStepSize) * sign(delta);
  t := Round(tmp);
 if basespeedbool then  GotoAr(trunc((dest + tmp) / ArStepSize));
  if abs(delta) > trunc(4.0 / ArStepSize) then
 //  if abs(delta)> 4 then
  begin
    RaSlew := true;
    if delta < 0 then
      GoWest
    else
      GoEast;
  end

 else
   begin
   Raslew:=false;
   SelectSpeedf := SIDERALF;
    target_ra_speed := SelectSpeedf;
    current_ra_speed:=SelectSpeedf ;
  end;

end;

// ---------------------------------------------------------------------------
procedure TTelescope.GotoSlew;
var
  tmp, dest: extended;
  gotospeed: extended;
  t, t1: Integer;
  b: Boolean;
begin
  GotoSlewdec;
  GotoSlewAr;
end;

procedure TTelescope.SetDeviceSpeed;

var // outp: String;
  count: Integer;
  select: Char;
begin
  count := 6;
  case (index) of

    SLEW:
      select := #0;
    FIND:
      select := #1;
    CENTER:
      select := #2;
    GUIDE:
      select := #3;
    SIDERAL:
      select := #4;
    SLEWDEC:
      select := #6;
    FINDDEC:
      select := #7;
    CENTERDEC:
      select := #8;
    GUIDEDEC:
      select := #9;
    GUIDEEAST:
      select := #5;

  end;
  sleep(200);
  ChangeSpeedTable(device, value, ord(select));

end;

procedure TTelescope.SincroniceallDeviceSpeeds;
begin
  if (Connected) then
  begin
    SetDeviceSpeed(SlewSpeed, SLEW, DEVICE_AR);
    SetDeviceSpeed(FindSpeed - 1, FIND, DEVICE_AR);
    SetDeviceSpeed(CenterSpeed, CENTER, DEVICE_AR);
    SetDeviceSpeed(GuideSpeed, GUIDE, DEVICE_AR);
    SetDeviceSpeed(SideralSpeed, SIDERAL, DEVICE_AR);
    SetDeviceSpeed(SlewSpeedDec, SLEW, DEVICE_DE);
    SetDeviceSpeed(FindSpeedDec - 1, FIND, DEVICE_DE);
    SetDeviceSpeed(CenterSpeedDec, CENTER, DEVICE_DE);
    SetDeviceSpeed(GuideSpeedDec, GUIDE, DEVICE_DE);
    SetDeviceSpeed(0, SIDERAL, DEVICE_DE);
    SetDeviceSpeed(abs(GuideSpeedEast), GUIDEEAST, DEVICE_AR);
    SetDeviceSpeed(GuideSpeedDec, GUIDEEAST, DEVICE_DE);
    SetDeviceSpeed(FLspeed, FINDDEC, DEVICE_AR);
    SetDeviceSpeed(FFSpeed, SLEWDEC, DEVICE_AR);
    // SetDeviceSpeed(FFspeed-1, FINDDEC, DEVICE_AR);
    SaveEEPROMSettings;
  end;
end;

procedure TTelescope.SaveEEPROMSettings;
var
  outp: String;
  count: Integer;
begin
  sleep(200);

  SetMotorMaxCounter(DEVICE_AR, EncoderRaRes);
  sleep(300);
  SetMotorMaxCounter(DEVICE_DE, EncoderDecRes);
  sleep(300);
  saveConf(DEVICE_AR);
  sleep(200);
  UnSetStartUp(DEVICE_AR);
  sleep(200);
  saveConf(DEVICE_DE);
  sleep(200);
  UnSetStartUp(DEVICE_DE);
  sleep(200);
  if Track_Start then
    SetStartUp(DEVICE_AR);

  sleep(200);

end;

procedure TTelescope.SetZeroPos;
var
  outp: String;
  count: Integer;
begin
  SetMotorCounter(DEVICE_AR, encoderRares div 2);
  sleep(20);
  SetMotorCounter(DEVICE_DE, EncoderDecRes DIV 8);
  sleep(20);

end;

procedure TTelescope.SetMountWestSide;
var
  outp: String;
  count: Integer;
begin
  // outp := #0#7;
  // count := 3;
  // WriteCom(port, outp, count);
end;

procedure TTelescope.SetMountEastSide;
var
  outp: String;
  count: Integer;
begin
  // outp := #0#6;
  // count := 2;
  // WriteCom(port, outp, count);
end;

// ---------------------------------------------------------------------------
procedure TTelescope.Torque;
begin

  SetLedLevel(DEVICE_AR, b);
end;

// ----------------------------------------------------------------------------
procedure TTelescope.FocusHiSpeed;
var
  count: Integer;
  outp: String;
begin
  // outp:='#:FF#';
  // count:=4;//Length(outp);
  // WriteCom(port,outp,count);
end;

procedure TTelescope.FocusLowSpeed;
var
  count: Integer;
  outp: String;
begin
  // outp:='#:FS#';
  // count:=4;//Length(outp);
  // WriteCom(port,outp,count);
  // sleep(10)
end;

procedure TTelescope.Focusp;
var
  count: Integer;
  outp: String;
begin
  // outp:='#:F+#';
  // count:=4;//Length(outp);
  // WriteCom(port,outp,count);
  // setfocuserspeed(35);
  outp := '#:RC##:Mn#';
  count := 10; // Length(outp;
  WriteCom(port, outp, count);
end;

procedure TTelescope.sendcmd(S: string);
var
  count: Integer;
begin
  count := Length(S);
  WriteCom(port, S, count);
end;

procedure TTelescope.Focusl;
var
  count: Integer;
  outp: String;
begin

  outp := '#:RC##:Ms#';
  count := 13; // Length(outp;
  WriteCom(port, outp, count);
  // setfocuserspeed( - 35);
end;

procedure TTelescope.FocuStop;
var
  count: Integer;
  outp: String;
begin
  outp := '#:Qs#';
  count := 5; // Length(outp;
  WriteCom(port, outp, count);
  SetFocuserSpeed(0);

end;

function TTelescope.ProcessLX200C(command: String): String;
var
  responseStr, commando, temp: String;
  cadena: TStringList;
  N: Integer;
begin
  if command[1] = ':' then
    command := '#' + command;
  if command[1] = #6 then
    command := '#:' + command;
  temp := '';

  cadena := FormatString(command, '#:');
  for N := 1 to cadena.count - 1 do
  begin
    commando := cadena[N];
    responseStr := '';
    case commando[1] of
      #6:
        responseStr := 'G#'; // ';
      'F':
        case commando[2] of
          'F':
            FocusHiSpeed;
          '+':
            Focusp;
          '-':
            Focusl;
          'S':
            FocusLowSpeed;
          'Q':
            FocuStop;
        end;

      'C':
        case commando[2] of
          'M':
            begin
              if eqmount = ECUATOR then
              begin
                Sync(Pier_Side_East);
                responseStr := 'a saber#';
              end
              else
              begin
                alt_az_sync;
                responseStr := 'a saber#';
              end;
            end;
          'S':
            ;
        end;
      'G':
        case commando[2] of
          'D':
            if eqmount = ECUATOR then
              // if  guidelock then
              // responseStr := returnDecdest
              // else
              responseStr := ReturnDec
            else
              responseStr := returneq(FALSE);

          'R':
            if eqmount = ECUATOR then
              // if  guidelock then
              // responseStr := returnARdest(false)
              // else
              responseStr := ReturnAr

            else
              responseStr := returneq(true);
          'Z':
            if eqmount = ECUATOR then
            begin
              if Preci then
                responseStr := IntToDec(trunc(Azimuth(now) * 3600.0), 3)
              else
                responseStr := IntToDec(trunc(Azimuth(now) * 3600.0), 4)
            end
            else
            begin
              if Preci then
                responseStr := IntToDec(trunc(ArPos * ArStepSize), 3)
              else
                responseStr := IntToDec(trunc(ArPos * ArStepSize), 4);
            end;
          'A':
            if eqmount = ECUATOR then
            begin
              if Preci then
                responseStr := IntToDec(trunc(Altitude(now) * 3600.0), 3)
              else
                responseStr := IntToDec(trunc(Altitude(now) * 3600.0), 4)
            end
            else
            begin
              if Preci then
                responseStr := IntToDec(trunc(DecPos * DecStepSize), 3)
              else
                responseStr := IntToDec(trunc(DecPos * DecStepSize), 4);
            end;

          { if preci then
            responseStr := inttodec(trunc(altitude(now) * 3600.0), 1) else  responseStr := inttodec(trunc(altitude(now) * 3600.0), 2) }
        end;
      'V':
        responseStr := '110#';
        // if commando[3]='P' then responseStr:='LX200#' else responseStr:='110;

      'M':
        case commando[2] of
          'n':
            GoNorth;
          's':
            GoSouth;
          'e':
            GoEast;
          'w':
            GoWest;
          'S':
            begin
              if eqmount = ECUATOR then
              begin
                GotoSlew;
                responseStr := '0'
              end
              else
              begin // gotoslew_AltAz;
                responseStr := '0';
              end;;
            end;
        end;
      'Q':
        case commando[2] of
          'n':
            StopDec;
          's':
            StopDec;
          'e':
            SetSideralSpeed;
          'w':
            SetSideralSpeed;
        else
          SetSideralSpeed;
          StopDec;

        end;
      'R':
        case commando[2] of
          'C':
            SetActualSpeed(CENTER);
          'G':
            SetActualSpeed(GUIDE);
          'M':
            SetActualSpeed(FIND);
          'S':
            SetActualSpeed(SLEW);
        end;
      'U':
        Preci := NOT(Preci);
      'S':
        case commando[2] of
          'r':
            begin
              Ardest := LX200Artoint(commando, Preci);
              if NOT Pier_Side_East then
                Ardest := (Ardest + 180 * 3600) MOD (360 * 3600)
                // decdest:=180*3600-decdest;
                  ;

              responseStr := '1';
            end;
          'd':
            begin
              DecDest := LX200Dectoint(commando, Preci);
              if NOT Pier_Side_East then
                DecDest := signo(DecDest) * 180 * 3600 - DecDest;
              responseStr := '1';
            end;
        end;
      'L':
        if (commando[2] = 'K') AND (commando[3] = '1') then
          responseStr := 'Yes#';
    end;
    temp := temp + responseStr;
  end;
  if command = '#:GV#' then
  begin
    Preci := true;
    temp := '110#';
  end;
  ProcessLX200C := temp;
end;

procedure TTelescope.SetPWMAr(index, value: Integer);

begin

  changePWM(DEVICE_AR, byte(index), byte(value));
  sleep(100);
end;

procedure TTelescope.SetPWMde(index, value: Integer);
var
  count: Integer;
  outp: String;
begin

  changePWM(DEVICE_DE, index, value);
  sleep(100);
end;

procedure TTelescope.SetLocation(long, lat: String; offset: Integer);
begin
  Longitude := longitudetodeg(long);
  Latitude := latitudetodeg(lat);
  vlat := degtorad(Latitude);
  vlong := degtorad(Longitude);
  Gmtoffset := offset;
end;

function TTelescope.Local_Sideral_Time(localdatetime: Tdatetime): double;
var
  d, lst: double;
begin
  d := (DateTimeToJulianDate(localdatetime) - (Gmtoffset / 24.0)) - 2451545.0;
  lst := 18.697374558 + 24.06570982441908 * d;
  Local_Sideral_Time := 1.0 * (trunc(lst) MOD 24) + frac(lst) - Longitude /
    15.0; // result hours
end;

function TTelescope.Local_RA_Position(localdatetime: Tdatetime): double;
var
  ha: extended;
begin
  // ha:=Local_Sideral_Time(localdatetime)- ReturnAR_h/(3600*15);
  // if ha<0 then ha:=24.0+ha;
  // local_RA_position:=ha   ;
  // result hours
  Local_RA_Position := (ArPos * ArStepSize / (3600.0 * 15));
end;

function TTelescope.Azimuth(localdatetime: Tdatetime): double;
var
  h, la, d, tmp, tmp2: extended;
begin
  tmp := 0.0;
  if NOT(Pier_Side_East) then
    tmp := 180.0;
  h := degtorad((ArPos * ArStepSize / 3600));
  la := degtorad(Latitude);
  d := degtorad(DecPos * DecStepSize / 3600.0);
  tmp2 := 180 + tmp + radtodeg(arctan2(sin(h), cos(h) * sin(la) - tan(d) *
    cos(la)));
  if tmp2 > 360.0 then
    Azimuth := tmp2 - 360.0
  else
    Azimuth := tmp2;

end;

function TTelescope.Altitude(localdatetime: Tdatetime): double;
var
  h, la, d: extended;
begin
  h := degtorad((ArPos * ArStepSize) / 3600.0);
  la := degtorad(Latitude);
  d := degtorad((DecPos * DecStepSize) / 3600.0);
  Altitude := 90.0 - radtodeg(arccos(sin(la) * sin(d) + cos(la) * cos(d)
    * cos(h)));

end;

function TTelescope.Pier_Side_East(): Boolean;
begin
  Pier_Side_East := (abs(DecPos) <= (EncoderDecRes DIV 4))
end;

procedure TTelescope.SavePrescaler(p: byte);

begin
  if p = 0 then
  begin
    SetPrescaler(DEVICE_AR, 21);
    sleep(50);
    SetPrescaler(DEVICE_DE, 21);

  end
  else
  if p=1 then
  begin
    SetPrescaler(DEVICE_AR, 37);
    sleep(50);
    SetPrescaler(DEVICE_DE, 37);

  end else
    begin
    SetPrescaler(DEVICE_AR, 53);
    sleep(50);
    SetPrescaler(DEVICE_DE, 53);

  end


end;

procedure TTelescope.SaveBaudRate(p: Char);
var
  outp: String;
  count: Integer;
begin
  SetBaudRate(DEVICE_AR, ord(p));
  sleep(50);
  SetBaudRate(DEVICE_DE, ord(p));
  sleep(50);
end;

function TTelescope.ThreadedMotorControl(Parameter: Pointer): Integer;
var
  startcount, endcount, frequency: int64;

begin
  // QueryPerformanceFrequency(frequency);
  current_de_speed := 15.0;
  target_de_speed := 0.0;
  // ra_accel:=150.0;
  current_de_speed := 0.0;
  target_de_speed := 0.0;
  de_accel := 150.0;
  while Run do
  begin
    // QueryPerformanceCounter(Startcount);
    sleep(30);
    // getpos();
    if (current_ra_speed <> target_ra_speed) then
    begin
      if abs(target_ra_speed - current_ra_speed) < abs(RaRamp) then
      begin
        current_ra_speed := target_ra_speed;

      end;

      if current_ra_speed < target_ra_speed then
        current_ra_speed := current_ra_speed + RaRamp

      else if current_ra_speed > target_ra_speed then
        current_ra_speed := current_ra_speed - RaRamp;
      // ----chapuza
      if (forbidden_enable) AND (abs(current_ra_speed) > (forbidden_min)) and
        (abs(current_ra_speed) < (forbidden_max)) then
        set_az_speed(signof(current_ra_speed) * (forbidden_min))
      else
        set_az_speed(current_ra_speed);
    end;
    if (current_de_speed <> target_de_speed) then

    begin
      if abs(target_de_speed - current_de_speed) <= abs(DERamp) then
      begin
        current_de_speed := target_de_speed;
        if (forbidden_enable) AND (abs(current_de_speed) > (forbidden_min_dec))
          and (abs(current_de_speed) < (forbidden_max_dec)) then
          set_alt_speed(signof(current_de_speed) * (forbidden_min_dec))
        else
          set_alt_speed(current_de_speed);
        if not(autoguide_mode) then
          if target_de_speed = 0.0 then
            SetDecSpeed(0)
      end

      else
      begin
        if current_de_speed < target_de_speed then
          current_de_speed := current_de_speed + DERamp
        else if current_de_speed > target_de_speed then
          current_de_speed := current_de_speed - DERamp;

        if (forbidden_enable) AND (abs(current_de_speed) > (forbidden_min_dec))
          and (abs(current_de_speed) < (forbidden_max_dec)) then
          set_alt_speed(signof(current_de_speed) * (forbidden_min_dec))
        else
          set_alt_speed(current_de_speed);
      end

    end;
    // QueryPerformanceCounter(endcount);tick:=(-Startcount +endcount)/frequency;
    // Startcount:=endcount;
  end;
end;

function TTelescope.decguide: Integer;
begin
  sleep(decpulse);
  decpulse := 0;
  StopDec;
  pguiding := FALSE;
  result := 0;
  // Sync(Pier_Side_East)
end;

function TTelescope.arguide: Integer;
begin
  sleep(arpulse);
  SetSideralSpeed;
  pguiding := FALSE;
  arpulse := 0;
  result := 0;
  // Sync(Pier_Side_East)
end;

procedure TTelescope.SetFocuserPos(x: Integer);
begin
  SetAuxCounter(DEVICE_AR, x);
end;

procedure TTelescope.FocusConfig(res: double; max, back, s1, s2, f1, f2, f3,
  f4: Integer);
var
  sback: Smallint;
begin
  FLspeed := trunc(1 / (FC_TIMER_TICK * s1));
  FFSpeed := trunc(1 / (s2 * FC_TIMER_TICK));
  FocusStepSize := res;
  focusmaxStep := max;
  focusbackslash := back;
  eye1 := f1;
  eye2 := f2;
  eye3 := f3;
  eye4 := f4;
  sback := back;
  SetAuxBackslash(DEVICE_AR, sback)
end;

procedure TTelescope.AuxConfig(res: double; max, back, s1, s2, f1, f2, f3, f4,
  f5, f6, f7, f8: Integer);
var
  sback: Smallint;
begin

  AXLspeed := trunc(1 / (FC_TIMER_TICK * s1));
  AXFSpeed := trunc(1 / (s2 * FC_TIMER_TICK));
  auxStepSize := res;
  auxmaxStep := max;
  auxbackslash := back;
  aux[0] := f1;
  aux[1] := f2;
  aux[2] := f3;
  aux[3] := f4;
  aux[4] := f5;
  aux[5] := f6;
  aux[6] := f7;
  aux[7] := f8;

  sback := back;
  SetAuxBackslash(DEVICE_DE, sback)
end;

procedure TTelescope.GotoFocuser(de: Integer);
var
  buff: String;
  count: Integer;
  fspeed: Integer;
begin
  if de <= 0 then
    de := 0;
  focusdest := de;
  // inc(de);
  SetAuxTarget(DEVICE_AR, de);
  if FocusSeleclSpeed then
    fspeed := FLspeed
  else
    fspeed := FFSpeed;
  SetFocuserSpeed(fspeed * signo(de - focuspos));
end;

procedure TTelescope.SetauxPos(x: Integer);
var
  buff: string;
  count: Integer;
begin
  SetAuxCounter(DEVICE_DE, x);
end;

procedure TTelescope.GotoAux(au: Integer);
var
  buff: String;
  count: Integer;
begin

  SetAuxTarget(DEVICE_DE, au);
  SetAuxSpeed(AXLspeed * signo(au - auxpos));
end;

Procedure TTelescope.set_az_speed;
// Procedure set_az_speed(mstep_speed:extended);
var
  base, Speed, postscaler: Integer;
  buffer: string;
  count: Integer;
begin
  base := 0; // (65535-base) precarga de timer PIC
  postscaler := 0; // numero de iteraciones del timer
  if abs(mstep_speed) > 0.0000001 then
  begin
    // calculo periodo
    // mstep velocidad a fijar en arcsec/segundos
    base := trunc(ArStepSize / (abs(mstep_speed) * RA_timertick));
    Speed := signo(base);
    postscaler := base div 65535;
    if postscaler > 0 then
    begin
      base := base div (postscaler + 1);
      // inc(postscaler);
    end;
    inc(postscaler);
  end;

  rr := base;
  // inc(tracecount);
  tracecount := tracecount mod 20 + 1;
  tracesp[tracecount] := rr;
  MotorSetPeriod(DEVICE_AR, word(65535 - base), signof1(mstep_speed) *
    postscaler);
end;

Procedure TTelescope.set_alt_speed;
// Procedure set_az_speed(mstep_speed:extended);
var
  base, Speed, postscaler: Integer;
  buffer: string;
  count: Integer;
begin
  base := 0; // (65535-base) precarga de timer PIC
  postscaler := 0; // numero de iteraciones del timer
  if abs(mstep_speed) > 0.00001 then
  begin
    // calculo periodo
    // mstep velocidad a fijar en arcsec/segundos
    base := trunc(DecStepSize / (abs(mstep_speed) * DE_timertick));
    Speed := signo(base);
    postscaler := base div 65535;
    if postscaler > 0 then
    begin
      base := base div (postscaler + 1);
      // inc(postscaler);
    end;
    inc(postscaler);
  end;

  MotorSetPeriod(DEVICE_DE, word(65535 - base), signof1(mstep_speed) *
    postscaler);
end;

procedure TTelescope.GotoAuxIndex(index: Integer);
begin
  auxindex := index;
  GotoAux(aux[index]);
end;

procedure TTelescope.calib;
begin
  SetCalPWM(DEVICE_AR, b)
end;

procedure TTelescope.calibdec;
begin
  SetCalPWM(DEVICE_DE, b)
end;

procedure TTelescope.arblock;
begin

  MotorSetPeriod(DEVICE_AR, 1, 0);
end;

procedure TTelescope.setzeropec();
begin
  GetPos();
  zeropec := ArPos
end;

procedure TTelescope.deblock;
begin

  MotorSetPeriod(DEVICE_DE, 0, 0);
end;

procedure TTelescope.SetPWM_Hz(p: Char);
var
  outp: String;
  count: Integer;
begin
  SetPWMFreq(DEVICE_AR, byte(p));

end;

function TTelescope.get_current_filter(): Smallint;
var
  lindex: Smallint;
begin
  lindex := 6;
  repeat
    dec(lindex)
  until (lindex = 0) or (aux[lindex] = auxpos);
  get_current_filter := lindex;
end;

Procedure TTelescope.track_speeds(var vaz, valt: extended);
var
  azimut, lat, alt: extended;
begin
  // getpos;
  azimut := degtorad(ArPos * ArStepSize / 3600.0);
  alt := degtorad(DecPos * DecStepSize / 3600.0);
  if eqmount = ALTAZ then
    lat := degtorad(Latitude)
  else
    lat := vlat;
  valt := 15.0 * 1.002737907 * sin(azimut) * cos(lat);
  vaz := 15.0 * 1.002737907 * (sin(lat) + cot(pi / 2 + alt) * cos(azimut) *
    cos(lat));
  // vaz:=-15.0*sin(az)*cos(az);
end;

Procedure TTelescope.gotoslew_AltAz;
var
  Ar, dec, az, alt: extended;
  dest_az, dest_alt: Integer;
  ardist: Boolean;
  count: Integer;
  buff: string;
begin
  Ar := degtorad(Ardest / 3600.0);
  dec := degtorad(DecDest / 3600.0);
  Eq_to_alaz(Ar, dec, az, alt, now);
  dest_az := trunc(radtodeg(az) * 3600.0 / ArStepSize);
  dest_alt := trunc(radtodeg(alt) * 3600.0 / DecStepSize);
  ardist := abs(dest_az - ArPos) > (EncoderRaRes div 2);
  GotoAr(dest_az);
  GotoDec(dest_alt);
  if dest_az > ArPos then
    if not ardist then
      GoWest
    else
      GoEast;
  if dest_az < ArPos then
    if not ardist then
      GoEast
    else
      GoWest;
  if dest_alt > DecPos then
    GoNorth
  else
    GoSouth;

end;

Procedure TTelescope.set_az_speed_direct(mstep_speed: double);
begin
  set_az_speed(mstep_speed);
  current_ra_speed := mstep_speed;
  target_ra_speed := current_ra_speed
end;

Procedure TTelescope.set_alt_speed_direct(mstep_speed: double);
begin
  set_alt_speed(mstep_speed);
  current_de_speed := mstep_speed;
  target_de_speed := current_de_speed
end;

procedure TTelescope.Eq_to_alaz(Ar, dec: extended; var az, alt: extended;
  localdatetime: Tdatetime);
var
  h, la, sin_alt, sina_az, sin_az, cos_az: extended;
begin
  h := degtorad(Local_Sideral_Time(localdatetime) * 15) - Ar;
  la := degtorad(Latitude);
  sin_alt := sin(dec) * sin(la) + cos(dec) * cos(la) * cos(h);
  alt := arcsin(sin_alt);
  // if abs(alt)=pi then alt:=alt+1e-6;
  sin_az := -sin(h) * cos(dec) / cos(alt);
  // if abs(la)=pi then la:=la+1e-6;

  cos_az := (sin(dec) - sin(la) * sin_alt) / (cos(la) * cos(alt));
  // az:=arcsin(sin_az);
  az := arctan2(sin_az, cos_az);
  if az < 0 then
    az := 2 * pi + az;
end;

procedure TTelescope.altaztoEQ(var Ar, dec: extended; az, alt: extended;
  localdatetime: Tdatetime);
var
  h, la, d, tmp, tmp2, cosh, sinh: extended;
begin
  la := degtorad(Latitude);
  dec := arcsin((sin(alt) * sin(la) + cos(alt) * cos(la) * cos(az)));
  tmp := cos(la) * cos(dec);
  if tmp <> 0.0 then
    cosh := (sin(alt) - (sin(la) * sin(dec))) / tmp;
  sinh := -sin(az) * cos(alt) / cos(dec);
  h := abs(arcsin(sinh));
  if sinh > 0 then
  begin
    if cosh > 0 then
      Ar := h
    else
      Ar := pi - h;
  end
  else
  begin
    if cosh > 0 then
      Ar := -h
    else
      Ar := pi + h;
  end;

end;

function TTelescope.returneq(arreq: Boolean): string;
var
  Ar, dec, ax: extended;
  tmp1: Integer;
  starl: star;
begin
  if Preci then
    tmp1 := 1
  else
    tmp1 := 2;
  starl.az := degtorad(ArPos * ArStepSize) / 3600.0;
  starl.alt := degtorad(DecPos * DecStepSize / 3600.0);

  if eqmount = ALTAZ then
  begin
    altaztoEQ(starl.ra, starl.dec, starl.az, starl.alt, now);
    ax := -radtodeg(starl.ra) + Local_Sideral_Time(now) * 15;
  end
  else
  begin
    QueryPerformanceCounter(starl.sys_ticks);
    mount_to_equ(starl);
    ax := radtodeg(starl.ra);
  end;

  if arreq then
    returneq := Inttoar(trunc(ax * 3600.0), tmp1)
  else
    returneq := IntToDec(trunc(radtodeg(starl.dec) * 3600.0), tmp1);
end;

procedure TTelescope.alt_az_sync;
var
  count: Integer;
  buff: string;
  starl: star;
begin
  starl.ra := degtorad(Ardest / 3600.0);
  starl.dec := degtorad(DecDest / 3600.0);
  QueryPerformanceCounter(starl.sys_ticks);
  if eqmount = ALTAZ then
    Eq_to_alaz(starl.ra, starl.dec, starl.az, starl.alt, now)
  else
    equ_to_mount(starl);

  SetMotorCounter(DEVICE_AR, trunc(radtodeg(starl.az) * 3600.0 / ArStepSize));
  sleep(200);
  if starl.alt < 0.0 then
    starl.alt := 2 * pi - starl.alt;
  SetMotorCounter(DEVICE_DE, trunc(radtodeg(starl.alt) * 3600.0 / DecStepSize));

  sleep(200);

end;

Procedure TTelescope.Geo_data_align;
var
  lst, ra, dec, az, alt: extended;
begin
  { ra:=270;
    dec:=43;
    reset(0.0,0.0,0.0);
    lst:=Local_sideral_time(now) * 15;
    ahora:=gettickcount/60000;
    Eq_to_alaz(degtorad(ra),degtorad(dec),az,alt,now);
    az:=radtodeg(az); alt:=radtodeg(alt);
    addstar(ra,dec,0,az,alt);
    ra:=20;
    dec:=-49;
    Eq_to_alaz(degtorad(ra),degtorad(dec),az,alt,now);
    az:=radtodeg(az); alt:=radtodeg(alt);
    addstar(ra,dec,0,az,alt); }
  // addstar(360-(lst-90),0,ahora,270,0);
  // addstar(360-lst,latitude,ahora, 180.0,90.0);
  ra := 06;
  Local_Sideral_Time(now);
  dec := 43;
  set_z(0, 0, 0);
  QueryPerformanceCounter(ahorai);
  Eq_to_alaz(degtorad(ra * 15), degtorad(dec), az, alt, now);
  az := radtodeg(az);
  alt := radtodeg(alt);
  set_star(starA[1], ra, dec, az, alt, ahorai);
  ra := 18;
  dec := 0;
  QueryPerformanceCounter(ahorai);
  Eq_to_alaz(degtorad(ra * 15), degtorad(dec), az, alt, now);
  az := radtodeg(az);
  alt := radtodeg(alt);
  set_star(starA[2], ra, dec, az, alt, ahorai);
  DSC_generate_transform_matrices(starA[1], starA[2], starA[3]);

end;

procedure TTelescope.get_Zenith(var ra, dec: extended);
begin
  // tel2equ((Arpos*arstepSize/3600.0)+180,(deccurrent/3600.0)+180,gettickcount/60000-ahora,ra,dec);
  // tel2equ(270,0,gettickcount/60000-ahora,ra,dec);
  starw.az := degtorad(ArPos * ArStepSize / 3600.0);
  starw.alt := degtorad(DecCurrent / 3600.0);
  QueryPerformanceCounter(ahorai);
  starw.sys_ticks := ahorai;
  DSC_Ra_Dec_from_Alt_Az(starw);
  // FloatEditArC.value:=radtodeg(starw.ra)/15;FloatEditdecC.value:=radtodeg(starw.dec);
  ra := starw.ra;
  dec := starw.dec;
end;

procedure TTelescope.set_align_star(RightAscension, Declination: double);
begin

  QueryPerformanceCounter(ahorai);
  set_star(starA[alignmode], RightAscension, Declination,
    (ArPos * ArStepSize / 3600.0), DecCurrent / 3600.0, ahorai);
  // DSC_generate_transform_matrices (stara[1], stara[2], starA[3]);

end;

procedure TTelescope.align_now;
begin
  DSC_generate_transform_matrices(starA[1], starA[2], starA[3]);
  get_Zenith1(vlong, vlat)
end;

procedure TTelescope.get_Zenith1(var ra, dec: extended);
begin
  starw.az := degtorad(180);
  starw.alt := degtorad(90);
  QueryPerformanceCounter(ahorai);
  starw.sys_ticks := ahorai;
  DSC_Ra_Dec_from_Alt_Az(starw);
  ra := starw.ra;
  dec := starw.dec;

end;

procedure TTelescope.equ_to_mount(var starp: star);
begin
  QueryPerformanceCounter(ahorai);
  starp.sys_ticks := ahorai;
  DSC_Alt_Az_from_Ra_Dec(starp);
end;

procedure TTelescope.mount_to_equ(var starp: star);
begin
  QueryPerformanceCounter(ahorai);
  starp.sys_ticks := ahorai;
  DSC_Ra_Dec_from_Alt_Az(starp);
end;

procedure TTelescope.setRAbackslash(backslash: Smallint; active: byte);

begin
  SetMotorBackslash(DEVICE_AR, backslash);
  SetMotorBackslashMode(DEVICE_AR, active);

end;

procedure TTelescope.setDEcbackslash(backslash: Smallint; active: byte);
begin
  SetMotorBackslash(DEVICE_DE, backslash);
  SetMotorBackslashMode(DEVICE_DE, active);
end;

procedure TTelescope.SetfocusbackslashStatus(active: byte);
begin
  SetAuxBackslashMode(DEVICE_AR, active);
end;

procedure TTelescope.SetauxbackslashStatus(active: byte);
begin
  SetAuxBackslashMode(DEVICE_AR, active);
end;

function TTelescope.GetRaSpeed(): Integer;
var
  base: word;
  mult, sig: shortint;
  F: byte;
begin
  ReadSpeed(DEVICE_AR);
  Getspeed(base, mult, sig, F);
  result := (65535 - base) * mult * sig;
end;

procedure TTelescope.changeM(piersideeast: Boolean);
var
  buff: String;
  artemp: extended;
  count: Integer;
  dectemp: Integer;
  temp: Integer;
begin
  GetPos();
  artemp := (ArPos + EncoderRaRes div 2) mod EncoderRaRes;
  SetMotorCounter(DEVICE_AR, trunc(artemp));
  sleep(10);
  if deccounter <= (EncoderDecRes div 2) then
    dectemp := (EncoderDecRes div 2) - deccounter
  else
    dectemp := (EncoderDecRes + EncoderDecRes div 2) - deccounter;
  SetMotorCounter(DEVICE_DE, dectemp);
  sleep(10);
end;

function TTelescope.worm_angle(): Real;
var
  angle: Real;
begin

  angle := (ArPos - zeropec) mod pe_size;
  if angle <0.0 then angle :=pe_size+angle;
  if angle < 0.0 then
    angle := 360.0 + angle;
  angle := (angle * (86400.0/ARgear)) / pe_size;
  result := angle;
end;

function TTelescope.PicTime: cardinal;
var
  tick: cardinal;
  control: byte;
begin
  readtime(253);
  if GetTime(tick, control) then
    result := tick
  else
    result := 0;
end;

end.
