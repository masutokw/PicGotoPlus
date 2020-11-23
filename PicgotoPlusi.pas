unit PicgotoPlusi;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  dialogs, ComObj, ActiveX, PicgotoPlus_TLB, StdVcl, setupfrm, Picgoto, ptool,
  math, classes;

const
  DRIVER_NAME = 'PicgotoPlus';
  DRIVER_ID = DRIVER_NAME + '.Telescope';

type
  TTrackingRates = class(TAutoObject, ITrackingRates)
  private
    lrates: tcollection;
  protected
    function Get_Count: Integer; safecall;
    function Get_Item(Index: Integer): DriveRates; safecall;
    function GetEnumerator: IEnumVARIANT; safecall;
  end;

type
  TTelescope = class(TAutoObject, ITelescope)
  public
    function Get_AlignmentMode: AlignmentModes; safecall;
    function Get_Altitude: Double; safecall;
    function Get_ApertureArea: Double; safecall;
    function Get_ApertureDiameter: Double; safecall;
    function Get_AtHome: WordBool; safecall;
    function Get_AtPark: WordBool; safecall;
    function Get_Azimuth: Double; safecall;
    function Get_CanFindHome: WordBool; safecall;
    function Get_CanPark: WordBool; safecall;
    function Get_CanPulseGuide: WordBool; safecall;
    function Get_CanSetDeclinationRate: WordBool; safecall;
    function Get_CanSetGuideRates: WordBool; safecall;
    function Get_CanSetPark: WordBool; safecall;
    function Get_CanSetPierSide: WordBool; safecall;
    function Get_CanSetRightAscensionRate: WordBool; safecall;
    function Get_CanSetTracking: WordBool; safecall;
    function Get_CanSlew: WordBool; safecall;
    function Get_CanSlewAltAz: WordBool; safecall;
    function Get_CanSlewAltAzAsync: WordBool; safecall;
    function Get_CanSlewAsync: WordBool; safecall;
    function Get_CanSync: WordBool; safecall;
    function Get_CanSyncAltAz: WordBool; safecall;
    function Get_CanUnpark: WordBool; safecall;
    function Get_Connected: WordBool; safecall;
    procedure Set_Connected(Value: WordBool); safecall;
    function Get_Declination: Double; safecall;
    function Get_DeclinationRate: Double; safecall;
    procedure Set_Declination(Value: Double); safecall;
    procedure Set_DeclinationRate(Value: Double); safecall;
    function Get_Description: WideString; safecall;
    function Get_DoesRefraction: WordBool; safecall;
    function Get_DriverInfo: WideString; safecall;
    procedure Set_DoesRefraction(Value: WordBool); safecall;
    function Get_DriverVersion: WideString; safecall;
    function Get_EquatorialSystem: EquatorialCoordinateType; safecall;
    function Get_FocalLength: Double; safecall;
    function Get_GuideRateDeclination: Double; safecall;
    function Get_GuideRateRightAscension: Double; safecall;
    function Get_InterfaceVersion: SYSINT; safecall;
    function Get_IsPulseGuiding: WordBool; safecall;
    function Get_Name: WideString; safecall;
    procedure Set_GuideRateDeclination(Value: Double); safecall;
    procedure Set_GuideRateRightAscension(Value: Double); safecall;
    function Get_RightAscension: Double; safecall;
    function Get_RightAscensionRate: Double; safecall;
    function Get_SideOfPier: PierSide; safecall;
    procedure Set_RightAscensionRate(Value: Double); safecall;
    procedure Set_SideOfPier(Value: PierSide); safecall;
    function Get_SiderealTime: Double; safecall;
    function Get_SiteElevation: Double; safecall;
    function Get_SiteLatitude: Double; safecall;
    function Get_SiteLongitude: Double; safecall;
    procedure Set_SiteElevation(Value: Double); safecall;
    procedure Set_SiteLatitude(Value: Double); safecall;
    procedure Set_SiteLongitude(Value: Double); safecall;
    function Get_Slewing: WordBool; safecall;
    function Get_SlewSettleTime: SYSINT; safecall;
    function Get_TargetDeclination: Double; safecall;
    function Get_TargetRightAscension: Double; safecall;
    function Get_Tracking: WordBool; safecall;
    function Get_TrackingRate: DriveRates; safecall;
    procedure Set_SlewSettleTime(Value: SYSINT); safecall;
    procedure Set_TargetDeclination(Value: Double); safecall;
    procedure Set_TargetRightAscension(Value: Double); safecall;
    procedure Set_Tracking(Value: WordBool); safecall;
    procedure Set_TrackingRate(Value: DriveRates); safecall;
    function Get_TrackingRates: ITrackingRates; safecall;
    function Get_UTCDate: TDateTime; safecall;
    procedure Set_UTCDate(Value: TDateTime); safecall;
    procedure AbortSlew; safecall;
    procedure AxisRates(Axis: TelescopeAxes); safecall;
    function CanMoveAxis(Axis: TelescopeAxes): WordBool; safecall;
    procedure CommandBlind(const Command: WideString; Raw: WordBool); safecall;
    procedure CommandBool(const Command: WideString; Raw: Integer); safecall;
    procedure CommandString(const Command: WideString; Raw: WordBool); safecall;
    procedure DestinationSideOfPier(RightAscension,
      Declination: Double); safecall;
    procedure FindHome; safecall;
    procedure MoveAxis(Axis: TelescopeAxes; Rate: Double); safecall;
    procedure Park; safecall;
    procedure PulseGuide(Direction: GuideDirections;
      Duration: Integer); safecall;
    procedure SetPark; safecall;
    procedure SetUpDialog; safecall;
    procedure SlewToAltAz(Azimut, Altitude: Double); safecall;
    procedure SlewToAltAzAsync(Azimut, Altitude: Double); safecall;
    procedure SlewToCoordinates(RightAscension, Declination: Double); safecall;
    procedure SlewToCoordinatesAsync(RightAscension: Double;
      Declination: Double); safecall;
    procedure SlewToTarget; safecall;
    procedure SlewToTargetAsync; safecall;
    procedure SyncToAltAz(Azimuth, Altitude: Double); safecall;
    procedure SyncToCoordinates(RightAscension: Double;
      Declination: Double)safecall;
    procedure SyncToTarget(); safecall;
    procedure Unpark; safecall;
    { Protected declarations }

  end;

