unit PicgotoPLusWi;

interface

uses
  ComObj, ActiveX, PicgotoPlus_TLB, picgoto;

const
  DRIVER_NAME = 'PicgotoPlus';
  DRIVER_ID = DRIVER_NAME + '.FilterWheel';

type
  TpgtFilterWheel = class(TAutoObject, IFilterWheel)
  protected
    function Get_Connected: WordBool; safecall;
    procedure Set_Connected(Value: WordBool); safecall;
    function Get_FocusOffsets: PSafeArray; safecall;
    function Get_Position: Smallint; safecall;
    procedure Set_Position(pVal: Smallint); safecall;
    function Get_Names: PSafeArray; safecall;
    procedure SetupDialog; safecall;
    // property Connected: WordBool read Get_Connected write Set_Connected;
    // property FocusOffsets: PSafeArray read Get_FocusOffsets;
    // property Position: Smallint read Get_Position write Set_Position;
    // property Names: PSafeArray read Get_Names;
  public
  end;

implementation

uses ComServ, sysutils, Dialogs, Controls, ShellAPI;

function TpgtFilterWheel.Get_Connected: WordBool;
begin
  Get_Connected := true
end;

Procedure TpgtFilterWheel.Set_Connected(Value: WordBool);
begin
end;

function TpgtFilterWheel.Get_FocusOffsets: PSafeArray;
begin
end;

function TpgtFilterWheel.Get_Position: Smallint;
begin
  if tele.auxindex > 0 then
    Get_Position := Smallint(tele.auxindex)
  else
    Get_Position := Smallint(tele.get_current_filter());
end;

procedure TpgtFilterWheel.Set_Position(pVal: Smallint);
begin
  tele.gotoauxindex(pVal);
end;

function TpgtFilterWheel.Get_Names: PSafeArray;
begin
end;

procedure TpgtFilterWheel.SetupDialog;
begin
end;

{ -------------------------------------------------------------- }
procedure RegisterThySelf;
{ -------------------------------------------------------------- }
// Test id this interface is registered int he ASCOM registry area
// If not register it so the Choose can find it and also to store persistent data
var
  ProfileObject: Variant;

begin

  ProfileObject := CreateOLEObject('ASCOM.Utilities.Profile');
  // ProfileObject := CreateOLEObject('DriverHelper.Profile');
  ProfileObject.DeviceType := 'FilterWheel';
  if (not ProfileObject.IsRegistered(DRIVER_ID)) then
  begin
    ShowMessage('Self-Registering: ASCOM ' + DRIVER_ID);
    ProfileObject.Register(DRIVER_ID, 'Picgoto++ FW');

  end;
end;

initialization

CoInitializeex(nil, COINIT_APARTMENTTHREADED);
RegisterThySelf;
TAutoObjectFactory.Create(ComServer, TpgtFilterWheel, Class_FilterWheel,
  cimultiInstance, tmApartment);

// initial/default values
end.end.
