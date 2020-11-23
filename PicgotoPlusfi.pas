unit PicgotoPlusfi;
// (via the RegisterThySelf procedure)

interface

uses
  ComObj, ActiveX, PicgotoPlus_TLB, picgoto;

const
  DRIVER_NAME = 'PicgotoPlus';
  DRIVER_ID = DRIVER_NAME + '.Focuser';

type
  TpgtFocuser = class(TAutoObject, IFocuser)
  protected
    function Get_IsMoving: wordbool; safecall;
    function Get_Link: wordbool; safecall;
    Procedure Set_Link(value: wordbool); safecall;
    function Get_MaxIncrement: integer; safecall;
    function Get_Position: integer; safecall;
    function Get_StepSize: double; safecall;
    function Get_TempComp: wordbool; safecall;
    Procedure Set_TempComp(value: wordbool); safecall;
    function Get_Temperature: double; safecall;
    Procedure Set_Temperature(value: double); safecall;
    procedure SetupDialog; safecall;
    procedure Halt; safecall;
    procedure move(val: integer); safecall;
    function Get_Absolute: wordbool; safecall;
    function Get_MaxStep: integer; safecall;
    procedure Set_MaxStep(value: integer); safecall;
    function Get_TempCompAvailable: wordbool; safecall;

  end;

implementation

uses ComServ, sysutils, Dialogs, Controls, ShellAPI;

var
  fCOMPort: integer;
  fMaxStep: integer;
  tempcomp: wordbool;

function TpgtFocuser.Get_IsMoving: wordbool;
begin
  // picgoto.main.memotraFfic.Lines.Add( 'is moving'+inttostr(tele.focusdest-tele.focuspos));
  Get_IsMoving := not((tele.focusdest = tele.focuspos) or
    not(tele.focusmoving));
end;

function TpgtFocuser.Get_Link: wordbool;
begin
  Get_Link := true;
end;

Procedure TpgtFocuser.Set_Link(value: wordbool);
begin

end;

function TpgtFocuser.Get_MaxIncrement: integer;
begin
  Get_MaxIncrement := tele.focusmaxStep;
end;

function TpgtFocuser.Get_Position: integer;
begin
  Get_Position := tele.focuspos;
  // picgoto.main.memotraFfic.Lines.Add( 'getpos'+ inttostr(Tele.focuspos));
end;

function TpgtFocuser.Get_StepSize: double;
begin
  Get_StepSize := tele.FocusStepSize;
end;

function TpgtFocuser.Get_TempComp: wordbool;
begin
  Get_TempComp := tempcomp;
end;

Procedure TpgtFocuser.Set_TempComp(value: wordbool);
begin
  tempcomp := value;
end;

function TpgtFocuser.Get_Temperature: double;
begin
  Get_Temperature := 30.0;
end;

Procedure TpgtFocuser.Set_Temperature(value: double);
begin
end;

procedure TpgtFocuser.Halt;
begin
  tele.SetFocuserSpeed(0)
end;

procedure TpgtFocuser.move(val: integer);
begin
  if (val <= tele.focusmaxStep) and (not tempcomp) then
    tele.GotoFocuser(val)
  else
    raise Exception.Create('Invalid Value 1');
  // picgoto.main.memotraFfic.Lines.Add(inttostr(val));

end;

{ -------------------------------------------------------------- }
procedure TpgtFocuser.SetupDialog;
{ -------------------------------------------------------------- }
// var
// fSetupForm: TSetupForm;

begin
  // fSetupForm := TSetupForm.Create(nil);
  // fSetupForm.COMPortCombo.ItemIndex := fCOMPort - 1;
  // normally would use the ASCOM registry area for persistent storage of values
  // fSetupForm.MaxStepEdit.Text := IntToStr(fMaxStep);
  // fSetupForm.ShowModal;
  // if (fSetupForm.ModalResult = mrOK) then
  // begin
  // fMaxStep := StrToInt(fSetupForm.MaxStepEdit.Text);
  // fCOMPort := fSetupForm.COMPortCombo.ItemIndex + 1;
  // end;
  // fSetupForm.Free;
end;

{ -------------------------------------------------------------- }
function TpgtFocuser.Get_Absolute: wordbool;
{ -------------------------------------------------------------- }
begin
  result := true;
end;

{ -------------------------------------------------------------- }
function TpgtFocuser.Get_MaxStep: integer;
{ -------------------------------------------------------------- }
begin
  result := tele.focusmaxStep; // fMaxStep;
end;

{ -------------------------------------------------------------- }
procedure TpgtFocuser.Set_MaxStep(value: integer);
{ -------------------------------------------------------------- }
begin
  fMaxStep := tele.focusmaxStep;
end;

{ -------------------------------------------------------------- }
function TpgtFocuser.Get_TempCompAvailable: wordbool;
{ -------------------------------------------------------------- }
begin
  result := true;
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

 //  ProfileObject := CreateOLEObject('DriverHelper.Profile');
  ProfileObject.DeviceType := 'Focuser';

  if (not ProfileObject.IsRegistered(DRIVER_ID)) then
  begin
    ShowMessage('Self-Registering: ASCOM ' + DRIVER_ID);
    ProfileObject.Register(DRIVER_ID, 'Picgoto Plus');
    // set persistent default values if any
  end;

end;

initialization

CoInitializeex(nil, COINIT_APARTMENTTHREADED);
RegisterThySelf;
TAutoObjectFactory.Create(ComServer, TpgtFocuser, Class_Focuser,
  cimultiInstance, tmApartment);

// initial/default values
// fCOMPort := 1;
// fMaxStep :=50000;
end.