implementation

uses ComServ, sysutils;

var
  connection_status: boolean;
  ProfileObject, ASCOMexcept: Variant;
  dpf: TMain;
  trackr: TTrackingRates;
  ratearr: array [0 .. 3] of DriveRates;
  // trackbit:boolean;
  ra_target, dec_target: Double;

procedure pup;
begin
  main.BorderIcons := [];
  Picgoto.main.Caption := legend + ' COM server';
  Picgoto.main.Show;
  Picgoto.Tele.Preci := true;
  // main.Buttonclose.Visible:=true;
  connection_status := true;

end;

procedure pdown;

begin
  // picgoto.Main.hide;
  connection_status := false;
end;

function sendCommand(cmd: string): string;
var
  n: cardinal;
  response: string;
begin

  response := Picgoto.Tele.ProcessLX200C(cmd);
  if NOT(Picgoto.main.checkboxlogtcp.Checked) then
    if (Picgoto.main.memotraffic.Lines.Count < 10) then
      Picgoto.main.memotraffic.Lines.Add(cmd + ' ' + response)
    else
      Picgoto.main.memotraffic.Lines.clear;
  sendCommand := response;

end;

function TTelescope.Get_AlignmentMode: AlignmentModes;
begin
  if ord(Tele.eqmount) = 0 then
    Get_AlignmentMode := 1
  else
    Get_AlignmentMode := 0
end;

function TTelescope.Get_Altitude: Double;
var
  response: string;
  temp, signo: Integer;
begin
  response := sendCommand('#:GA#');
  if response[length(response)] = '#' then
  begin

    if (response[1] = '-') then
      signo := -1
    else
      signo := 1;

    temp := strtoint(copy(response, 2, 2)) * 3600 +
      strtoint(copy(response, 5, 2)) * 60;
    if length(response) > 8 then
      temp := temp + strtoint(copy(response, 8, 2));
  end;

  Get_Altitude := (temp / 3600.0) * signo;
end;

function TTelescope.Get_ApertureArea: Double;
begin
  Get_ApertureArea := 1.0;
end;

function TTelescope.Get_ApertureDiameter: Double;
begin
  Get_ApertureDiameter := 1.0
end;

function TTelescope.Get_AtHome: WordBool;
begin
  Get_AtHome := false;
end;

function TTelescope.Get_AtPark: WordBool;
begin
  Get_AtPark := false;
end;

function TTelescope.Get_Azimuth: Double;

var
  response: string;
  temp: Integer;
begin
  response := sendCommand('#:GZ#');
  if response[length(response)] = '#' then
  begin
    if length(response) = 10 then
      temp := (strtoint(copy(response, 1, 3)) * 3600 + strtoint(copy(response,
        5, 2)) * 60 + strtoint(copy(response, 8, 2)))
    else
      temp := (strtoint(copy(response, 1, 3)) * 3600 + strtoint(copy(response,
        5, 2) + copy(response, 8, 1)) * 6);
  end;

  Get_Azimuth := temp / 3600.0;

end;

function TTelescope.Get_CanFindHome: WordBool;
begin
  Get_CanFindHome := false;
end;

function TTelescope.Get_CanPark: WordBool;
begin
  Get_CanPark := false;
end;

function TTelescope.Get_CanPulseGuide: WordBool;
begin
  Get_CanPulseGuide := true;

end;

function TTelescope.Get_CanSetDeclinationRate: WordBool;
begin
  Get_CanSetDeclinationRate := false;
end;

function TTelescope.Get_CanSetGuideRates: WordBool;
begin
  Get_CanSetGuideRates := false;
end;

function TTelescope.Get_CanSetPark: WordBool;
begin
  Get_CanSetPark := false;
end;

function TTelescope.Get_CanSetPierSide: WordBool;
begin
  Get_CanSetPierSide := false;
end;

function TTelescope.Get_CanSetRightAscensionRate: WordBool;
begin
  Get_CanSetRightAscensionRate := false;
end;

function TTelescope.Get_CanSetTracking: WordBool;
begin
  Get_CanSetTracking := true;
end;

function TTelescope.Get_CanSlew: WordBool;
begin
  Get_CanSlew := true;
end;

function TTelescope.Get_CanSlewAltAz: WordBool;
begin
  Get_CanSlewAltAz := true;
end;

function TTelescope.Get_CanSlewAltAzAsync: WordBool;
begin
  Get_CanSlewAltAzAsync := true;
end;

function TTelescope.Get_CanSlewAsync: WordBool;
begin
  Get_CanSlewAsync := true;
end;

function TTelescope.Get_CanSync: WordBool;
begin
  Get_CanSync := true;
end;

function TTelescope.Get_CanSyncAltAz: WordBool;
begin
  Get_CanSyncAltAz := false;
end;

function TTelescope.Get_CanUnpark: WordBool;
begin
  Get_CanUnpark := false;
end;

function TTelescope.Get_Connected: WordBool;
begin
  Get_Connected := connection_status;

  ;
end;

procedure TTelescope.Set_Connected(Value: WordBool);
begin
  if Value then
    if not connection_status then
      pup;
  if not Value then
    pdown;
end;

function TTelescope.Get_Declination: Double;
var
  response: string;
  temp, signo: Integer;
begin
  response := sendCommand('#:GD#');
  if response[length(response)] = '#' then
  begin

    if (response[1] = '-') then
      signo := -1
    else
      signo := 1;

    temp := strtoint(copy(response, 2, 2)) * 3600 +
      strtoint(copy(response, 5, 2)) * 60;
    if length(response) > 8 then
      temp := temp + strtoint(copy(response, 8, 2));
    // clientsocket1.Socket.SendText(response);
  end;

  Get_Declination := (temp / 3600.0) * signo;

end;

function TTelescope.Get_DeclinationRate: Double;
begin
  Get_DeclinationRate := 0.0;
end;

procedure TTelescope.Set_Declination(Value: Double);
begin
  raise EOLEexception.Create('Not Implemented', $80040400, 'none', '0', 0);

end;

procedure TTelescope.Set_DeclinationRate(Value: Double);
begin
  raise EOLEexception.Create('Not Implemented', $80040400, 'none', '0', 0);
end;

function TTelescope.Get_Description: WideString;
begin
  Get_Description := 'Picgoto Driver';
end;

function TTelescope.Get_DoesRefraction: WordBool;
begin
  Get_DoesRefraction := false;
end;

function TTelescope.Get_DriverInfo: WideString;
begin
  result := 'Dual PIC based telescope';
end;

procedure TTelescope.Set_DoesRefraction(Value: WordBool);
begin

end;

function TTelescope.Get_DriverVersion: WideString;
begin
  Get_DriverVersion := '2.2.12';
end;

function TTelescope.Get_EquatorialSystem: EquatorialCoordinateType;
begin
  result := equLocalTopocentric;
end;

function TTelescope.Get_FocalLength: Double;
begin
  Get_FocalLength := 1000;
end;

function TTelescope.Get_GuideRateDeclination: Double;
begin
  result := 0;
end;

function TTelescope.Get_GuideRateRightAscension: Double;
begin
  raise EOLEexception.Create('Not Implemented', $80040400, 'none', '0', 0);
end;

function TTelescope.Get_InterfaceVersion: SYSINT;
begin
  Get_InterfaceVersion := 2;
end;

function TTelescope.Get_IsPulseGuiding: WordBool;
begin
  Get_IsPulseGuiding := Tele.Pguiding;
end;

function TTelescope.Get_Name: WideString;
begin
  Get_Name := 'PicgotoDriver++';
end;

procedure TTelescope.Set_GuideRateDeclination(Value: Double);
begin
  raise EOLEexception.Create('Not Implemented', $80040400, 'none', '0', 0);
end;

procedure TTelescope.Set_GuideRateRightAscension(Value: Double);
begin
  raise EOLEexception.Create('Not Implemented', $80040400, 'none', '0', 0);
end;

function TTelescope.Get_RightAscension: Double;
var
  response: string;
  temp: Integer;
begin
  response := sendCommand('#:GR#');
  if response[length(response)] = '#' then
  begin
    if length(response) = 9 then
      temp := (strtoint(copy(response, 1, 2)) * 3600 + strtoint(copy(response,
        4, 2)) * 60 + strtoint(copy(response, 7, 2)))
    else
      temp := (strtoint(copy(response, 1, 2)) * 3600 + strtoint(copy(response,
        4, 2) + copy(response, 7, 1)) * 6);
  end;

  Get_RightAscension := temp / 3600.0;
end;

function TTelescope.Get_RightAscensionRate: Double;
begin

end;

function TTelescope.Get_SideOfPier: PierSide;
begin

end;

procedure TTelescope.Set_RightAscensionRate(Value: Double);
begin
  raise EOLEexception.Create('Not Implemented', $80040400, 'none', '0', 0);
  // raise Exception.Create('Not Implemented');
end;

procedure TTelescope.Set_SideOfPier(Value: PierSide);
begin
  raise EOLEexception.Create('Not Implemented', $80040400, 'none', '0', 0);
end;

function TTelescope.Get_SiderealTime: Double;
begin
  result := Tele.Local_Sideral_Time(now);
end;

function TTelescope.Get_SiteElevation: Double;
begin
  result := 0
end;

function TTelescope.Get_SiteLatitude: Double;
begin
  result := Tele.Latitude
end;

function TTelescope.Get_SiteLongitude: Double;
begin
  result := Tele.Longitude
end;

procedure TTelescope.Set_SiteElevation(Value: Double);
begin
  // raise Exception.Create('Not Implemented');
end;

procedure TTelescope.Set_SiteLatitude(Value: Double);
begin
  if abs(Value) > 90.0 then
    raise EOLEexception.Create('Not Implemented', $80040400, 'none', '0', 0)
  else
    Tele.Latitude := Value;

end;

procedure TTelescope.Set_SiteLongitude(Value: Double);
begin
  if abs(Value) > 180.0 then
    raise EOLEexception.Create('Not Implemented', $80040400, 'none', '0', 0)
  else
    Tele.Longitude := Value;
  // raise  EOLEexception.Create('Not Implemented',$80040400,'none','0',0);
end;

function TTelescope.Get_Slewing: WordBool;
begin

end;

function TTelescope.Get_SlewSettleTime: SYSINT;
begin

end;

function TTelescope.Get_TargetDeclination: Double;
begin
  result := dec_target
end;

function TTelescope.Get_TargetRightAscension: Double;
begin
  result := ra_target
end;

function TTelescope.Get_Tracking: WordBool;
begin
  Picgoto.main.memotraffic.Lines.Add('tracking=' + booltostr(Tele.trackbit));
  result := Tele.trackbit;
end;

function TTelescope.Get_TrackingRate: DriveRates;
begin
  result := driveSidereal;
end;

procedure TTelescope.Set_SlewSettleTime(Value: SYSINT);
begin
  raise EOLEexception.Create('Not Implemented', $80040400, 'none', '0', 0);
end;

procedure TTelescope.Set_TargetDeclination(Value: Double);
begin
  // sendcommand('#:Sr '+DoubleToLXAr(RightAscension,1));
  if abs(Value) < 90 then
  begin
    sendCommand('#:Sd ' + DoubletoLXdec(Value, 1));
    dec_target := Value;
  end
  else
    raise EOLEexception.Create('Value Not Set 1', $80040402, 'none', '0', 0);

end;

procedure TTelescope.Set_TargetRightAscension(Value: Double);
begin
  sendCommand('#:Sr ' + DoubleToLXAr(Value, 1));
  ra_target := Value;
  raise EOLEexception.Create('Not Implemented', $80040400, 'none', '0', 0);
  // raise Exception.Create('Not Implemented');
end;

procedure TTelescope.Set_Tracking(Value: WordBool);

begin
  Picgoto.main.memotraffic.Lines.Add('set_tracking=' + booltostr(Value));
  Tele.trackbit := Value;
  // raise  EOLEexception.Create('Not Implemented',$80040400,'none','0',0);
  if ord(Tele.eqmount) = 0 then
  begin
    if Value then
      Tele.SetSideralSpeed
    else
      Tele.stopAR;
    Tele.setDecspeed(0);;
  end;
end;

procedure TTelescope.Set_TrackingRate(Value: DriveRates);
begin
  raise EOLEexception.Create('Not Implemented', $80040400, 'none', '0', 0);
end;

function TTelescope.Get_TrackingRates: ITrackingRates;
begin
  result := trackr;
  // raise Exception.Create('Not Implemented');
  raise EOLEexception.Create('Not Implemented', $80040400, 'none', '0', 0);
end;

function TTelescope.Get_UTCDate: TDateTime;
begin
  result := now - Tele.Gmtoffset / 24;
end;

procedure TTelescope.Set_UTCDate(Value: TDateTime);
begin
  // raise Exception.Create('Not Implemented');
end;

procedure TTelescope.AbortSlew;
begin

  Tele.SetSideralSpeed;
  Tele.stopdec;
end;

procedure TTelescope.AxisRates(Axis: TelescopeAxes);
begin
  // raise  EOLEexception.Create('Not Implemented',$80040400,'none','0',0);
end;

function TTelescope.CanMoveAxis(Axis: TelescopeAxes): WordBool;
begin
  result := Axis <> axisTertiary;
end;

procedure TTelescope.CommandBlind(const Command: WideString; Raw: WordBool);
begin
  raise Exception.Create('Not Implemented');
end;

procedure TTelescope.CommandBool(const Command: WideString; Raw: Integer);
begin
  raise Exception.Create('Not Implemented');
end;

procedure TTelescope.CommandString(const Command: WideString; Raw: WordBool);
begin
  raise EOLEexception.Create('Not Implemented', $80040400, 'none', '0', 0);
end;

procedure TTelescope.DestinationSideOfPier(RightAscension, Declination: Double);
begin
  raise EOLEexception.Create('Not Implemented', $80040400, 'none', '0', 0);
end;

procedure TTelescope.FindHome;
begin

end;

procedure TTelescope.MoveAxis(Axis: TelescopeAxes; Rate: Double);
var
  speed: Double;
begin
  speed := Rate * 3600;
  case Axis of
    axisPrimary:
      Tele.target_ra_speed := speed;
    axisSecondary:
      Tele.target_de_speed := speed;
  end;
  Picgoto.main.memotraffic.Lines.Add(inttostr(Axis) + '--' + floattostr(Rate));
end;

procedure TTelescope.Park;
begin
  raise EOLEexception.Create('Not Implemented', $80040400, 'none', '0', 0);
end;

{ procedure TTelescope.PulseGuide(Direction: GuideDirections;
  Duration: Integer);
  var  card_point:string;
  begin

  sendcommand('#:RG#');
  Case Direction of

  guideNorth:    card_point:='n';
  guideSouth:    card_point:='s';
  guideEast:    card_point :='e';
  guideWest:    card_point :='w';
  end ;
  sendcommand('#:M' + card_point +'#');
  sleep(Duration);
  sendcommand('#:Q' + card_point+'#');
  end; }
procedure TTelescope.PulseGuide(Direction: GuideDirections; Duration: Integer);
var
  card_point: string;
var
  t: tthreadfunc;
begin
  Tele.Pguiding := true;
  sendCommand('#:RG#');
  Tele.guidelock := true;
  main.CheckBoxtguide.Checked := main.CheckBoxlocktarget.Checked;
  Case Direction of

    guideNorth:
      begin
        Tele.decpulse := Duration;
        sendCommand('#:Mn#');
        Picgoto.initdopulsedec;
      end;
    guideSouth:
      begin
        Tele.decpulse := Duration;
        sendCommand('#:Ms#');
        Picgoto.initdopulsedec;
      end;
    guideEast:
      begin
        Tele.arpulse := Duration;
        sendCommand('#:Me#');
        Picgoto.initdopulsear;
      end;
    guideWest:
      begin
        Tele.arpulse := Duration;
        sendCommand('#:Mw#');
        Picgoto.initdopulsear;
      end;
  end;
  Picgoto.main.memotraffic.Lines.Add(inttostr(ord(Direction)) + '--' +
    inttostr(Duration));

end;

procedure TTelescope.SetPark;
begin
  raise EOLEexception.Create('Not Implemented', $80040400, 'none', '0', 0);
end;

procedure TTelescope.SetUpDialog;
var
  setup: TSetupDialogForm;
begin
  // setup:=TSetupDialogForm.create(nil);
  // setupfrm.SetupDialogForm.ShowModal;
end;

procedure TTelescope.SlewToAltAz(Azimut, Altitude: Double);
var
  ar, dec: extended;
begin
  Picgoto.main.memotraffic.Lines.Add(floattostr(Azimut) + '' +
    floattostr(Altitude));
  if Altitude > 0.0 then
  begin
    Tele.altaztoEQ(ar, dec, degtorad(Azimut), degtorad(Altitude), now);
    ar := -radtodeg(ar) + Tele.Local_Sideral_Time(now) * 15;
    sendCommand('#:Sr ' + DoubleToLXAr(ar / 15, 1));
    sendCommand('#:Sd ' + DoubletoLXdec(radtodeg(dec), 1));
    sendCommand('#:MS#');
    // raise  EOLEexception.Create('Not Implemented',$80040400,'none','0',0);
  end;
end;

procedure TTelescope.SlewToAltAzAsync(Azimut, Altitude: Double);
var
  ar, dec: extended;
begin
  Picgoto.main.memotraffic.Lines.Add(floattostr(Azimut) + '' +
    floattostr(Altitude));
  Tele.altaztoEQ(ar, dec, degtorad(Azimut), degtorad(Altitude), now);
  ar := -radtodeg(ar) + Tele.Local_Sideral_Time(now) * 15;
  sendCommand('#:Sr ' + DoubleToLXAr(ar / 15, 1));
  sendCommand('#:Sd ' + DoubletoLXdec(radtodeg(dec), 1));
  sendCommand('#:MS#');
  // raise  EOLEexception.Create('Not Implemented',$80040400,'none','0',0);
end;

procedure TTelescope.SlewToCoordinates(RightAscension, Declination: Double);
var // response:string;
  received: Integer;
  n: cardinal;

  buffer: array [0 .. 50] of char;
begin
  Tele.guidelock := false;
  main.CheckBoxtguide.Checked := false;
  sendCommand('#:Sr ' + DoubleToLXAr(RightAscension, 1));
  sendCommand('#:Sd ' + DoubletoLXdec(Declination, 1));
  sendCommand('#:MS#');
end;

procedure TTelescope.SlewToCoordinatesAsync(RightAscension: Double;
  Declination: Double); safecall;
begin
  // raise  EOLEexception.Create('Not Implemented',$80040400,'none','0',0);
  Tele.guidelock := false;
  main.CheckBoxtguide.Checked := false;
  sendCommand('#:Sr ' + DoubleToLXAr(RightAscension, 1));
  sendCommand('#:Sd ' + DoubletoLXdec(Declination, 1));
  sendCommand('#:MS#');
end;

procedure TTelescope.SlewToTarget;
begin
  Tele.guidelock := false;
  main.CheckBoxtguide.Checked := false;
  sendCommand('#:MS#');
end;

procedure TTelescope.SlewToTargetAsync;
begin
  Tele.guidelock := false;
  main.CheckBoxtguide.Checked := false;
  sendCommand('#:MS#');
end;

procedure TTelescope.SyncToAltAz(Azimuth, Altitude: Double);
begin
  // raise Exception.Create('Invalid Value 1');
  raise EOLEexception.Create('Not Implemented', $80040400, 'none', '0', 0);
end;

procedure TTelescope.SyncToCoordinates(RightAscension: Double;
  Declination: Double); safecall;
var // response:string;
  buffer: array [0 .. 50] of char;
  received: string;
  n: cardinal;
begin
  if (Picgoto.Tele.alignmode = 0) then
  begin
    received := sendCommand('#:Sr ' + DoubleToLXAr(RightAscension, 1) + '#') +
      sendCommand('#:Sd ' + DoubletoLXdec(Declination, 1) + '#');
    sendCommand('#:CM#');
  end
  else
    Picgoto.Tele.set_align_star(RightAscension, Declination);

end;

procedure TTelescope.SyncToTarget();
begin
  sendCommand('#:CM#');
end;

procedure TTelescope.Unpark;
begin
  raise EOLEexception.Create('Not Implemented', $80040400, 'none', '0', 0);
end;

procedure RegisterThySelf;
{ -------------------------------------------------------------- }
// Test id this interface is registered int he ASCOM registry area
// If not register it so the Choose can find it and also to store persistent data

begin
  ProfileObject := CreateOLEObject('ASCOM.Utilities.Profile');
  // ProfileObject := CreateOLEObject('DriverHelper.Profile');

  ProfileObject.DeviceType := 'Telescope';

  // ASCOM.NotImplementedException("xxx" + e.Message,e);

  if (not ProfileObject.IsRegistered(DRIVER_ID)) then
  begin
    ShowMessage('Self-Registering: ASCOM ' + DRIVER_ID);
    ProfileObject.Register(DRIVER_ID, 'Picgoto ++ Driver');

  end;
  // ASCOMExcept:=CreateOLEObject('ASCOM.exceptions');

end;

function TTrackingRates.Get_Count: Integer; safecall;
begin
  result := 3;
end;

function TTrackingRates.Get_Item(Index: Integer): DriveRates; safecall;
begin
  case index of
    0:
      result := driveSidereal;
    1:
      result := driveLunar;
    2:
      result := driveSolar;
    3:
      result := driveKing;
  end;
end;

function TTrackingRates.GetEnumerator: IEnumVARIANT;
begin
  result := self as IEnumVARIANT;
end;

initialization

CoInitializeex(nil, COINIT_APARTMENTTHREADED);
RegisterThySelf;

TAutoObjectFactory.Create(ComServer, TTrackingRates, Class_TrackingRates,
  cimultiInstance, tmApartment);

TAutoObjectFactory.Create(ComServer, TTelescope, Class_Telescope,
  cimultiInstance, tmApartment);

end.
