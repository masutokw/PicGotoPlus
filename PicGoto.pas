// TcpServer and visual interface for picgoto
// Author: Angel Caparrós

unit PicGoto;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, Graphics,
  Dialogs, Telescope, IniFiles, Mask, ptool, DateUtils,
  Buttons, DdeMan, math, mmsystem,  ExtCtrls,system.types,system.StrUtils,

  StdCtrls, ComCtrls, JvHidControllerClass, ScktComp, adpInstanceControl,
  Vcl.XPMan, JvComponentBase, tagraph, EnhEdits,Joystickex, registry, Vcl.Themes,
  IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient;
//

type
  TMain = class(TForm)
    PageControlConf: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBoxAxis: TGroupBox;
    LongEditGearAr: TLongEdit;
    LongEditGearDe: TLongEdit;
    FloatEditRedAr: TFloatEdit;
    FloatEditRedDec: TFloatEdit;
    LongEditStepAr: TLongEdit;
    LongEditStepDe: TLongEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    Save: TButton;
    GroupBoxPosition: TGroupBox;
    TabSheet3: TTabSheet;
    GroupBoxTraffic: TGroupBox;
    MemoTraffic: TMemo;
    TabSheet4: TTabSheet;
    GroupBoxSerial: TGroupBox;
    ComboBoxPort: TComboBox;
    ComboBoxBps: TComboBox;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    LongEditTimeout: TLongEdit;
    StaticText8: TStaticText;
    ButtonSaveEEprom: TButton;
    TabSheet5: TTabSheet;
    GroupBox1: TGroupBox;
    StaticText9: TStaticText;
    LongEditSlew: TLongEdit;
    StaticText13: TStaticText;
    StaticText14: TStaticText;
    LongEditFind: TLongEdit;
    StaticText10: TStaticText;
    StaticText11: TStaticText;
    LongEditCenter: TLongEdit;
    StaticText15: TStaticText;
    StaticText12: TStaticText;
    StaticText16: TStaticText;
    LongEditSlewDe: TLongEdit;
    LongEditFindDe: TLongEdit;
    LongEditCenterDe: TLongEdit;
    FloatEditGuide: TFloatEdit;
    FloatEditGuideDec: TFloatEdit;
    Label3: TLabel;
    Label10: TLabel;
    TabSheet6: TTabSheet;
    GroupBoxRaMotors: TGroupBox;
    LongEdit1: TLongEdit;
    LongEdit2: TLongEdit;
    LongEdit3: TLongEdit;
    LongEdit4: TLongEdit;
    LongEdit5: TLongEdit;
    LongEdit6: TLongEdit;
    LongEdit7: TLongEdit;
    LongEdit8: TLongEdit;
    LongEdit9: TLongEdit;
    LongEdit10: TLongEdit;
    StaticText19: TStaticText;
    StaticText20: TStaticText;
    StaticText21: TStaticText;
    StaticText22: TStaticText;
    StaticText23: TStaticText;
    StaticText24: TStaticText;
    StaticText25: TStaticText;
    StaticText26: TStaticText;
    StaticText27: TStaticText;
    StaticText28: TStaticText;
    CheckBoxNMenable: TCheckBox;
    ButtonPWM: TButton;
    Panel2: TPanel;
    LabelAR1: TLabel;
    LabelDec1: TLabel;
    GroupBox4: TGroupBox;
    GroupBoxHost: TGroupBox;
    EditAddr: TEdit;
    ButtonListen: TButton;
    ButtonServerClose: TButton;
    LongEditPort: TLongEdit;
    CheckBoxLogTCP: TCheckBox;
    GroupBox7: TGroupBox;
    CheckBoxNMsteps: TCheckBox;
    Elbrus: TGroupBox;
    MaskEditAr: TMaskEdit;
    MaskEditDec: TMaskEdit;
    StaticText17: TStaticText;
    LabelHourAngle: TLabel;
    ButtonSync: TButton;
    Buttongoto: TButton;
    LabelAzimuth: TLabel;
    LabelAltitude: TLabel;
    StaticText18: TStaticText;
    StaticText33: TStaticText;
    LongEditpoll: TLongEdit;
    Label25: TLabel;
    TabSheet7: TTabSheet;
    GroupBox8: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    LabelEncDec: TLabel;
    Laberarpos: TLabel;
    Label31: TLabel;
    CheckRunP: TCheckBox;
    TabSheet8: TTabSheet;
    GroupBox9: TGroupBox;
    GroupBox10: TGroupBox;
    buttonbaudrate: TButton;
    StaticText35: TStaticText;
    LongEditRAramp: TLongEdit;
    LongEditDeRamp: TLongEdit;
    ButtonElbrus: TButton;
    Label16: TLabel;
    Label17: TLabel;
    LabePierSide: TLabel;
    GroupBoxState: TGroupBox;
    labelarmspeed: TLabel;
    labeldemspeed: TLabel;
    Buttonch_timer: TButton;
    CheckBoxTarget: TCheckBox;
    labelRAStatus: TLabel;
    LabelDecStatus: TLabel;
    Label14: TLabel;
    Label33: TLabel;
    Labeldexpeed: TLabel;
    Labelraxpeed: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    CheckBoxAutoslew: TCheckBox;
    GroupBox12: TGroupBox;
    LongEdit_RA_Radius: TLongEdit;
    LongEdit_DE_Radius: TLongEdit;
    StaticText29: TStaticText;
    LongEditNearRA: TLongEdit;
    LongEditNearde: TLongEdit;
    StaticText30: TStaticText;
    StaticText31: TStaticText;
    StaticText32: TStaticText;
    StaticText36: TStaticText;
    CheckBoxSmartGoto: TCheckBox;
    CheckBox2: TCheckBox;
    GroupBox14: TGroupBox;
    CheckBox1: TCheckBox;
    ButtonConnect: TButton;
    Button2: TButton;
    Buttonf: TButton;
    Buttonfast: TButton;
    Buttonmm: TButton;
    Buttonfm: TButton;
    Labelfocus: TLabel;
    GroupBoxcoords: TGroupBox;
    labelAR: TLabel;
    Labeldec: TLabel;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label21: TLabel;
    FloatEditPrescaler: TFloatEdit;
    RadioPresc4: TRadioButton;
    RadioPresc8: TRadioButton;
    Button3: TButton;
    Label11: TLabel;
    GroupBox5: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label29: TLabel;
    MaskEditLong: TMaskEdit;
    MaskEditLat: TMaskEdit;
    EditLocation: TEdit;
    LongEditGMT: TLongEdit;
    Button_loc: TButton;
    CheckBoxDLST: TCheckBox;
    GroupBox13: TGroupBox;
    Label2: TLabel;
    Label8: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    LongEditFocusmax: TLongEdit;
    LongEditFocusBack: TLongEdit;
    LongEditFocusfinespeed: TLongEdit;
    LongEditFocusMaxSpeed: TLongEdit;
    FloatEditfocusres: TFloatEdit;
    StaticText37: TStaticText;
    StaticText38: TStaticText;
    StaticText39: TStaticText;
    StaticText40: TStaticText;
    StaticText41: TStaticText;
    GroupBox15: TGroupBox;
    Label20: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    LongEditTopRcounter: TLongEdit;
    LongEditRotbackSlash: TLongEdit;
    LongEdittRotFspeed: TLongEdit;
    LongEdittRotFFspeed: TLongEdit;
    FloatEditrotstepangle: TFloatEdit;
    StaticText42: TStaticText;
    StaticText43: TStaticText;
    StaticText44: TStaticText;
    StaticText45: TStaticText;
    StaticText46: TStaticText;
    LongEditeye1: TLongEdit;
    LongEditeye2: TLongEdit;
    LongEditeye3: TLongEdit;
    LongEditeye4: TLongEdit;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    LongEditAux1: TLongEdit;
    Label51: TLabel;
    LongEditAux2: TLongEdit;
    Label52: TLabel;
    LongEditAux3: TLongEdit;
    Label53: TLabel;
    LongEditAux4: TLongEdit;
    Label54: TLabel;
    LongEditaux5: TLongEdit;
    Label55: TLabel;
    LongEditaux6: TLongEdit;
    Button6: TButton;
    FloatEdit1: TFloatEdit;
    TrackBar1: TTrackBar;
    Edit1: TEdit;
    Button7: TButton;
    Label56: TLabel;
    ButtonFocusUpdate: TButton;
    Button8: TButton;
    CheckBox6: TCheckBox;
    LongEdit1d: TLongEdit;
    LongEdit2d: TLongEdit;
    LongEdit3d: TLongEdit;
    LongEdit4d: TLongEdit;
    LongEdit5d: TLongEdit;
    LongEdit6d: TLongEdit;
    LongEdit7d: TLongEdit;
    LongEdit8d: TLongEdit;
    LongEdit9d: TLongEdit;
    LongEdit10d: TLongEdit;
    ButtonchangePWM2: TButton;
    FloatEdit2: TFloatEdit;
    Button9: TButton;
    Label57: TLabel;
    TrackBar2: TTrackBar;
    Button10: TButton;
    Button11: TButton;
    Tracktune: TTrackBar;
    Buttonblock: TButton;
    Label5: TLabel;
    Button12: TButton;
    Tracktunedec: TTrackBar;
    checkboxtrack: TCheckBox;
    Labeldelta: TLabel;
    Label59: TLabel;
    Label58: TLabel;
    Labeldeltalt: TLabel;
    align: TTabSheet;
    GroupBox17: TGroupBox;
    GroupBox18: TGroupBox;
    Radiostar1: TRadioButton;
    RadioButton3: TRadioButton;
    Radiostar3: TRadioButton;
    Radionoalign: TRadioButton;
    Label28: TLabel;
    Buttongetzenith: TButton;
    Button_align: TButton;
    GroupBox19: TGroupBox;
    Label27: TLabel;
    Button15: TButton;
    Label26: TLabel;
    FloatEditz1: TFloatEdit;
    FloatEditz2: TFloatEdit;
    FloatEditz3: TFloatEdit;
    Button14: TButton;
    Radiomount: TRadioGroup;
    Label32: TLabel;
    LongEditbackshDe: TLongEdit;
    LongEditbackshar: TLongEdit;
    StaticText47: TStaticText;
    Buttonbackra: TButton;
    Buttonbackde: TButton;
    CheckBsa: TCheckBox;
    CheckBsd: TCheckBox;
    CheckBoxbsf: TCheckBox;
    CheckBoxbsaux: TCheckBox;
    Label30: TLabel;
    DdeClientConv1: TDdeClientConv;
    DdeClientItem1: TDdeClientItem;
   // LX200Server: TServerSocket;
    Joystickex1: TJoystickex;
    TrackBarLed: TTrackBar;
    memolog: TMemo;
    LongEditFocusReset: TLongEdit;
    Label35: TLabel;
    CheckBoxpark: TCheckBox;
    CheckBoxtguide: TCheckBox;
    CheckBoxlocktarget: TCheckBox;
    buttonMeridian: TButton;
    Button16: TButton;
    GroupBox16: TGroupBox;
    CheckBox3: TCheckBox;
    Buttonenableres: TButton;
    LongEditforb_min: TLongEdit;
    LongEditForb_max: TLongEdit;
    Button18: TButton;
    LongEditforb_min_dec: TLongEdit;
    LongEditForb_max_dec: TLongEdit;
    CheckBoxZone: TCheckBox;
    Label41: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    GroupBox3: TGroupBox;
    CheckBoxJoyF: TCheckBox;
    CheckBox5: TCheckBox;
    Timer1: TTimer;
    Panel3: TPanel;
    Button20: TButton;
    Button19: TButton;
    CheckBoxPec: TCheckBox;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label69: TLabel;
    LongEditaux7: TLongEdit;
    Label70: TLabel;
    LongEditaux8: TLongEdit;
    GroupBoxHid: TGroupBox;
    lstHidDevices: TListBox;
    Label71: TLabel;
    Checkboxgoto: TCheckBox;
    adpInstanceControl1: TadpInstanceControl;
    JvHidDeviceController: TJvHidDeviceController;
    TAChartPEC: TTAChart;
    Button1: TButton;
    Label34: TLabel;
    LongEditwres: TLongEdit;
    GroupBox20: TGroupBox;
    ComboBox1: TComboBox;
    TrackBar3: TTrackBar;
    CheckBox4: TCheckBox;
    Rates: TGroupBox;
    RadioButtonSolar: TRadioButton;
    RadioButtonlunar: TRadioButton;
    RadioButtonsid: TRadioButton;
    RadioButtonking: TRadioButton;
    RadioButton1: TRadioButton;
    Label4: TLabel;
    Button13: TButton;
    RadioPresc16: TRadioButton;
    lx200server: TServerSocket;
    FloatEditPE: TFloatEdit;
    Button22: TButton;
    FloatEditPE2: TFloatEdit;
    FloatEditphase: TFloatEdit;
    RadioGroup1: TRadioGroup;
    Button23: TButton;
    Label6: TLabel;
    GroupBox21: TGroupBox;
    GroupBox11: TGroupBox;
    LabelFocusCount: TLabel;
    Button4: TButton;
    Button5: TButton;
    Buttoneye1: TButton;
    Buttoneye2: TButton;
    Buttoneye3: TButton;
    Buttoneye4: TButton;
    GroupBox6: TGroupBox;
    LabelWheelCount: TLabel;
    Buttonwheelcc: TButton;
    Buttonwheelcw: TButton;
    Buttonaux1: TButton;
    Buttonaux2: TButton;
    Buttonaux3: TButton;
    Buttonaux4: TButton;
    Buttonaux5: TButton;
    Buttonaux6: TButton;
    Buttonaux8: TButton;
    Buttonaux7: TButton;
    Panel1: TPanel;
    Shape1: TShape;
    ButtonNE: TButton;
    ButtonN: TButton;
    ButtonNW: TButton;
    ButtonW: TButton;
    ButtonSW: TButton;
    ButtonS: TButton;
    ButtonH: TButton;
    ButtonE: TButton;
    ButtonSE: TButton;
    RadioButtonSlew: TRadioButton;
    RadioButtonCenter: TRadioButton;
    RadioButtonFind: TRadioButton;
    RadioButtonGuide: TRadioButton;
    ButtonPark: TButton;
    Buttonfold: TButton;
    Button17: TButton;
    Buttonclose: TButton;
    Button21: TButton;
    IdUDPClientEnc: TIdUDPClient;
    Button24: TButton;
    Label1: TLabel;
    EditUDPaddr: TEdit;
    Label7: TLabel;
    Label15: TLabel;
    Label64: TLabel;
    Label68: TLabel;
    procedure SaveSetting;
    procedure ReadSettings;
    procedure Save_Mount;
     procedure Read_Mount;
    procedure DrawPELine;
    procedure update;
    procedure updatealtaz(aligned: boolean);
    // procedure updatetransformed;
    { procedure SavePark;
      procedure ReadPark; }
    procedure WestUp;
    procedure NorthUp;
    procedure NWestUp;
    procedure setspeed;

    procedure FormCreate(Sender: TObject);
    procedure ButtonEMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ButtonEMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonWMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ButtonWMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ButtonNMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ButtonNMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    procedure ButtonSMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ButtonSMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    // procedure PicCommComm(Sender: TObject);
    procedure ButtonHClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SaveClick(Sender: TObject);

    procedure RadioButtonSpeed(Sender: TObject);

    procedure LX200ServerClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure ButtonSyncClick(Sender: TObject);

    procedure LX200ServerAccept(Sender: TObject; Socket: TCustomWinSocket);
    procedure LX200ServerClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ButtonSaveEEpromClick(Sender: TObject);
    procedure ButtonAdjClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);

    procedure ButtonNEMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ButtonNEMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TrackBarLedChange(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure ButtonfastMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ButtonfmMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ButtonfMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ButtonmmMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ButtonmmMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Joystickex1Button1_Change(Sender: TObject; pressed: boolean;
      Xpos, YPos: Integer);
    procedure Joystickex1Button2_Change(Sender: TObject; pressed: boolean;
      Xpos, YPos: Integer);
    procedure Joystickex1Button3_Change(Sender: TObject; pressed: boolean;
      Xpos, YPos: Integer);
    procedure Joystickex1Button4_Change(Sender: TObject; pressed: boolean;
      Xpos, YPos: Integer);
    procedure Joystickex1JoyMove(Sender: TObject; Xpos, YPos: Integer;
      ButtonStatus: Word; IsCalibrating: boolean);
    procedure ButtonrClick(Sender: TObject);
    procedure ButtonrpClick(Sender: TObject);
    procedure ButtonfMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ButtonfastMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ButtonfmMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ButtomPrecClick(Sender: TObject);
    procedure ButtongotoClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBoxNMenableClick(Sender: TObject);
    procedure ButtonCompressClick(Sender: TObject);

    procedure ButtonConnectClick(Sender: TObject);
    procedure ButtonElbrusClick(Sender: TObject);
    procedure DdeClientItem1Change(Sender: TObject);
    procedure ButtonPWMClick(Sender: TObject);
    procedure ButtonParkClick(Sender: TObject);
    procedure Button_locClick(Sender: TObject);
    procedure ButtonenableresClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure buttonbaudrateClick(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Buttonch_timerClick(Sender: TObject);
    procedure Button4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure CheckBoxAutoslewClick(Sender: TObject);

    procedure Button4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LabelFocusCountDblClick(Sender: TObject);
    procedure Buttoneye1Click(Sender: TObject);
    procedure Buttoneye2Click(Sender: TObject);
    { procedure GroupBoxControlDblClick(Sender: TObject); }
    procedure Buttoneye3Click(Sender: TObject);
    procedure Buttoneye1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: boolean);
    procedure ButtonwheelccMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ButtonwheelccMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ButtonwheelcwMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LabelWheelCountDblClick(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure Buttonaux1Click(Sender: TObject);
    procedure Buttonaux2Click(Sender: TObject);
    procedure Buttoneye4Click(Sender: TObject);
    procedure Buttonaux3Click(Sender: TObject);
    procedure Buttonaux4Click(Sender: TObject);
    procedure Buttoneye2ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: boolean);
    procedure Buttoneye3ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: boolean);
    procedure Buttoneye4ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: boolean);
    procedure Buttonaux5Click(Sender: TObject);
    procedure Buttonaux6Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);

    procedure ButtonFocusUpdateClick(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure ButtonchangePWM2Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure ButtonblockClick(Sender: TObject);
    procedure TracktuneChange(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure TracktunedecChange(Sender: TObject);

    procedure checkboxtrackClick(Sender: TObject);
    procedure AppException(Sender: TObject; E: Exception);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);

    procedure RadionoalignClick(Sender: TObject);
    procedure Button_alignClick(Sender: TObject);
    procedure ButtongetzenithClick(Sender: TObject);
    procedure RadiomountClick(Sender: TObject);
    procedure Joystickex1Button5_Change(Sender: TObject; pressed: boolean;
      Xpos, YPos: Integer);
    procedure ButtonbackraClick(Sender: TObject);
    procedure ButtonbackdeClick(Sender: TObject);
    procedure CheckBsaClick(Sender: TObject);
    procedure CheckBsdClick(Sender: TObject);
    procedure CheckBoxbsfClick(Sender: TObject);
    procedure CheckBoxbsauxClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);

    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);

    procedure dorestore(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure ButtoncloseContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: boolean);
    procedure ButtonfoldClick(Sender: TObject);
    procedure CheckBoxtguideClick(Sender: TObject);
    procedure buttonMeridianClick(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure CheckBoxZoneClick(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure TabSheet8Show(Sender: TObject);
    procedure TabSheet8Hide(Sender: TObject);
    procedure Buttonaux7Click(Sender: TObject);
    procedure Buttonaux8Click(Sender: TObject);
    procedure Buttonaux6ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: boolean);
    procedure Buttonaux1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: boolean);
    procedure Buttonaux2ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: boolean);
    procedure Buttonaux3ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: boolean);
    procedure Buttonaux4ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: boolean);
    procedure Buttonaux5ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: boolean);
    procedure Buttonaux7ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: boolean);
    procedure Buttonaux8ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: boolean);
    procedure JvHidDeviceControllerDeviceChange(Sender: TObject);
    function JvHidDeviceControllerEnumerate(HidDev: TJvHidDevice;
      const Idx: Integer): boolean;

    function ProcessLX200(command: String): String;
    procedure CheckboxgotoClick(Sender: TObject);
    procedure JvHidDeviceControllerDeviceDataError(HidDev: TJvHidDevice;
      Error: Cardinal);
    procedure JvHidDeviceControllerDeviceUnplug(HidDev: TJvHidDevice);

    procedure fillPECfour();
    procedure fillPEC();
    procedure listcomports(cbx: TComboBox);
    procedure Button21Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);

    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox4Click(Sender: TObject);

    procedure RadioButtonsidClick(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure CheckBoxPecClick(Sender: TObject);
    procedure Button24Click(Sender: TObject);













    // procedure WMNCHitTest(var Msg: TWMNCHitTest) ; message WM_NCHitTest;

  PRIVATE
    { Private declarations }

  PUBLIC
    { Public declarations }
    procedure ReadJoysticks(HidDev: TJvHidDevice; ReportID: Byte;
      const Data: Pointer; Size: Word);
  end;

const
  SIDERALF = 15.041068558362671057482635080546;

const
  SOLARF = 15.0;

const
  LUNARF = 14.685;

const
  KINGF = 15.0369;

  const
  ENCODER_RES =4096;

var
  Main: TMain;
  Tele: Ttelescope;
  SyncBool: boolean;
  piccomm, Azcontrol, Altcontrol, releaseb: boolean;
  t: Longint;
  ra_last_count, de_last_count: Longint;
  last_tick: Cardinal;
  joyxstatus: Integer;
  joyystatus: Integer;
  lastpress, errorcount1: Cardinal;
  id, msg1: Longword;
  idar, msg2, iddec, msg3: Longword;
  Ra_thread1, Dec_thread, dec1, dec2, lclock: Integer;
  s_inipath: string;
  inifile_name:string;
  radiotag: Longint;
  vaz, val: extended;
  legend: string;
  lastgamebutton: Word;
  lastgamedir: Word;
  Serie: TTASerie;
  seriespd: TTASerie;
  linex: Word;
  pushclientwidth: Word;
  picpec: Integer;
function smsg: Integer;
procedure InitThread;
procedure initdopulsear;
procedure initdopulsedec;

implementation

{$R *.dfm}
{$R windowsxp.res}

{ procedure Tmain.WMNCHitTest(var Msg: TWMNCHitTest) ;
  begin
  inherited;
  if Msg.Result = htClient then Msg.Result := htCaption;
  end; }
procedure TMain.setspeed;
begin
  case radiotag of
    4:
      Tele.SetActualSpeed(SLEW);
    3:
      Tele.SetActualSpeed(FIND);
    2:
      Tele.SetActualSpeed(CENTER);
    1:
      Tele.SetActualSpeed(GUIDE);
  end;
end;

procedure TMain.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(Main.Handle, WM_SYSCOMMAND, $F012, 0);
end;

procedure InitThread;
var
  t: tthreadfunc;
begin
  // t:=addr(tele);
  t := addr(smsg);
  Ra_thread1 := BeginThread(NIL, 0, t, addr(msg1), 0, id);
end;

procedure initdopulsear;
var
  t: tthreadfunc;
  function dopulsear: Integer;
  begin
    Tele.arguide;
    endthread(0);
    result := 0;

  end;

begin

  t := addr(dopulsear);
  Ra_thread1 := BeginThread(NIL, 0, t, addr(msg2), 0, idar);
end;

procedure initdopulsedec;
var
  t: tthreadfunc;
  function dopulsedec: Integer;
  begin

    Tele.decguide;
    endthread(0);
    result := 0;

  end;

begin

  t := addr(dopulsedec);
  Dec_thread := BeginThread(NIL, 0, t, addr(msg3), 0, iddec);
end;

function InitConv: boolean;
begin
  result := FALSE;
  with Main do
    if DdeClientConv1.SetLink('elbrus', 'formExtrae') then
    begin // initialize conversation
      DdeClientItem1.DdeItem := 'LabelDDE'; // if ready initialize items
      result := TRUE;
    end;
end;

function smsg: Integer;
begin
  // while true do begin
  // inc(msg1);//gosleepp(10);;end;
  // showmessage('empiezo');
  Tele.run := TRUE;
  Tele.ThreadedMotorControl(NIL);
  // tele.goaccelar(65000);
  // showmessage('termine');
  endthread(0);

end;

procedure TMain.AppException(Sender: TObject; E: Exception);
begin
  // Application.ShowException(E);
  // Application.Terminate;
end;

procedure TMain.dorestore(Sender: TObject);
begin
  Main.Show;
end;

procedure TMain.FormCreate(Sender: TObject);
var
  timezoneinfo: TTimezoneinformation;
  r, dlts, n, i: Word;
  prec: boolean;
  regn: HRGN;
  X: real;
begin

  pushclientwidth := clientwidth;
  listcomports(ComboBoxPort);
  PageControlConf.ActivePage := TabSheet1;
  memolog.Lines.Add('Started at:' + timetostr(now));
  // chart1.AutoRepaint:=TRUE;
  // self.ScaleBy(400,200) ;

  LongEditpoll.Height := (LongEditpoll.Height * 250) div 100;
  LongEditTimeout.Height := (LongEditTimeout.Height * 170) div 100;
  // application.Create:=false;
  // main.Borderstyle:=bsNone;
  // regn:=CreateRoundRectRgn(0,0,ClientWidth,ClientHeight+60,10,10);
  // SetWindowRgn(Handle,regn,True);
  Application.OnRestore := dorestore;
  Application.OnException := AppException;
  // SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) or WS_EX_LAYERED);
  // SetLayeredWindowAttributes(Handle,clWhite,255,LWA_COLORKEY);
  legend := Main.Caption;
  radiotag := 1;
  prec := FALSE;
  SetWindowPos(Handle, HWND_TOPMOST, Left, Top, Width, Height, 0);

  { if extractfilename(Application.EXEName)<>'PicgotoPlus.exe' then
    begin
    s_inipath  :=GetEnvVarValue('CommonProgramFiles')+'\ASCOM\Telescope\';
    caption:=caption + ' ASCOM';
    prec:=true;
    end
    else }
  s_inipath := ExtractFilePath(Application.EXEName);

  Tele := Ttelescope.create();
  Tele.Preci := prec;
  Tele.Aceleration := CheckBox2.Checked;
  Altcontrol := TRUE;
  Azcontrol := TRUE;
  //fillPECfour;
  // begin

  r := GetTimezoneInformation(timezoneinfo);
  dlts := 0;
  if r = time_zone_id_daylight then
  begin
    CheckBoxDLST.State := cbchecked;
    dlts := -timezoneinfo.DaylightBias DIV 60;
  end;
  Label34.Caption := inttostr(timezoneinfo.Bias + timezoneinfo.standardBias);
   read_mount;
   case radiogroup1.ItemIndex of
  0: inifile_name:='picgoto.ini';
  1: inifile_name:='picgoto2.ini';
  2: inifile_name:='picgoto3.ini';
  else inifile_name:='picgoto.ini';
   end;
  ReadSettings;
  Timer1.Interval := LongEditpoll.Value;
  Tele.GetMount(LongEditGearAr.Value, LongEditGearDe.Value,

    LongEditStepAr.Value, LongEditStepDe.Value, FloatEditRedAr.Value,
    FloatEditRedDec.Value, LongEditSlew.Value, LongEditFind.Value,
    LongEditCenter.Value, LongEditNearRA.Value, FloatEditGuide.Value,
    LongEditSlewDe.Value, LongEditFindDe.Value, LongEditCenterDe.Value,
    LongEditNearde.Value, FloatEditGuideDec.Value,
    1E-6 * FloatEditPrescaler.Value, CheckRunP.Checked,
    LongEdit_RA_Radius.Value, LongEdit_DE_Radius.Value);

  Tele.SetLocation(MaskEditLong.Text, MaskEditLat.Text, LongEditGMT.Value);

  // if not(tele.Connected) then
  // Tele.connect(ComboBoxPort.Text, ComboBoxBps.text,true);
  // if not(tele.Connected) then
  // Showmessage('Serial port error');
  ButtonConnect.Caption := 'DisConnect';
  Tele.SincroniceallDeviceSpeeds(254);
  Tele.RaRamp := LongEditRAramp.Value;
  Tele.deRamp := LongEditDeRamp.Value;
  // Tele.SetSpeeds(4,10,50,400);
  // label4.caption := inttostr(tele.SideralSpeed);
  Tele.SetActualSpeed(GUIDE);
  // ----------------------------------------------------------------------
  LX200Server.Port := LongEditPort.Value;
  IdUDPClientEnc.Host:=editudpaddr.Text;
  LX200Server.Active := TRUE;
  Tele.FocusConfig(FloatEditfocusres.Value, LongEditFocusmax.Value,
    LongEditFocusBack.Value, LongEditFocusfinespeed.Value,
    LongEditFocusMaxSpeed.Value, LongEditeye1.Value, LongEditeye2.Value,
    LongEditeye3.Value, LongEditeye4.Value);
  Tele.AuxConfig(FloatEditrotstepangle.Value, LongEditTopRcounter.Value,
    LongEditRotbackSlash.Value, LongEdittRotFspeed.Value,
    LongEdittRotFFspeed.Value, LongEditAux1.Value, LongEditAux2.Value,
    LongEditAux3.Value, LongEditAux4.Value, LongEditaux5.Value,
    LongEditaux6.Value, LongEditaux7.Value, LongEditaux8.Value);
  Tele.autoguide_mode := CheckBox6.Checked;

  if NOT Joystickex1.EnableJoyStick then
    // ShowMessage('Gamepad not connected') ;
    joyxstatus := 1;
  joyystatus := 1;
  // Tele.Adjust(strtoint(EditAdjust.text));
  // readpark;ButtonSyncClick(self           )

  // label11.Caption:=Inttostr(tele.encoderrares)+ ' '+Inttostr(tele.encoderdecres);
  Tele.autoslew := TRUE;
  Tele.target_de_speed := 0.0;
  Timer1.Enabled := TRUE;
  Tele.Geo_data_align;
  Tele.forbidden_min := LongEditforb_min.Value * SIDERALF;
  Tele.forbidden_max := LongEditForb_max.Value * SIDERALF;
  Tele.forbidden_min_dec := LongEditforb_min_dec.Value * SIDERALF;
  Tele.forbidden_max_dec := LongEditForb_max_dec.Value * SIDERALF;
  Tele.forbidden_enable := CheckBoxZone.Checked;
   fillPECfour;
  InitThread;

end;

procedure TMain.ButtonEMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  setspeed;
  Azcontrol := FALSE;
  piccomm := Tele.GoEast;
  Tele.RaSlew := FALSE;
end;

procedure TMain.ButtonEMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  piccomm := Tele.SetSideralSpeed;
  Tele.RaSlew := FALSE;
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if CheckBoxpark.Checked then
    piccomm := Tele.Ar_halt;
  if Buttonclose.Visible = FALSE then
  begin // PicComm.PortOpen:=FALSE;

    { Tele.disconnect;
      Timer1.Enabled := FALSE;
      if Joystickex1.EnableJoyStick then
      Joystickex1.free;
      lx200Server.Active := FALSE;
      closehandle( Ra_thread1); }

  end
end;

procedure TMain.ButtonWMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  setspeed;
  Azcontrol := FALSE;
  if TButton(Sender).tag = 0 then
    piccomm := Tele.GoWest
  else
    piccomm := Tele.GoEast;
  Tele.RaSlew := FALSE;
end;

procedure TMain.ButtonWMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

  if Tele.eqmount = ECUATOR then
  begin
    setspeed;
    piccomm := Tele.SetSideralSpeed;
    Tele.RaSlew := FALSE;
  end
  else
    WestUp;
end;

procedure TMain.ButtonNMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

  Altcontrol := FALSE;
  setspeed;
  piccomm := Tele.GoNorth;
  Tele.DeSlew := FALSE;
end;

procedure TMain.ButtonNMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Tele.eqmount = ECUATOR then
  begin
    piccomm := Tele.StopDec;
    Tele.DeSlew := FALSE;
  end
  else
    NorthUp;
end;

procedure TMain.ButtonHClick(Sender: TObject);
begin
  piccomm := Tele.StopAR;;
  piccomm := Tele.StopDec;;
  Tele.RaSlew := FALSE;
  Tele.DeSlew := FALSE;
end;



procedure TMain.Timer1Timer(Sender: TObject);
var
  ra, dec, az, alt: extended;
begin
  if Tele.eqmount = ECUATOR then
    update
  else
    updatealtaz(Radiomount.ItemIndex = 2);
  // tele.get_Zenith(ra,dec);
  // label27.Caption:=inttodec(trunc((ra)*3600.0/15.0),0)+'  '+inttodec(trunc(dec*3600.0),0)+' '+ inttodec(trunc(tele.arcurrent),0);
  Tele.get_Zenith(ra, dec);
  Label27.Caption := inttoar(trunc(radtodeg(ra) * 36000), 0) + '  ' +
    inttodec(trunc(radtodeg(dec) * 3600.0), 1);

end;

procedure TMain.update;
var
  tempStr: String;
  az, alt: extended;
  tick, lastt: Cardinal;
  rasp, decsp: extended;
  rcode: string;
  delta_ar, delta_de: Integer;
  connectedl: Integer;
  procedure paint1;
  begin
    CheckBoxSmartGoto.Color := clBtnFace;
    LabelFocusCount.Caption := inttostr(Tele.focuspos);
    LabelWheelCount.Caption := inttostr(Tele.auxpos);
    if (rcode = '0') then
    begin
      Shape1.brush.Color := clred;
      LabelAR1.Font.Color := clmaroon;
      LabelDec1.Font.Color := clmaroon;
      labelAR.Font.Color := clmaroon;
      Labeldec.Font.Color := clmaroon;
      exit;
    end
    else
      CheckBoxSmartGoto.Color := clBtnFace;
    Shape1.brush.Color := cllime;
    Laberarpos.Caption := inttostr(Tele.arpos);
    // label58.Caption:=inttostr(round(tele.decdest/tele.decstepsize)-tele.decpos);
    // label59.Caption:=inttostr(round(tele.ardest/tele.arstepsize)-tele.arpos);
  end;
  Procedure paint2;
  begin
    labelarmspeed.Caption := formatfloat('0.0', rasp);
    labeldemspeed.Caption := formatfloat('0.0', decsp * Tele.DecStepSize);
    Labeldexpeed.Caption := formatfloat('0.0',
      abs(decsp * Tele.DecStepSize / 15.0));
    Labelraxpeed.Caption := formatfloat('0.0', rasp / 15.0);

    if Tele.pier_side_east then
    begin
      LabePierSide.Caption := 'East';
      labelAR.Font.Color := clred;
      LabelAR1.Font.Color := clred;
      Labeldec.Font.Color := clred;
      LabelDec1.Font.Color := clred;
      LabePierSide.Font.Color := clred;
    end
    else
    begin
      LabePierSide.Caption := 'West';
      labelAR.Font.Color := clSkyBlue;
      LabelAR1.Font.Color := clSkyBlue;
      Labeldec.Font.Color := clSkyBlue;
      LabelDec1.Font.Color := clSkyBlue;
      LabePierSide.Font.Color := clNavy;
    end;
    if Tele.RaSlew then
    begin

      labelAR.Font.Color := clyellow;
      LabelAR1.Font.Color := clyellow;

    end;
    if Tele.DeSlew then
    begin

      Labeldec.Font.Color := clyellow;
      LabelDec1.Font.Color := clyellow;
      // tele.loadpos(maskeditar.text,maskeditdec.Text);
      // Tele.gotoSlew;
    end;

    // label15.Caption := inttostr(tele.ActualSpeed);
    Label18.Caption :=
      floattostrf(1 / ((65535.0 - abs(Tele.ActualSpeed)) * Tele.RA_timertick),
      ffnumber, 10, 3);
    if Tele.actualSpeedDec <> 0 then
      Label30.Caption :=
        floattostrf(1 / ((65535.0 - abs(Tele.actualSpeedDec)) *
        Tele.RA_timertick), ffnumber, 10, 3)
    else
      Label30.Caption := '0,000';
    LabelEncDec.Caption := inttostr(Tele.deccounter);
    // inttostr(tele.decpos)+' '+
    // labelencdec.Caption := inttostr(tele.deccounter);
    tempStr := Tele.ReturnAr(TRUE);
    labelAR.Caption := tempStr;
    LabelAR1.Caption := tempStr;
    tempStr := Tele.ReturnDec(TRUE);
    Labeldec.Caption := tempStr;
    LabelDec1.Caption := tempStr;
    t := Tele.arpos;
    az := Tele.azimuth(now);
    alt := Tele.altitude(now);
    if az > 180 then
      LabelAzimuth.Font.Color := clSkyBlue
    else
      LabelAzimuth.Font.Color := clred;
    if alt > 0.0 then
      LabelAltitude.Font.Color := clMoneyGreen
    else
      LabelAltitude.Font.Color := clred;
    LabelAzimuth.Caption := inttodec(trunc(az * 3600.0), 0);
    LabelAltitude.Caption := inttodec(trunc(alt * 3600.0), 0);
    LabelHourAngle.Caption :=
      inttoar(trunc(Tele.local_RA_Position(now) * 3600 * 15), 3);
    // label26.caption:=IntToAr(trunc(tele.LOCAL_SIDERAL_TIME(now)*3600*15),3);
    delta_ar := round(Tele.ardest - (Tele.local_sideral_time(now) * 15.0 *
      3600.0) + Tele.arCurrent);
    delta_de := trunc(Tele.DecDest - Tele.deccurrent);
    if abs(delta_ar) > 3600 * 180 then
      delta_ar := (3600 * 360 - abs(delta_ar)) * signo(-delta_ar);
    Labeldelta.Caption := inttodec(delta_ar, 0);
    Labeldeltalt.Caption := inttodec(delta_de, 0);

  end;

begin
  // tick := GetTickCount;
  tick := timegettime();
  lastt := (tick - last_tick);
  Label58.Caption := inttostr(lastt);
  lclock := Tele.auxpos;
  rcode := Tele.GetPos;
  if (rcode='44') or (rcode='253')  then begin
  Label7.Caption := inttostr(Tele.arpos);
  picpec:=tele.PicTime;
  tele.zeropec:=picpec;
  label64.caption:=inttostr(picpec-strtoint( label15.caption)-tele.pe_size);
  label15.caption:=inttostr(picpec);
  label68.caption:=inttostr(picpec)+'  '+inttostr(tele.zeropec);

  //Tele.setZeropec(8000);
  end;
  label4.caption:=rcode;
  paint1;
  if (rcode <> '4444') and (rcode <>'25653') and (rcode <>'25654') and (rcode<>'25444') and (rcode<>'44')and (rcode<>'253') then
  begin
    Shape1.brush.Color := clred;
    errorcount1 := errorcount1 + 1;
    connectedl := StrtoInt(rcode); // get control char
    if (errorcount1 = 5) and (checkboxtrack.Checked = TRUE) then
    begin
      checkboxtrack.Checked := FALSE;
      memolog.Lines.Add(timetostr(now) + ':No response track disable: ' +
        inttostr(connectedl));
    end;
    if errorcount1 = 50 then
    begin
      memolog.Lines.Add(timetostr(now) + ':No response,reconnecting:' +
        inttostr(connectedl));
      Tele.disconnect();
      sleep(1000);
      Tele.connect(ComboBoxPort.Text, ComboBoxBps.Text, TRUE);
      errorcount1 := 0;
      if memolog.Lines.count > 100 then
        memolog.Lines.clear;
    end;
    exit;
  end
  else
    errorcount1 := 0;
  if lastt > 0 then
  begin
    rasp := Tele.ArStepSize * ((Tele.arpos - ra_last_count) * 1000.0 / (lastt));
    // rasp := tele.ArStepSize * ( (tele.arpos - ra_last_count  ) * 1000.0 / (0.052*(tele.auxpos-lclock)));
    if (rasp > 16) or (rasp < 14) then
    begin
      labelRAStatus.Caption := 'RaRun'; // Tele.torque(128);
      // tele.trackbit:=false;
    end
    else
    begin
      labelRAStatus.Caption := 'RaTrack';
      // tele.trackbit:=true;
      if Tele.RaSlew then
      begin
        // ------------------------------------------------------------------------------------------------------------------
        delta_ar := round(Tele.ardest - (Tele.local_sideral_time(now) * 15.0 *
          3600.0) + Tele.arCurrent);
        if abs(delta_ar) > 3600 * 180 then
          delta_ar := (3600 * 360 - abs(delta_ar)) * signo(-delta_ar);
        // test error jose
        if (abs(delta_ar) < 16) then
          Tele.RaSlew := FALSE;
        // label64.Caption:=floattostr(delta_AR);                                                            //test erro jose
        // ------------------------------------------------------------------------------------------------------------------
        Tele.target_ra_speed := SIDERALF;
        Tele.current_ra_speed := SIDERALF;
        Tele.tarspeed := signo(Tele.sp) /
          ((65535.0 - abs(Tele.sp)) * Tele.RA_timertick);
        Tele.var_step_speed := Tele.tarspeed;
      end;
    end;;
    decsp := (-de_last_count + Tele.decpos) * 1000.0 / (lastt);
    if abs(decsp) > 0.4 then
    begin
      LabelDecStatus.Caption := 'DecRun';
      // tele.trackbit:=FALSE;
    end
    else
    begin
      // tele.trackbit:=tele.trackbit and true;
      LabelDecStatus.Caption := 'DecStop';
      if Tele.DeSlew then
      begin
        Tele.DeSlew := FALSE;
        Tele.current_de_speed := 0;
        Tele.target_de_speed := 0;
        Tele.spd := 0;
        Tele.var_step_speed_dec := 0.0;
        Tele.tdecspeed := 0.0;
        Tele.set_alt_speed(0);
        Tele.SetDecSpeed(0);
      end;
    end;
  end;

  ra_last_count := Tele.arpos;
  de_last_count := Tele.decpos;
  last_tick := tick;
  paint2;

  if CheckBoxTarget.Checked then
  begin
    MaskEditAr.Text := Tele.ReturnArDest;
    MaskEditDec.Text := Tele.returnDecDest(TRUE);
  end;
  // label11.Caption:=inttostr(65535-tele.rr);//floattostr(tele.tick);
  if (Tele.RaSlew or Tele.DeSlew) and CheckBoxSmartGoto.Checked and
    CheckBoxAutoslew.Checked // and CheckBoxTarget.Checked
  then
  begin
    CheckBoxSmartGoto.Color := cllime;
    Tele.loadpos(MaskEditAr.Text, MaskEditDec.Text);
    Label58.Caption := inttostr(round(Tele.DecDest / Tele.DecStepSize) -
      Tele.decpos);
    Tele.gotoSlew;
    // if  tele.RaSlew then Tele.gotoSlewAr;
    // if  tele.deslew then Tele.gotoSlewdec;
  end;
  if CheckBoxPec.Checked then
  begin
    // series1.AddXY(series1.xvalues.Last + 1, series1.yValue[0]);
    // series1.Delete(0);
    //
    // Series1.Repaint;
    DrawPELine;
  end;
end;

procedure TMain.ButtonSMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  setspeed;
  Altcontrol := FALSE;
  piccomm := Tele.GoSouth;
  Tele.DeSlew := FALSE;
end;

procedure TMain.SaveSetting;
var
  inifile: TiniFile;
begin

  inifile := TiniFile.create(s_inipath + inifile_name);
  with inifile do
  begin

    writeinteger('Telescope', 'equatorial', Radiomount.ItemIndex);
    writeinteger('Telescope', 'Ragear', LongEditGearAr.Value);
    WriteFloat('Telescope', 'RedgearAr', FloatEditRedAr.Value);
    writeinteger('Telescope', 'Decgear', LongEditGearDe.Value);
    WriteFloat('Telescope', 'RedgearDec', FloatEditRedDec.Value);
    writeinteger('Telescope', 'Slew', LongEditSlew.Value);
    writeinteger('Telescope', 'Find', LongEditFind.Value);
    writeinteger('Telescope', 'Center', LongEditCenter.Value);
    writeinteger('Telescope', 'Near', LongEditNearRA.Value);
    writeinteger('Telescope', 'radius', LongEdit_RA_Radius.Value);
    // WriteInteger('Telescope', 'Guide',LongEditGuide.Value );
    WriteFloat('Telescope', 'Guide', FloatEditGuide.Value);
    writeinteger('Telescope', 'SlewDe', LongEditSlewDe.Value);
    writeinteger('Telescope', 'FindDe', LongEditFindDe.Value);
    writeinteger('Telescope', 'CenterDe', LongEditCenterDe.Value);
    writeinteger('Telescope', 'NearDe', LongEditNearde.Value);
    writeinteger('Telescope', 'radiusde', LongEdit_DE_Radius.Value);
    // WriteInteger('Telescope', 'GuideDe',LongEditGuideDe.Value );
    WriteFloat('Telescope', 'GuideDe', FloatEditGuideDec.Value);
    writeinteger('Telescope', 'StepsAR', LongEditStepAr.Value);
    writeinteger('Telescope', 'StepsDec', LongEditStepDe.Value);
    // WriteInteger('Telescope', 'Adjust', Strtoint(editAdjust.text));
    writeinteger('Telescope', 'PWM0', LongEdit1.Value);
    writeinteger('Telescope', 'PWM1', LongEdit2.Value);
    writeinteger('Telescope', 'PWM2', LongEdit3.Value);
    writeinteger('Telescope', 'PWM3', LongEdit4.Value);
    writeinteger('Telescope', 'PWM4', LongEdit5.Value);
    writeinteger('Telescope', 'PWM5', LongEdit6.Value);
    writeinteger('Telescope', 'PWM6', LongEdit7.Value);
    writeinteger('Telescope', 'PWM7', LongEdit8.Value);
    writeinteger('Telescope', 'PWM8', LongEdit9.Value);
    writeinteger('Telescope', 'PWM9', LongEdit10.Value);
    writeinteger('Telescope', 'PWMD0', LongEdit1d.Value);
    writeinteger('Telescope', 'PWMD1', LongEdit2d.Value);
    writeinteger('Telescope', 'PWMD2', LongEdit3d.Value);
    writeinteger('Telescope', 'PWMD3', LongEdit4d.Value);
    writeinteger('Telescope', 'PWMD4', LongEdit5d.Value);
    writeinteger('Telescope', 'PWMD5', LongEdit6d.Value);
    writeinteger('Telescope', 'PWMD6', LongEdit7d.Value);
    writeinteger('Telescope', 'PWMD7', LongEdit8d.Value);
    writeinteger('Telescope', 'PWMD8', LongEdit9d.Value);
    writeinteger('Telescope', 'PWMD9', LongEdit10d.Value);
    writeinteger('Telescope', 'RaRamp', LongEditRAramp.Value);
    writeinteger('Telescope', 'DeRamp', LongEditDeRamp.Value);
    writeinteger('Telescope', 'RABack', LongEditbackshar.Value);
    writeinteger('Telescope', 'DeBack', LongEditbackshDe.Value);
    Writebool('Telescope', 'ms10', CheckBoxNMsteps.Checked);
    WriteString('Serial_Port', 'Port', ComboBoxPort.Text);
    WriteString('Serial_Port', 'BaudRate', ComboBoxBps.Text);
    WriteString('Server', 'Host', EditAddr.Text);
    writeinteger('Server', 'Port', LongEditPort.Value);
    WriteString('Server', 'UDPaddr', EditUDPAddr.Text);
    WriteFloat('PIC', 'Prescaler', FloatEditPrescaler.Value);
    Writebool('PIC', 'Track', CheckRunP.Checked);
    Writebool('PIC', 'Save_on_exit', CheckBoxpark.Checked);
    if radiopresc4.Checked then
    Writeinteger('PIC', 'PrescB', 0)else
    if radiopresc8.Checked  then
    Writeinteger('PIC', 'PrescB', 1)else
    if radiopresc16.Checked   then
    Writeinteger('PIC', 'PrescB', 2);
    Writebool('telescope', 'locktarget', CheckBoxlocktarget.Checked);
    Writebool('telescope', 'AGM', CheckBox6.Checked);
    Writebool('telescope', 'lineal', Checkboxgoto.Checked);
    Tele.GetMount(LongEditGearAr.Value, LongEditGearDe.Value,
      LongEditStepAr.Value, LongEditStepDe.Value, FloatEditRedAr.Value,
      FloatEditRedDec.Value, LongEditSlew.Value, LongEditFind.Value,
      LongEditCenter.Value, LongEditNearRA.Value, FloatEditGuide.Value,
      LongEditSlewDe.Value, LongEditFindDe.Value, LongEditCenterDe.Value,
      LongEditNearde.Value, FloatEditGuideDec.Value,
      1E-6 * FloatEditPrescaler.Value, CheckRunP.Checked,
      LongEdit_RA_Radius.Value, LongEdit_DE_Radius.Value);
    Tele.RaRamp := LongEditRAramp.Value;
    Tele.deRamp := LongEditDeRamp.Value;
    Tele.lineal := Checkboxgoto.Checked;
    // Tele.SincroniceallDeviceSpeeds ;
    WriteString('Geo', 'Location', EditLocation.Text);
    WriteString('Geo', 'Longitude', MaskEditLong.Text);
    WriteString('Geo', 'Latitude', MaskEditLat.Text);
    writeinteger('Geo', 'GMTOffset', LongEditGMT.Value);
    writeinteger('Focus', 'eye1', LongEditeye1.Value);
    writeinteger('Focus', 'eye2', LongEditeye2.Value);
    writeinteger('Focus', 'eye3', LongEditeye3.Value);
    writeinteger('Focus', 'eye4', LongEditeye4.Value);
    WriteFloat('focus', 'stepsize', FloatEditfocusres.Value);
    writeinteger('Focus', 'Maxstep', LongEditFocusmax.Value);
    writeinteger('Focus', 'Backslashstep', LongEditFocusBack.Value);
    writeinteger('Focus', 'FineSpd', LongEditFocusfinespeed.Value);
    writeinteger('Focus', 'FastSpd', LongEditFocusMaxSpeed.Value);
    writeinteger('Focus', 'Reset', LongEditFocusReset.Value);
    writeinteger('Rot', 'aux1', LongEditAux1.Value);
    writeinteger('Rot', 'aux2', LongEditAux2.Value);
    writeinteger('Rot', 'aux3', LongEditAux3.Value);
    writeinteger('Rot', 'aux4', LongEditAux4.Value);
    writeinteger('Rot', 'aux5', LongEditaux5.Value);
    writeinteger('Rot', 'aux6', LongEditaux6.Value);
    writeinteger('Rot', 'aux7', LongEditaux7.Value);
    writeinteger('Rot', 'aux8', LongEditaux8.Value);
    WriteFloat('Rot', 'Anglesize', FloatEditrotstepangle.Value);
    writeinteger('Rot', 'topstep', LongEditTopRcounter.Value);
    writeinteger('Rot', 'BackslashstepAux', LongEditRotbackSlash.Value);
    writeinteger('Rot', 'FineSpdAux', LongEdittRotFspeed.Value);
    writeinteger('Rot', 'FastSpdAux', LongEdittRotFFspeed.Value);
    writeinteger('Settings', 'timerpoll', LongEditpoll.Value);
    writeinteger('Telescope', 'FzoneMin', LongEditforb_min.Value);
    writeinteger('Telescope', 'FzoneMinDec', LongEditforb_min_dec.Value);
    writeinteger('Telescope', 'FzoneMax', LongEditForb_max.Value);
    writeinteger('Telescope', 'FzoneMaxDec', LongEditForb_max_dec.Value);
    Writebool('Telescope', 'FzoneEnable', CheckBoxZone.Checked);
    Tele.FocusConfig(FloatEditfocusres.Value, LongEditFocusmax.Value,
      LongEditFocusBack.Value, LongEditFocusfinespeed.Value,
      LongEditFocusMaxSpeed.Value, LongEditeye1.Value, LongEditeye2.Value,
      LongEditeye3.Value, LongEditeye4.Value);
    Tele.AuxConfig(FloatEditrotstepangle.Value, LongEditTopRcounter.Value,
      LongEditRotbackSlash.Value, LongEdittRotFspeed.Value,
      LongEdittRotFFspeed.Value, LongEditAux1.Value, LongEditAux2.Value,
      LongEditAux3.Value, LongEditAux4.Value, LongEditaux5.Value,
      LongEditaux6.Value, LongEditaux7.Value, LongEditaux8.Value);
      writefloat('PEC','main',FloatEditPE.Value);
      writefloat('PEC','secondary' , FloatEditPE2.Value);
      writefloat('PEC','phase', FloatEditphase.Value);
  end;
  inifile.Free;
end;

procedure TMain.ReadSettings;
var
  inifile: TiniFile;
  temp:integer;
begin
  inifile := TiniFile.create(s_inipath + inifile_name);
  with inifile do
  begin
    LongEditGearAr.Value := ReadInteger('Telescope', 'Ragear', 180);
    FloatEditRedAr.Value := ReadFloat('Telescope', 'RedgearAr', 132);
    LongEditGearDe.Value := ReadInteger('Telescope', 'Decgear', 180);
    FloatEditRedDec.Value := ReadFloat('Telescope', 'RedgearDec', 132);
    LongEditStepAr.Value := ReadInteger('Telescope', 'StepsAR', 2000);
    LongEditStepDe.Value := ReadInteger('Telescope', 'StepsDec', 2000);
    LongEditSlew.Value := ReadInteger('Telescope', 'Slew', 25);
    LongEditCenter.Value := ReadInteger('Telescope', 'Center', 8);
    LongEditNearRA.Value := ReadInteger('Telescope', 'Near', 15);
    LongEdit_RA_Radius.Value := ReadInteger('Telescope', 'radius', 20);
    LongEditFind.Value := ReadInteger('Telescope', 'Find', 20);
    FloatEditGuide.Value := ReadFloat('Telescope', 'Guide', 2.0);
    FloatEditGuideDec.Value := ReadFloat('Telescope', 'GuideDe', 2.0);
    LongEditSlewDe.Value := ReadInteger('Telescope', 'SlewDe', 25);
    LongEditCenterDe.Value := ReadInteger('Telescope', 'CenterDe', 8);
    LongEditFindDe.Value := ReadInteger('Telescope', 'FindDe', 20);
    LongEditNearde.Value := ReadInteger('Telescope', 'NearDe', 15);
    LongEdit_DE_Radius.Value := ReadInteger('Telescope', 'radiusde', 20);
    // editAdjust.text := readString('Telescope', 'Adjust', '0');
    LongEdit1.Value := ReadInteger('Telescope', 'PWM0', 0);
    LongEdit2.Value := ReadInteger('Telescope', 'PWM1', 38);
    LongEdit3.Value := ReadInteger('Telescope', 'PWM2', 76);
    LongEdit4.Value := ReadInteger('Telescope', 'PWM3', 102);
    LongEdit5.Value := ReadInteger('Telescope', 'PWM4', 127);
    LongEdit6.Value := ReadInteger('Telescope', 'PWM5', 153);
    LongEdit7.Value := ReadInteger('Telescope', 'PWM6', 178);
    LongEdit8.Value := ReadInteger('Telescope', 'PWM7', 191);
    LongEdit9.Value := ReadInteger('Telescope', 'PWM8', 220);
    LongEdit10.Value := ReadInteger('Telescope', 'PWM9', 249);
    LongEdit1d.Value := ReadInteger('Telescope', 'PWMD0', 0);
    LongEdit2d.Value := ReadInteger('Telescope', 'PWMD1', 38);
    LongEdit3d.Value := ReadInteger('Telescope', 'PWMD2', 76);
    LongEdit4d.Value := ReadInteger('Telescope', 'PWMD3', 102);
    LongEdit5d.Value := ReadInteger('Telescope', 'PWMD4', 127);
    LongEdit6d.Value := ReadInteger('Telescope', 'PWMD5', 153);
    LongEdit7d.Value := ReadInteger('Telescope', 'PWMD6', 178);
    LongEdit8d.Value := ReadInteger('Telescope', 'PWMD7', 191);
    LongEdit9d.Value := ReadInteger('Telescope', 'PWMD8', 220);
    LongEdit10d.Value := ReadInteger('Telescope', 'PWMD9', 249);
    LongEditRAramp.Value := ReadInteger('Telescope', 'RaRamp', 200);
    LongEditDeRamp.Value := ReadInteger('Telescope', 'DeRamp', 200);
    LongEditbackshar.Value := ReadInteger('Telescope', 'RABack', 0);
    LongEditbackshDe.Value := ReadInteger('Telescope', 'DEBack', 0);
    CheckBoxNMsteps.Checked := readbool('Telescope', 'ms10', FALSE);
    Checkboxgoto.Checked := (readbool('Telescope', 'lineal', FALSE));
    // LongEditGuideDe.Value:=ReadInteger('Telescope','GuideDe',2);
    ComboBoxPort.Text := ReadString('Serial_Port', 'Port', 'com4');
    ComboBoxBps.Text := ReadString('Serial_Port', 'BaudRate', '19200');
    EditAddr.Text := ReadString('Server', 'Host', '127.0.0.1');
    editudpaddr.Text:=ReadString('Server', 'UDPaddr', '127.0.0.1');
    LongEditPort.Value := ReadInteger('Server', 'Port', 10001);
    FloatEditPrescaler.Value := ReadFloat('PIC', 'Prescaler', 0.40076);
    CheckRunP.Checked := readbool('PIC', 'Track', TRUE);
    CheckBoxpark.Checked := readbool('PIC', 'Save_on_exit', FALSE);
    temp:=readInteger('PIC', 'PrescB', 0);
    case  temp of

    0  :RadioPresc4.Checked:=true;
    1:RadioPresc8.Checked := true;
    2:RadioPresc16.Checked := true;
    end;
    CheckBoxlocktarget.Checked := readbool('telescope', 'locktarget', FALSE);
    CheckBox6.Checked := readbool('telescope', 'AGM', FALSE);
    Radiomount.ItemIndex := ReadInteger('Telescope', 'equatorial', 0);
    Tele.eqmount := mmode(Radiomount.ItemIndex);
    EditLocation.Text := ReadString('Geo', 'Location', 'My home');
    MaskEditLong.Text := ReadString('Geo', 'Longitude', '+000°00''00"');
    MaskEditLat.Text := ReadString('Geo', 'Latitude', '+00°00''00"');
    LongEditGMT.Value := ReadInteger('Geo', 'GMTOffset', 0);
    LongEditeye1.Value := ReadInteger('Focus', 'eye1', 1000);
    LongEditeye2.Value := ReadInteger('Focus', 'eye2', 2000);
    LongEditeye3.Value := ReadInteger('Focus', 'eye3', 3000);
    LongEditeye4.Value := ReadInteger('Focus', 'eye4', 4000);
    FloatEditfocusres.Value := ReadFloat('focus', 'stepsize', 10.5);
    LongEditFocusmax.Value := ReadInteger('Focus', 'Maxstep', 100000);
    LongEditFocusBack.Value := ReadInteger('Focus', 'Backslashstep', 10);
    LongEditFocusfinespeed.Value := ReadInteger('Focus', 'FineSpd', 100);
    LongEditFocusMaxSpeed.Value := ReadInteger('Focus', 'FastSpd', 100);
    LongEditFocusReset.Value := ReadInteger('Focus', 'Reset', 0);
    LongEditAux1.Value := ReadInteger('Rot', 'aux1', 1000);
    LongEditAux2.Value := ReadInteger('Rot', 'aux2', 2000);
    LongEditAux3.Value := ReadInteger('Rot', 'aux3', 3000);
    LongEditAux4.Value := ReadInteger('Rot', 'aux4', 4000);
    LongEditaux5.Value := ReadInteger('Rot', 'aux5', 5000);
    LongEditaux6.Value := ReadInteger('Rot', 'aux6', 6000);
    LongEditaux7.Value := ReadInteger('Rot', 'aux7', 7000);
    LongEditaux8.Value := ReadInteger('Rot', 'aux8', 8000);
    FloatEditrotstepangle.Value := ReadFloat('Rot', 'Anglesize', 10.0);
    LongEditTopRcounter.Value := ReadInteger('Rot', 'topstep', 4000);
    LongEditRotbackSlash.Value := ReadInteger('Rot', 'BackslashstepAux', 50);
    LongEdittRotFspeed.Value := ReadInteger('Rot', 'FineSpdAux', 29);
    LongEdittRotFFspeed.Value := ReadInteger('Rot', 'FastSpdAux', 2000);
    LongEditpoll.Value := ReadInteger('Settings', 'timerpoll', 500);
    LongEditforb_min.Value := ReadInteger('Telescope', 'FzoneMin', 45);
    LongEditforb_min_dec.Value := ReadInteger('Telescope', 'FzoneMinDec', 45);
    LongEditForb_max.Value := ReadInteger('Telescope', 'FzoneMax', 120);
    LongEditForb_max_dec.Value := ReadInteger('Telescope', 'FzoneMaxDec', 120);
    CheckBoxZone.Checked := readbool('Telescope', 'FzoneEnable', FALSE);
    FloatEditPE.Value:=readfloat('PEC','main',20.0);
    FloatEditPE2.Value:=readfloat('PEC','secondary',0.0);
    FloatEditphase.Value:=readfloat('PEC','phase',0.0);
    
  end;
  inifile.Free;
end;

procedure TMain.ButtonSMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  piccomm := Tele.StopDec;
  Altcontrol := TRUE;
  Tele.DeSlew := FALSE;
end;

procedure TMain.SaveClick(Sender: TObject);
begin
  SaveSetting;
end;

procedure TMain.RadioButtonsidClick(Sender: TObject);
begin
  Tele.baserate := TRadioButton(Sender).tag;
  case Tele.baserate of
    0:
      Tele.target_ra_speed := SIDERALF;
    2:
      Tele.target_ra_speed := SOLARF;
    1:
      Tele.target_ra_speed := LUNARF;
    3:
      Tele.target_ra_speed := KINGF;
    4:
      Tele.target_ra_speed := 0;
  end;

end;

procedure TMain.RadioButtonSpeed(Sender: TObject);

begin
  CheckBox6.Checked := FALSE;
  TRadioButton(Sender).Checked := TRUE;
  radiotag := TRadioButton(Sender).tag;
  case radiotag of
    4:
      Tele.SetActualSpeed(SLEW);
    3:
      Tele.SetActualSpeed(FIND);
    2:
      Tele.SetActualSpeed(CENTER);
    1:
      begin
        Tele.SetActualSpeed(GUIDE);
      end
  end;
end;

procedure TMain.LX200ServerClientRead(Sender: TObject;
  Socket: TCustomWinSocket);

var
  receiveStr, responseStr: String;

begin
  // label3.Caption:=  intToDec(Tele.Decpos,2)+' '+intToAr(Tele.Arpos,1);
  receiveStr := Socket.ReceiveText;
  responseStr := ProcessLX200(receiveStr);
  LX200Server.Socket.Connections[0].SendText(responseStr);
  // Lx200Server.Socket.SendText(responseStr);
  if NOT(CheckBoxLogTCP.Checked) then
    if (MemoTraffic.Lines.count < 10) then
      MemoTraffic.Lines.Add(receiveStr + ' ' + responseStr)
    else
      MemoTraffic.Lines.clear;

end;

procedure TMain.ButtonSyncClick(Sender: TObject);
begin
  Tele.loadpos(MaskEditAr.Text, MaskEditDec.Text);
  if Tele.eqmount = ECUATOR then
    Tele.Sync(Tele.pier_side_east)
  else
    Tele.alt_az_sync;

end;

procedure TMain.LX200ServerAccept(Sender: TObject; Socket: TCustomWinSocket);
begin
  Label3.Caption := Socket.LocalAddress;
  // Lx200Server.Socket.Connections[0].SendText('OK');
end;

procedure TMain.LX200ServerClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Label3.Caption := 'Desconectado';
end;

procedure TMain.ButtonSaveEEpromClick(Sender: TObject);
begin
  Timer1.Enabled := FALSE;
  SaveSetting;
  Tele.SincroniceallDeviceSpeeds(254);
  Timer1.Enabled := TRUE;
end;

procedure TMain.ButtonAdjClick(Sender: TObject);
begin
  // editadjust.text :=  label4.Caption;
  // Tele.Adjust(strtoint(EditAdjust.text));
end;

procedure TMain.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.State = cbchecked then
    Tele.SetMountEastSide
  else
    Tele.SetMountWestSide;
end;

procedure TMain.ButtonNEMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  buttontag: Integer;
begin
  setspeed;
  Azcontrol := FALSE;
  Altcontrol := FALSE;

  buttontag := TButton(Sender).tag;
  case buttontag of
    0:
      begin
        piccomm := Tele.GoEast;
        piccomm := Tele.GoNorth;
      end;
    1:
      begin
        piccomm := Tele.GoWest;
        piccomm := Tele.GoNorth;
      end;
    2:
      begin
        piccomm := Tele.GoWest;
        piccomm := Tele.GoSouth;
      end;
    3:
      begin
        piccomm := Tele.GoEast;
        piccomm := Tele.GoSouth;
      end;
  end;

  Tele.DeSlew := FALSE;
  Tele.RaSlew := FALSE;;
end;

procedure TMain.ButtonNEMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Tele.eqmount = ECUATOR then
  begin
    piccomm := Tele.StopDec;
    piccomm := Tele.SetSideralSpeed;
    Tele.DeSlew := FALSE;
    Tele.RaSlew := FALSE;
  end
  else
    NWestUp;

  ;
end;

procedure TMain.TrackBarLedChange(Sender: TObject);
begin
  Label9.Caption := inttostr(Integer(TrackBarLed.position));
  Tele.torque(TrackBarLed.position);
end;

procedure TMain.CheckBox2Click(Sender: TObject);
begin
  Tele.Aceleration := CheckBox2.Checked;
end;

procedure TMain.ButtonfastMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Tele.FocusHiSpeed;
  Tele.Focusp;
end;

procedure TMain.ButtonfmMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  // tele.FocusLowSpeed ;
  Tele.Focusl;
end;

procedure TMain.ButtonfMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

  // tele.FocuslowSpeed;
  Tele.Focusp;

end;

procedure TMain.ButtonmmMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

  Tele.FocusHiSpeed;
  Tele.Focusl;
end;

procedure TMain.ButtonmmMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Tele.FocuStop;

end;

procedure TMain.Joystickex1Button1_Change(Sender: TObject; pressed: boolean;
  Xpos, YPos: Integer);
begin
  if pressed then

    if CheckBoxJoyF.Checked then
    begin
      CheckBox5.Checked := NOT CheckBox5.Checked;
      Tele.FocusSeleclSpeed := CheckBox5.Checked

    end
    else if CheckBoxJoyF.Checked then
      Tele.SetFocuserSpeed(0)

    else
    begin
      RadioButtonGuide.Checked := TRUE;
      radiotag := 1;
      Tele.SetActualSpeed(GUIDE);
    end;
end;

procedure TMain.Joystickex1Button2_Change(Sender: TObject; pressed: boolean;
  Xpos, YPos: Integer);
begin
  if CheckBoxJoyF.Checked then
  begin
    if pressed then
      Tele.GotoFocuser(Tele.focusmaxStep) // timer1.enabled:=false;

    else
      Tele.SetFocuserSpeed(0); // timer1.enabled:=tru;
  end
  else
  begin
    RadioButtonCenter.Checked := TRUE;
    radiotag := 2;
    Tele.SetActualSpeed(CENTER);
  end;
end;

procedure TMain.Joystickex1Button3_Change(Sender: TObject; pressed: boolean;
  Xpos, YPos: Integer);
begin
  if CheckBoxJoyF.Checked then
  begin
    if pressed then
      Tele.GotoFocuser(0) // timer1.enabled:=false;

    else
      Tele.SetFocuserSpeed(0);
  end
  else
  begin
    RadioButtonFind.Checked := TRUE;
    radiotag := 3;
    Tele.SetActualSpeed(FIND);
  end;
end;

procedure TMain.Joystickex1Button4_Change(Sender: TObject; pressed: boolean;
  Xpos, YPos: Integer);
begin
  if pressed then
    lastpress := gettickCount
  else if gettickCount - lastpress > 1000 then
    CheckBoxJoyF.Checked := NOT CheckBoxJoyF.Checked
  else
  begin
    RadioButtonSlew.Checked := TRUE;
    radiotag := 4;
    Tele.SetActualSpeed(SLEW);
  end;
end;

{ procedure TMain.Joystickex1JoyMove(Sender: TObject; XPos, YPos: Integer;
  ButtonStatus: Word; IsCalibrating: Boolean);
  begin
  setspeed;
  if Joyxstatus<>xpos then  begin
  case xpos of
  0:
  PicComm := Tele.GoEast;
  1:
  PicComm := Tele.SetSideralSpeed;
  2:
  PicComm := Tele.GoWest;
  end;
  tele.RaSlew := false
  end;
  if Joyystatus<>ypos then
  begin
  case ypos of
  0:
  PicComm := Tele.GoNorth;
  1:
  PicComm := Tele.StopDec;
  2:
  PicComm := Tele.GoSouth;
  end;
  tele.DeSlew := false;
  end;
  Joyxstatus := xpos;
  joyystatus := ypos;


  end;
}
procedure TMain.Joystickex1JoyMove(Sender: TObject; Xpos, YPos: Integer;
  ButtonStatus: Word; IsCalibrating: boolean);
var
  n: Integer;
  xyreleased: boolean;
begin

  xyreleased := (Xpos = 1) and (YPos = 1);
 // label32.caption:=inttostr(xpos)+' '+inttostr(Ypos);
  setspeed;

  begin
    if (joyxstatus <> Xpos) then
    begin

      case Xpos of
        0:
          begin
            Azcontrol := FALSE;
            piccomm := Tele.GoEast;
          end;
        1:
          if Tele.eqmount = ECUATOR then
            Tele.SetSideralSpeed;
        // else if xyreleased then Nwestup else westup;
        2:
          begin
            Azcontrol := FALSE;
            piccomm := Tele.GoWest
          end;
      end;
      Tele.RaSlew := FALSE
    end;
    if (joyystatus <> YPos) then
    begin
      case YPos of
        0:
          begin
            Altcontrol := FALSE;
            piccomm := Tele.GoNorth;
          end;
        1:
          if Tele.eqmount = ECUATOR then
            Tele.StopDec;
        // else if not xyreleased then NorthUp;
        2:
          begin
            Altcontrol := FALSE;
            piccomm := Tele.GoSouth;
          end;
      end;
      Tele.DeSlew := FALSE;
    end;
  end;

  if xyreleased then
    NWestUp;

  joyxstatus := Xpos;
  joyystatus := YPos;

end;

procedure TMain.ButtonrClick(Sender: TObject);
begin
  inc(Tele.sideralspeed);
  Tele.SetSideralSpeed;
  // label4.Caption := inttostr(tele.SideralSpeed);
end;

procedure TMain.ButtonrpClick(Sender: TObject);
begin
  dec(Tele.sideralspeed);
  Tele.SetSideralSpeed;
  // label4.Caption := inttostr(tele.SideralSpeed);
end;

procedure TMain.ButtonfMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Tele.FocuStop;

end;

procedure TMain.ButtonfastMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Tele.FocuStop;
end;

procedure TMain.ButtonfmMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Tele.FocuStop;
end;

procedure TMain.ButtomPrecClick(Sender: TObject);
begin
  Tele.Preci := TRUE;
end;

procedure TMain.ButtongotoClick(Sender: TObject);
begin
  Tele.loadpos(MaskEditAr.Text, MaskEditDec.Text);
  if Tele.eqmount = ECUATOR then
  begin
    Tele.gotoSlew;
  end;
end;

procedure TMain.Button2Click(Sender: TObject);
begin
  ShowMessage('PicGoto++ Server Interface V2.2.15'#10#13 +
    '© 2003-2014  Ángel Caparrós  ');
end;

procedure TMain.CheckBoxNMenableClick(Sender: TObject);
begin
  GroupBoxRaMotors.Enabled := CheckBoxNMenable.Checked;
  ButtonPWM.Enabled := CheckBoxNMenable.Checked;
  ButtonchangePWM2.Enabled := CheckBoxNMenable.Checked;
  Button10.Enabled := CheckBoxNMenable.Checked;
  Button11.Enabled := CheckBoxNMenable.Checked;
end;



procedure TMain.CheckBoxPecClick(Sender: TObject);
begin
//if checkboxpec.Checked then
    case tele.baserate of
    0:
      tele.target_ra_speed := SIDERALF;
    2:
      tele.target_ra_speed := SOLARF ;
    1:
      tele.target_ra_speed := LUNARF;
    3:
      tele.target_ra_speed := KINGF ;
    4:
      tele.target_ra_speed := 0;
  end;

end;

procedure TMain.ButtonCompressClick(Sender: TObject);
begin
  PageControlConf.Visible := NOT PageControlConf.Visible;
  GroupBoxcoords.Visible := NOT PageControlConf.Visible;
end;

procedure TMain.ButtonConnectClick(Sender: TObject);
begin
  if Tele.connected then
  begin
    Tele.disconnect();
    Timer1.Enabled := FALSE;
    ButtonConnect.Caption := 'Connect';
  end

  else
  begin
    Tele.connect(ComboBoxPort.Text, ComboBoxBps.Text, TRUE);
    ButtonConnect.Caption := 'DisConnect';
    Timer1.Enabled := TRUE
  end;
end;

procedure TMain.ButtonElbrusClick(Sender: TObject);
begin
  if NOT(InitConv) then
    ShowMessage('Elbrus is not running');
end;

procedure TMain.DdeClientItem1Change(Sender: TObject);
var
  coor, AR, dec: String;
begin
  // altaztoEQ
  coor := DdeClientItem1.Text;
  // label1.caption:=coor  ;
  if length(coor) > 27 then
  begin
    AR := Copy(coor, 8, 8);
    dec := Copy(coor, 20, 8);
    Label16.Caption := inttoar(trunc((strtofloat(AR) * 36.0 / 1000.0)), 3);
    Label17.Caption := inttodec(trunc((strtofloat(dec) * 36.0 / 1000.0)), 0);
    MaskEditDec.Text := Label17.Caption;
    MaskEditAr.Text := Label16.Caption;
  end;

end;

procedure TMain.ButtonPWMClick(Sender: TObject);
begin
  Timer1.Enabled := FALSE;
  sleep(100);
  if CheckBoxNMsteps.State = cbunchecked then
  begin

    Tele.SetPWMAr(0, LongEdit1.Value);
    Tele.SetPWMAr(1, LongEdit2.Value);
    Tele.SetPWMAr(2, LongEdit3.Value);
    Tele.SetPWMAr(3, LongEdit4.Value);
    Tele.SetPWMAr(4, LongEdit5.Value);
    Tele.SetPWMAr(5, LongEdit6.Value);
    Tele.SetPWMAr(6, LongEdit7.Value);
    Tele.SetPWMAr(7, LongEdit8.Value);
    Tele.SetPWMAr(8, LongEdit9.Value);
    Tele.SetPWMAr(9, LongEdit10.Value);
    Tele.SetPWMAr(10, 255);

  end
  else
  begin
    Tele.SetPWMAr(0, LongEdit1.Value);
    Tele.SetPWMAr(1, LongEdit3.Value);
    Tele.SetPWMAr(2, LongEdit5.Value);
    Tele.SetPWMAr(3, LongEdit7.Value);
    Tele.SetPWMAr(4, LongEdit9.Value);

  end;
  Timer1.Enabled := TRUE;

end;

procedure TMain.ButtonParkClick(Sender: TObject);
begin
  Timer1.Enabled := FALSE;
  Tele.RaSlew := FALSE;
  Tele.DeSlew := FALSE;
  piccomm := Tele.StopDec;
  piccomm := Tele.Ar_halt;
  // savepark;
  Timer1.Enabled := TRUE
end;

procedure TMain.Button_locClick(Sender: TObject);
begin
  Tele.SetLocation(MaskEditLong.Text, MaskEditLat.Text, LongEditGMT.Value);
end;

procedure TMain.ButtonenableresClick(Sender: TObject);
begin
  Tele.setzeroPos
end;

procedure TMain.Button3Click(Sender: TObject);
var
  p: Byte;
begin
  Timer1.Enabled := FALSE;
  if RadioPresc4.Checked then
    p := 0
  else  if RadioPresc8.Checked then
    p := 1 else p:=2;
  Tele.saveprescaler(p);
  Timer1.Enabled := TRUE;
end;

procedure TMain.buttonbaudrateClick(Sender: TObject);
var
  p: Integer;
begin
  Timer1.Enabled := FALSE;
  p := StrtoInt(ComboBoxBps.Text);
  case p of
    9600:
      Tele.savebaudrate(#129);
    19200:
      Tele.savebaudrate(#64);
    38400:
      Tele.savebaudrate(#32);
    57600:
      Tele.savebaudrate(#21);
  end;
  Timer1.Enabled := TRUE;
end;

procedure TMain.CheckBox3Click(Sender: TObject);
begin
  Buttonenableres.Enabled := CheckBox3.Checked;
end;

procedure TMain.CheckBox4Click(Sender: TObject);
begin
  if CheckBox4.Checked then
    Main.BorderStyle := bstoolwindow
  else
    Main.BorderStyle := bsnone;
end;

procedure TMain.Buttonch_timerClick(Sender: TObject);
begin
  Timer1.Enabled := FALSE;
  Timer1.Interval := LongEditpoll.Value;
  Timer1.Enabled := TRUE;
end;

procedure TMain.Button4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  // tele.SetFocuserSpeed(tele.FLspeed)
  Tele.GotoFocuser(Tele.focusmaxStep);
end;

procedure TMain.Button1Click(Sender: TObject);
begin
  // series1.Clear;
  listcomports(ComboBoxPort)
end;

procedure TMain.CheckBoxAutoslewClick(Sender: TObject);
begin
  Tele.autoslew := CheckBoxAutoslew.Checked
end;

procedure TMain.Button4MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Tele.SetFocuserSpeed(0)
end;

procedure TMain.Button5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

  // tele.SetFocuserSpeed( -tele.FLspeed)
  Tele.GotoFocuser(0);
end;

procedure TMain.LabelFocusCountDblClick(Sender: TObject);
begin
  if (LongEditFocusReset.Value > LongEditFocusmax.Value) or
    (LongEditFocusReset.Value < 0) then
    LongEditFocusReset.Value := 0;
  Tele.SetFocuserPos(LongEditFocusReset.Value);
end;

procedure TMain.Buttoneye1Click(Sender: TObject);
begin

  Tele.GotoFocuser(Tele.eye1);
  // tele.SetFocuserSpeed(35);

end;

procedure TMain.Buttoneye2Click(Sender: TObject);
begin

  Tele.GotoFocuser(Tele.eye2);
  // tele.SetFocuserSpeed(-35);
end;

{ procedure TMain.GroupBoxControlDblClick(Sender: TObject);
  begin
  pagecontrolconf.visible := NOT pagecontrolconf.Visible;
  groupboxcoords.Visible := NOT pagecontrolconf.Visible;
  end; }

procedure TMain.Buttoneye3Click(Sender: TObject);
begin
  Tele.GotoFocuser(Tele.eye3);
end;

procedure TMain.Buttoneye1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: boolean);
begin
  ShowMessage('Setting changed');
  Tele.eye1 := Tele.focuspos;
  LongEditeye1.Value := Tele.eye1;
  Buttoneye1.Hint := inttostr(Tele.eye1);
end;

procedure TMain.ButtonwheelccMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Tele.SetauxSpeed(32)
end;

procedure TMain.ButtonwheelccMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Tele.SetauxSpeed(0);
end;

procedure TMain.ButtonwheelcwMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Tele.SetauxSpeed(-32)
end;

procedure TMain.LabelWheelCountDblClick(Sender: TObject);
begin
  Tele.SetAUXPos(LongEditwres.Value);

end;

procedure TMain.CheckBox5Click(Sender: TObject);
begin
  Tele.FocusSeleclSpeed := CheckBox5.Checked;
end;

procedure TMain.Buttonaux1Click(Sender: TObject);

begin
  LabelWheelCount.Font.Color := clred;
  Tele.Gotoauxindex(TButton(Sender).tag);
end;

procedure TMain.Buttonaux2Click(Sender: TObject);
begin
  LabelWheelCount.Font.Color := clgreen;
  Tele.Gotoauxindex(TButton(Sender).tag);
end;

procedure TMain.Buttoneye4Click(Sender: TObject);
begin

  Tele.GotoFocuser(Tele.eye4)
end;

procedure TMain.Buttonaux3Click(Sender: TObject);
begin
  LabelWheelCount.Font.Color := claqua;
  Tele.Gotoauxindex(TButton(Sender).tag);
end;

procedure TMain.Buttonaux4Click(Sender: TObject);
begin
  LabelWheelCount.Font.Color := clMoneyGreen;
  Tele.Gotoauxindex(TButton(Sender).tag);
end;

procedure TMain.Buttoneye2ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: boolean);
begin
  ShowMessage('setting changed');
  Tele.eye2 := Tele.focuspos;
  LongEditeye2.Value := Tele.eye2;
  Buttoneye2.Hint := inttostr(Tele.eye2);
end;

procedure TMain.Buttoneye3ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: boolean);
begin
  ShowMessage('Setting Changed');
  Tele.eye3 := Tele.focuspos;
  LongEditeye3.Value := Tele.eye3;
  Buttoneye3.Hint := inttostr(Tele.eye3);
end;

procedure TMain.Buttoneye4ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: boolean);
begin
  ShowMessage('setting changed');
  Tele.eye4 := Tele.focuspos;
  LongEditeye4.Value := Tele.eye4;
  Buttoneye4.Hint := inttostr(Tele.eye4);
end;

procedure TMain.Buttonaux5Click(Sender: TObject);
begin
  LabelWheelCount.Font.Color := clMoneyGreen;
  Tele.Gotoauxindex(TButton(Sender).tag);
end;

procedure TMain.Buttonaux6Click(Sender: TObject);
begin
  LabelWheelCount.Font.Color := clwhite;
  Tele.auxindex := TButton(Sender).tag;
  Tele.Gotoaux(Tele.aux[Tele.auxindex]);
end;

procedure TMain.Button6Click(Sender: TObject);
begin
  Tele.target_ra_speed := (FloatEdit1.Value);
end;



procedure TMain.TrackBar1Change(Sender: TObject);
begin
  Tele.target_ra_speed := (TrackBar1.position * 30.0 - 3 * 3600.0);
  Label11.Caption := formatfloat('0.0', (Tele.target_ra_speed / SIDERALF)) +
    'X/' + floattostr(Tele.target_ra_speed) + '"';
end;

procedure TMain.ButtonFocusUpdateClick(Sender: TObject);
begin
  Tele.FocusConfig(FloatEditfocusres.Value, LongEditFocusmax.Value,
    LongEditFocusBack.Value, LongEditFocusfinespeed.Value,
    LongEditFocusMaxSpeed.Value, LongEditeye1.Value, LongEditeye2.Value,
    LongEditeye3.Value, LongEditeye4.Value);
end;

procedure TMain.Button8Click(Sender: TObject);
begin
  Tele.AuxConfig(FloatEditrotstepangle.Value, LongEditTopRcounter.Value,
    LongEditRotbackSlash.Value, LongEdittRotFspeed.Value,
    LongEdittRotFFspeed.Value, LongEditAux1.Value, LongEditAux2.Value,
    LongEditAux3.Value, LongEditAux4.Value, LongEditaux5.Value,
    LongEditaux6.Value, LongEditaux7.Value, LongEditaux8.Value);
end;

procedure TMain.CheckBox6Click(Sender: TObject);
begin
  Tele.autoguide_mode := CheckBox6.Checked;
end;

procedure TMain.ButtonchangePWM2Click(Sender: TObject);
begin
  Timer1.Enabled := FALSE;
  sleep(100);
  if CheckBoxNMsteps.State = cbunchecked then
  begin

    Tele.SetPWMDe(0, LongEdit1d.Value);
    Tele.SetPWMDe(1, LongEdit2d.Value);
    Tele.SetPWMDe(2, LongEdit3d.Value);
    Tele.SetPWMDe(3, LongEdit4d.Value);
    Tele.SetPWMDe(4, LongEdit5d.Value);
    Tele.SetPWMDe(5, LongEdit6d.Value);
    Tele.SetPWMDe(6, LongEdit7d.Value);
    Tele.SetPWMDe(7, LongEdit8d.Value);
    Tele.SetPWMDe(8, LongEdit9d.Value);
    Tele.SetPWMDe(9, LongEdit10d.Value);

  end
  else
  begin
    Tele.SetPWMDe(0, LongEdit1d.Value);
    Tele.SetPWMDe(1, LongEdit3d.Value);
    Tele.SetPWMDe(2, LongEdit5d.Value);
    Tele.SetPWMDe(3, LongEdit7d.Value);
    Tele.SetPWMDe(4, LongEdit9d.Value);

  end;
  Timer1.Enabled := TRUE;

end;

procedure TMain.Button9Click(Sender: TObject);
begin
  Tele.target_de_speed := (FloatEdit2.Value);
end;

procedure TMain.TrackBar2Change(Sender: TObject);
begin
  Tele.target_de_speed := (TrackBar2.position * 30.0 - 3 * 3600.0);
  Label63.Caption := formatfloat('0.0', (Tele.target_de_speed / SIDERALF)) +
    'X/' + floattostr(Tele.target_de_speed) + '"';
end;

procedure TMain.Button11Click(Sender: TObject);
begin
  Timer1.Enabled := FALSE;
  sleep(100);
  if CheckBoxNMsteps.State = cbunchecked then
  begin
    { 0, 38, 76, 102, 127, 153, 178, 191, 220, 235, 255 }
    Tele.SetPWMDe(0, 0);
    Tele.SetPWMDe(1, 38);
    Tele.SetPWMDe(2, 76);
    Tele.SetPWMDe(3, 102);
    Tele.SetPWMDe(4, 127);
    Tele.SetPWMDe(5, 153);
    Tele.SetPWMDe(6, 178);
    Tele.SetPWMDe(7, 191);
    Tele.SetPWMDe(8, 220);
    Tele.SetPWMDe(9, 235);

  end
  else
  begin
    Tele.SetPWMDe(0, 0);
    Tele.SetPWMDe(1, 76);
    Tele.SetPWMDe(2, 127);
    Tele.SetPWMDe(3, 191);
    Tele.SetPWMDe(4, 235);

  end;
  Timer1.Enabled := TRUE;
end;

procedure TMain.Button10Click(Sender: TObject);
begin
  Timer1.Enabled := FALSE;
  sleep(100);
  if CheckBoxNMsteps.State = cbunchecked then
  begin
    { 0, 38, 76, 102, 127, 153, 178, 191, 220, 235, 255 }
    Tele.SetPWMAr(0, 0);
    Tele.SetPWMAr(1, 38);
    Tele.SetPWMAr(2, 76);
    Tele.SetPWMAr(3, 102);
    Tele.SetPWMAr(4, 127);
    Tele.SetPWMAr(5, 153);
    Tele.SetPWMAr(6, 178);
    Tele.SetPWMAr(7, 191);
    Tele.SetPWMAr(8, 220);
    Tele.SetPWMAr(9, 235);
    // tele.SetPWMAr(10, 255);

  end
  else
  begin
    Tele.SetPWMAr(0, 0);
    Tele.SetPWMAr(1, 76);
    Tele.SetPWMAr(2, 127);
    Tele.SetPWMAr(3, 191);
    Tele.SetPWMAr(4, 235);

  end;
  Timer1.Enabled := TRUE;
end;

procedure TMain.ButtonblockClick(Sender: TObject);
begin
  Tele.arblock
end;

procedure TMain.TracktuneChange(Sender: TObject);

var
  v: Byte;
begin
  v := Tracktune.position;
  if v = 20 then
    v := 0;
  if v = 254 then
    v := 255;
  Tele.calib(v);
  Label5.Caption := inttostr(v);
end;

procedure TMain.Button12Click(Sender: TObject);
begin
  // Tele.SetPWM_Hz(#12);
  Tele.deblock
end;

procedure TMain.Button13Click(Sender: TObject);
begin
fillpec;
end;

procedure TMain.TracktunedecChange(Sender: TObject);

var
  v: Byte;
begin
  v := Tracktunedec.position;
  if v = 20 then
    v := 0;
  if v = 254 then
    v := 255;
  Tele.calibdec(v);
  Label5.Caption := inttostr(v);

end;

procedure TMain.NWestUp;
var
  n: Integer;
begin
  if Not checkboxtrack.Checked then
  begin
    piccomm := Tele.StopDec;
    piccomm := Tele.SetSideralSpeed;
  end
  else
  begin

    // tele.set_az_speed_direct(vaz);
    // tele.set_aLt_speed_direct(val);
    Tele.track_speeds(vaz, val);
    Tele.target_ra_speed := vaz;
    Tele.target_de_speed := val;

    repeat
      Application.ProcessMessages;
      inc(n);
      // tele.track_speeds(vaz, val);
    until ((Tele.current_ra_speed = Tele.target_ra_speed) and
      (Tele.current_de_speed = Tele.target_de_speed));
    Tele.loadpos(labelAR.Caption, Labeldec.Caption);
    releaseb := TRUE;
  end;
  Azcontrol := TRUE;
  Altcontrol := TRUE;
end;

Procedure TMain.WestUp;
var
  n: Integer;
begin

  if Not checkboxtrack.Checked then
    piccomm := Tele.SetSideralSpeed
  else
  begin

    Tele.track_speeds(vaz, val);
    Tele.target_ra_speed := vaz;
    repeat
      Application.ProcessMessages;
      inc(n)
    until (Tele.current_ra_speed = Tele.target_ra_speed);
    Tele.loadpos(labelAR.Caption, Labeldec.Caption);
    releaseb := TRUE;
  end;
  Azcontrol := TRUE;
end;

procedure TMain.NorthUp;
var
  n: Integer;
begin

  setspeed;
  if Not checkboxtrack.Checked then
    piccomm := Tele.StopDec
  else
  begin

    // tele.target_de_speed := val;
    Tele.track_speeds(vaz, val);
    Tele.target_de_speed := val;
    repeat
      Application.ProcessMessages;
      inc(n)
    until (Tele.current_de_speed = Tele.target_de_speed);
    Tele.loadpos(labelAR.Caption, Labeldec.Caption);
    releaseb := TRUE;
  end;
  Altcontrol := TRUE;
end;

procedure TMain.updatealtaz(aligned: boolean);
var
  tempStr: string;
  az, alt, AR, dec, ax, az1, alt1, ard, decd, azd, altd: extended;
  dectemp: Integer;
  delta_alt, delta_az: Integer;
  connectedl: Integer;
  rcode: string;
  procedure paint1;

  begin
   // if (connectedl <> 4444) then
  If( (connectedl <> 4444) and (connectedl <>25653) and (connectedl <>25654)) then
    begin // if no read toogle color led
      Shape1.brush.Color := clred;
      errorcount1 := errorcount1 + 1;

      if (errorcount1 = 5) and (checkboxtrack.Checked = TRUE) then
      begin
        checkboxtrack.Checked := FALSE;
        memolog.Lines.Add(timetostr(now) + ':No response track disable: ' +
          inttostr(connectedl));
      end;
      if errorcount1 = 50 then
      begin
        memolog.Lines.Add(timetostr(now) + ':No response,reconnecting:' +
          inttostr(connectedl));
        Tele.disconnect();
        Tele.connect(ComboBoxPort.Text, ComboBoxBps.Text, TRUE);
        errorcount1 := 0;
        if memolog.Lines.count > 100 then
          memolog.Lines.clear;
      end;

    end
    else
    begin
      if (Joystickex1.ButtonSt = 16) then
        checkboxtrack.Checked := TRUE;
      if (Joystickex1.ButtonSt = 32) then
        checkboxtrack.Checked := FALSE;
      Label32.Caption := inttostr(Joystickex1.ButtonSt);
      errorcount1 := 0;
      Shape1.brush.Color := cllime;
      Laberarpos.Caption := inttostr(Tele.arpos); // absolute encoder azimut
      LabelFocusCount.Caption := inttostr(Tele.focuspos);
      LabelWheelCount.Caption := inttostr(Tele.auxpos);
      if Tele.pier_side_east then // side of pier legacy ...

      begin
        LabePierSide.Caption := 'East Side';
        labelAR.Font.Color := clred;

        Labeldec.Font.Color := clred;
        LabePierSide.Font.Color := clred;
      end
      else
      begin
        LabePierSide.Caption := 'West Side';
        labelAR.Font.Color := clSkyBlue;
        Labeldec.Font.Color := clSkyBlue;
        LabePierSide.Font.Color := clNavy;
      end;

      // label15.Caption := inttostr(tele.ActualSpeed);

      if Tele.actualSpeedDec <> 0 then
        labeldemspeed.Caption := formatfloat('0.000', (Tele.decpos - dec2) *
          1000.0 / Timer1.Interval)
        // label30.Caption:=floattostrf(1/((tele.actualSpeedDec)*(51.2*0.000001)),ffnumber,10,3)
      else
        labeldemspeed.Caption := '0,000';
      LabelHourAngle.Caption :=
        inttoar(trunc((Tele.local_sideral_time(now) * 15.0) * 3600), 3);
      // local sideraltime
      LabelEncDec.Caption := inttostr(Tele.decpos); // absolute encoder alt
      // label30.Caption := inttostr(tele.deccounter);
      LabelAzimuth.Caption := inttodec(trunc(Tele.arCurrent), 0);
      // display azimuth altitude
      LabelAltitude.Caption := inttodec(trunc(Tele.deccurrent), 0);
      Labelraxpeed.Caption := formatfloat('0.00', (Tele.arpos - dec1) * 1000.0 *
        Tele.ArStepSize / Timer1.Interval);
      Labeldexpeed.Caption := formatfloat('0.00', (Tele.decpos - dec2) * 1000.0
        * Tele.DecStepSize / Timer1.Interval);
    end;
  end;

begin

  dec1 := Tele.arpos;
  dec2 := Tele.decpos; // store last azimut  in decl
  rcode := Tele.GetPos; // read encoders from serial port
  connectedl := StrtoInt(rcode); // get control char
  Label30.Caption := rcode;
  paint1;
  If aligned then
  begin
    Tele.starz.ra := degtorad(Tele.ardest / 3600);
    Tele.starz.dec := degtorad(Tele.DecDest / 3600);
    Tele.equ_to_mount(Tele.starz);
    delta_alt := round(radtodeg(Tele.starz.alt) * 3600 - Tele.deccurrent);
    delta_az := round(radtodeg(Tele.starz.az) * 3600 - Tele.arCurrent);
  end
  else
  begin
    ard := degtorad(Tele.ardest / 3600);
    decd := degtorad(Tele.DecDest / 3600);
    Tele.Eq_to_alaz(ard, decd, azd, altd, now);
    delta_alt := round(altd * (180.0 / pi) * 3600 - Tele.deccurrent);
    delta_az := trunc(azd * (180.0 / pi) * 3600 - Tele.arCurrent);
  end;
  if abs(delta_az) > 3600 * 180 then
    delta_az := (3600 * 360 - abs(delta_az)) * signo(-delta_az);
  If aligned then
  begin
    Tele.starz.az := degtorad((Tele.arCurrent) / 3600.0);
    Tele.starz.alt := degtorad(Tele.deccurrent / 3600.0);
    Tele.mount_to_equ(Tele.starz);
    AR := Tele.starz.ra;
    dec := Tele.starz.dec;
    labelAR.Caption := inttoar(trunc(radtodeg(AR) * 36000), 0);
  end
  else
  begin
    // --------------------------------------------------------------------------------
    Tele.altaztoEQ(AR, dec, degtorad((Tele.arCurrent) / 3600.0),
      degtorad(Tele.deccurrent / 3600.0), now);
    // calculate and store current ra and dec from alt az encoders
    ax := Tele.local_sideral_time(now) * 15 - radtodeg(AR);
    labelAR.Caption := inttoar(trunc(ax * 36000.0), 0);
  end;
  Labeldec.Caption := inttodec(trunc(radtodeg(dec) * 3600.0), 0);
  // actual dDeclination
  LabelDec1.Caption := Labeldec.Caption; // actual RA

  LabelAR1.Caption := labelAR.Caption;

  if releaseb then
  begin
    releaseb := FALSE;
    Tele.loadpos(labelAR.Caption, Labeldec.Caption);
  end;
  // if releaseb then begin releaseb := false; tele.Ardest:=round(radtodeg(tele.starz.ra)*3600);tele.DecDest:=round(radtodeg(tele.starz.dec)*3600); end;
  ;
  if CheckBoxTarget.Checked then
  begin
    MaskEditAr.Text := Tele.ReturnArDest;
    MaskEditDec.Text := Tele.returnDecDest(TRUE);
  end;

  ax := ax - radtodeg(Tele.ArTarget); // +tele.LOCAL_SIDERAL_TIME(now)*1;

  Tele.track_speeds(vaz, val);
  // calc and display  instant speed values for alt az

  // loop track speed setting....
  if checkboxtrack.Checked then
  begin

    if Altcontrol then
    begin
      if abs(delta_alt) <= Tele.radius_de then
      begin //
        if delta_alt > 0 then
        begin
          if val < 0 then
            val := val * 0.90
          else
            val := val * 1.25;
        end
        else if delta_alt < 0 then
        begin
          if val > 0 then
            val := val * 0.90
          else
            val := val * 1.25;
        end;
        // if (abs(delta_alt)<>0) and (abs(val)<>0)   then   val:=val*0.90 else val:=val*1.25;

        Tele.set_Alt_speed_direct(val);
      end
      else
      begin
        Tele.target_de_speed := 1.0 * min(abs(delta_alt), 15 * Tele.SlewrateDec)
          * signo(delta_alt);;
      end;
    end;

    if Azcontrol then
    begin
      if abs(delta_az) <= Tele.radius_RA then
      begin
        if delta_az > 0 then
        begin
          if vaz < 0 then
            vaz := vaz * 0.90
          else
            vaz := vaz * 1.25;
        end
        else if delta_az < 0 then
        begin
          if vaz > 0 then
            vaz := vaz * 0.90
          else
            vaz := vaz * 1.25;
        end;

        Tele.set_Az_speed_direct(vaz);

      end
      else
      begin
        Tele.target_ra_speed := min(abs(delta_az), 15 * Tele.Slewrate) *
          signo(delta_az);
      end;
    end
  end;

  labelarmspeed.Caption := formatfloat('0.000', vaz);
  labeldemspeed.Caption := formatfloat('0.000', val);
  Labeldelta.Caption := inttodec(delta_az, 0);
  Labeldeltalt.Caption := inttodec(delta_alt, 0);
  // label32.caption:=inttostr(errorcount1);//booltostr(altcontrol)+'  '+booltostr(azcontrol);
end;

procedure TMain.checkboxtrackClick(Sender: TObject);

begin
  if checkboxtrack.Checked then
    case Tele.eqmount of
      altaz:
        begin
          Tele.altaztoEQ(Tele.ArTarget, Tele.Dectarget,
            degtorad(Tele.arCurrent / 3600.0),
            degtorad(Tele.deccurrent / 3600), now);
          Tele.ArTarget := -Tele.ArTarget +
            degtorad(Tele.local_sideral_time(now) * 15);
          Tele.loadpos(labelAR.Caption, Labeldec.Caption);
          Altcontrol := TRUE;
          Azcontrol := TRUE;
          releaseb := TRUE
        end;
      aligned:
        begin
          Tele.starz.az := degtorad((Tele.arCurrent) / 3600.0);
          Tele.starz.alt := degtorad(Tele.deccurrent / 3600.0);
          Tele.mount_to_equ(Tele.starz);
          Tele.ArTarget := radtodeg(Tele.starz.ra);
          Tele.Dectarget := Tele.starz.dec;
          Tele.loadpos(labelAR.Caption, Labeldec.Caption);
          Altcontrol := TRUE;
          Azcontrol := TRUE;
          releaseb := TRUE;
        end;

    end
  else
  begin
    Tele.target_ra_speed := 0;
    Tele.StopDec;
  end;

end;

procedure TMain.Button14Click(Sender: TObject);
var
  ra, dec, az, alt: extended;
begin

  Tele.get_Zenith(ra, dec);
  Label27.Caption := inttoar(trunc(radtodeg(ra) * 36000), 0) + '  ' +
    inttodec(trunc(radtodeg(dec) * 3600.0), 1) + ' ' + floattostr(now * 1);
end;

procedure TMain.Button15Click(Sender: TObject);
begin
  Tele.Geo_data_align;

end;

procedure TMain.RadionoalignClick(Sender: TObject);
begin
  // checkbox6.Checked := false;
  TRadioButton(Sender).Checked := TRUE;
  radiotag := TRadioButton(Sender).tag;
  Tele.alignmode := radiotag;
end;

procedure TMain.Button_alignClick(Sender: TObject);
begin
  Tele.align_now;
end;

procedure TMain.ButtongetzenithClick(Sender: TObject);
var
  ra, dec, az, alt: extended;
begin
  Tele.get_Zenith1(ra, dec);
  Label28.Caption := inttoar(trunc(radtodeg(ra) * 36000), 0) + '  ' +
    inttodec(trunc(radtodeg(dec) * 3600.0), 1);
end;

procedure TMain.RadiomountClick(Sender: TObject);
begin
  Tele.eqmount := mmode(Radiomount.ItemIndex);
end;

procedure TMain.Joystickex1Button5_Change(Sender: TObject; pressed: boolean;
  Xpos, YPos: Integer);
begin
  checkboxtrack.Checked := FALSE;
end;

procedure TMain.ButtonbackraClick(Sender: TObject);
begin
  Tele.setRAbackslash(LongEditbackshar.Value, ifthen(CheckBsa.Checked, 1, 0));

end;

procedure TMain.ButtonbackdeClick(Sender: TObject);
begin
  Tele.setDECbackslash(LongEditbackshDe.Value, ifthen(CheckBsd.Checked, 1, 0));
end;

procedure TMain.CheckBsaClick(Sender: TObject);
begin
  Tele.setRAbackslash(LongEditbackshar.Value, ifthen(CheckBsa.Checked, 1, 0));
end;

procedure TMain.CheckBsdClick(Sender: TObject);
begin
  Tele.setDECbackslash(LongEditbackshar.Value, ifthen(CheckBsd.Checked, 1, 0));
end;

procedure TMain.ComboBox1Change(Sender: TObject);
begin
  TStyleManager.TrySetStyle(ComboBox1.Items[ComboBox1.ItemIndex]);
end;

procedure TMain.CheckBoxbsfClick(Sender: TObject);
begin
  Tele.SetfocusbackslashStatus(ifthen(CheckBoxbsf.Checked, 1, 0));

end;

procedure TMain.CheckBoxbsauxClick(Sender: TObject);
begin
  Tele.SetauxbackslashStatus(ifthen(CheckBoxbsaux.Checked, 1, 0));
end;

procedure TMain.FormShow(Sender: TObject);
var
  s: String;
begin
  if not Tele.connected then
    Tele.connect(ComboBoxPort.Text, ComboBoxBps.Text, FALSE);

  ComboBox1.Items.BeginUpdate;
  try
    ComboBox1.Items.clear;
    for s in TStyleManager.StyleNames do
      ComboBox1.Items.Add(s);
    ComboBox1.Sorted := TRUE;
    // Select the style that's currently in use in the combobox
    ComboBox1.ItemIndex := ComboBox1.Items.IndexOf
      (TStyleManager.ActiveStyle.Name);
  finally
    ComboBox1.Items.EndUpdate;
  end;
  // TStyleManager.TrySetStyle(ComboBox1.Items[1])
end;



procedure TMain.TrackBar3Change(Sender: TObject);
begin
  Main.AlphaBlend := (TrackBar3.position > 0);
  Main.AlphaBlendValue := (255 - TrackBar3.position * 20);
  // self.ScaleBy(trackbar3.Position*100+10,100);
end;

procedure TMain.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  CanClose := Buttonclose.Visible;

end;

procedure TMain.Button17Click(Sender: TObject);
begin

  Main.Hide;
  Application.Minimize

end;

procedure TMain.ButtoncloseContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: boolean);
begin
  close;
end;

procedure TMain.ButtonfoldClick(Sender: TObject);
begin

  PageControlConf.Visible := NOT PageControlConf.Visible;
  GroupBoxcoords.Visible := NOT PageControlConf.Visible;
  if PageControlConf.ActivePage = TabSheet8 then
  begin
    Panel3.Visible := PageControlConf.Visible;
    GroupBoxcoords.Visible := Panel3.Visible;
  end;
end;

procedure TMain.CheckBoxtguideClick(Sender: TObject);
begin
  Tele.guidelock := CheckBoxtguide.Checked;
end;

procedure TMain.buttonMeridianClick(Sender: TObject);
begin
  Tele.changeM(Tele.pier_side_east)
end;

procedure TMain.Button16Click(Sender: TObject);
var
  n: Integer;
begin
  for n := 1 to 20 do
    memolog.Lines.Add(inttostr(Tele.tracesp[n]));
  // tele.tracesp[n]:=0;
end;

procedure TMain.Button18Click(Sender: TObject);
begin
  Tele.forbidden_min := LongEditforb_min.Value * SIDERALF;
  Tele.forbidden_max := LongEditForb_max.Value * SIDERALF;
  Tele.forbidden_min_dec := LongEditforb_min_dec.Value * SIDERALF;
  Tele.forbidden_max_dec := LongEditForb_max_dec.Value * SIDERALF;
end;

procedure TMain.CheckBoxZoneClick(Sender: TObject);
begin
  Tele.forbidden_enable := CheckBoxZone.Checked;
end;

procedure TMain.Button19Click(Sender: TObject);
begin

  Tele.pe_size := trunc(Tele.arRed * Tele.Arsteps);
  Tele.setZeropec(0);
  Label65.Caption := inttostr(Tele.zeropec);
  // With Chart1 do
  // begin
  // Canvas.Pen.Color:=clred;
  // Canvas.MoveTo( ChartRect.Left, ChartYCenter );
  // Canvas.LineTo( ChartRect.Right, ChartYCenter );
  // end;
  // chart1.AutoRepaint:=TRUE;
end;

procedure TMain.Button20Click(Sender: TObject);
begin
  // tachartPEC.Repaint;
  DrawPELine;
end;

procedure TMain.Button21Click(Sender: TObject);

var
  i, j, d: Integer;

begin
  if ((Main.clientwidth + 100) < Screen.Width) then
  begin
    j := (Screen.Width * 100) div pushclientwidth;
    d := (j * 7) div 10;
    self.Scaleby(j, 100);
    for i := 0 to ComponentCount - 1 do
    begin
      if (Components[i] is TLongEdit) then
        TLongEdit(Components[i]).Height :=
          (TLongEdit(Components[i]).Height * d) div 100
      else if (Components[i] is TFloatEdit) then
        TFloatEdit(Components[i]).Height :=
          (TFloatEdit(Components[i]).Height * d) div 100;
    end;
    Main.position := podesktopcenter;
    Main.Top := 0;
  end;
  Button21.Enabled := FALSE;
end;

procedure TMain.Button22Click(Sender: TObject);
begin
 Serie.Destroy;
 Seriespd.Destroy;
fillPECfour();
end;

procedure TMain.Button23Click(Sender: TObject);
begin
save_mount;
end;

procedure TMain.Button24Click(Sender: TObject);

  var
  x,s: string;
  temp:integer;
begin
x:='1';
   IdUDPClientEnc.Send(x)   ;
    s:= IdUDPClientEnc.ReceiveString();
    if S='' then
       s:= IdUDPClientEnc.ReceiveString();
     label1.caption:=s;
     temp:=strtoint(s);
     tele.setzeropec( (tele.pe_size*temp) div ENCODER_RES);

end;

procedure TMain.TabSheet8Show(Sender: TObject);
begin
  Panel3.Visible := TRUE;
  GroupBoxcoords.Visible := TRUE;
end;



procedure TMain.TabSheet8Hide(Sender: TObject);
begin
  Panel3.Visible := FALSE;
  GroupBoxcoords.Visible := FALSE;
end;

procedure TMain.Buttonaux7Click(Sender: TObject);
begin
  LabelWheelCount.Font.Color := clwhite;
  Tele.auxindex := TButton(Sender).tag;
  Tele.Gotoaux(Tele.aux[Tele.auxindex]);
end;

procedure TMain.Buttonaux8Click(Sender: TObject);
begin

  LabelWheelCount.Font.Color := clwhite;
  Tele.auxindex := TButton(Sender).tag;
  Tele.Gotoaux(Tele.aux[Tele.auxindex]);
end;

procedure TMain.Buttonaux6ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: boolean);
begin
  ShowMessage('Setting changed');
  // index=tag
  Tele.aux[TButton(Sender).tag] := Tele.auxpos;
  LongEditAux1.Value := Tele.auxpos;
  Buttonaux6.Hint := inttostr(LongEditAux1.Value);
end;

procedure TMain.Buttonaux1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: boolean);
begin
  ShowMessage('Setting changed');
  // index=tag
  Tele.aux[TButton(Sender).tag] := Tele.auxpos;
  LongEditAux2.Value := Tele.auxpos;
  Buttonaux1.Hint := inttostr(LongEditAux2.Value);

end;

procedure TMain.Buttonaux2ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: boolean);
begin
  ShowMessage('setting changed');
  // index=tag
  Tele.aux[TButton(Sender).tag] := Tele.auxpos;
  LongEditAux3.Value := Tele.auxpos;
  Buttonaux2.Hint := inttostr(LongEditAux3.Value);

end;

procedure TMain.Buttonaux3ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: boolean);
begin
  ShowMessage('Setting changed');
  // index=tag
  Tele.aux[TButton(Sender).tag] := Tele.auxpos;
  LongEditAux4.Value := Tele.auxpos;
  Buttonaux3.Hint := inttostr(LongEditAux4.Value);
end;

procedure TMain.Buttonaux4ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: boolean);
begin
  ShowMessage('Setting changed');
  // index=tag
  Tele.aux[TButton(Sender).tag] := Tele.auxpos;
  LongEditaux5.Value := Tele.auxpos;
  Buttonaux4.Hint := inttostr(LongEditaux5.Value);
end;

procedure TMain.Buttonaux5ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: boolean);
begin
  ShowMessage('Setting changed');
  // index=tag
  Tele.aux[TButton(Sender).tag] := Tele.auxpos;
  LongEditaux6.Value := Tele.auxpos;
  Buttonaux5.Hint := inttostr(LongEditaux6.Value);
end;

procedure TMain.Buttonaux7ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: boolean);
begin
  ShowMessage('Setting changed');
  // index=tag
  Tele.aux[TButton(Sender).tag] := Tele.auxpos;
  LongEditaux7.Value := Tele.auxpos;
  Buttonaux7.Hint := inttostr(LongEditaux7.Value);
end;

procedure TMain.Buttonaux8ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: boolean);
begin
  ShowMessage('Setting changed');
  // index=tag
  Tele.aux[TButton(Sender).tag] := Tele.auxpos;
  LongEditaux8.Value := Tele.auxpos;
  Buttonaux8.Hint := inttostr(LongEditaux8.Value);
end;

function TMain.JvHidDeviceControllerEnumerate(HidDev: TJvHidDevice;
  const Idx: Integer): boolean;
var
  Dev: TJvHidDevice;
  DevID, idxb: Integer;
  UsagePageText, UsageText: string;
begin

  // This procedure gets all the HID items:
  // add a descriptive entry to the listbox for the device
  // UsageAndUsagePageText(HidDev.LinkCollectionNodes[Idx].LinkUsagePage,
  // HidDev.LinkCollectionNodes[Idx].LinkUsage, UsagePageText, UsageText);
  if HidDev.ProductName <> '' then
    DevID := lstHidDevices.Items.Add(HidDev.ProductName +
      Format('Device VID=%x PID=%x ', [HidDev.Attributes.VendorID,
      HidDev.Attributes.ProductID]))
  else
    DevID := lstHidDevices.Items.Add(Format('Device VID=%x PID=%x  %x %s',
      [HidDev.Attributes.VendorID, HidDev.Attributes.ProductID, Idx,
      UsageText]));
  // Retrive the device and assign it to the list
  JvHidDeviceController.CheckOutByIndex(Dev, Idx);
  lstHidDevices.Items.Objects[DevID] := Dev;
  // If this device is a joystick then set its OnData property to read  its input
  IF (trim(HidDev.ProductName) = 'Gamepad') then
    Dev.OnData := ReadJoysticks;
  Label71.Caption := HidDev.ProductName;
  // Return true so we can move on to the next device
  result := TRUE;
end;

procedure TMain.JvHidDeviceControllerDeviceChange(Sender: TObject);
var
  count: Integer;
  Dev: TJvHidDevice;
begin

  // This procedure clears all the HID items:
  // Check in all items and remove objects from the list
  for count := 0 to lstHidDevices.Items.count - 1 do
  begin
    Dev := TJvHidDevice(lstHidDevices.Items.Objects[count]);
    JvHidDeviceController.CheckIn(Dev);
    lstHidDevices.Items.Objects[count] := nil;
  end;
  // Clear the listbox
  lstHidDevices.Items.clear;
  // Get a list of connected HID items
  JvHidDeviceController.Enumerate;
end;

procedure TMain.JvHidDeviceControllerDeviceDataError(HidDev: TJvHidDevice;
  Error: Cardinal);
begin
  Label71.Caption := 'ERROR';
end;

procedure TMain.JvHidDeviceControllerDeviceUnplug(HidDev: TJvHidDevice);
begin
  Label71.Caption := 'umplug';
end;

procedure TMain.ReadJoysticks(HidDev: TJvHidDevice; ReportID: Byte;
  const Data: Pointer; Size: Word);
var
  Xaxis, Yaxis, Btn, cur, trackbnt: Integer;
begin
  // Check the X and Y axis
  Xaxis := Cardinal(Pbyte(Data)[3]);
  Yaxis := Cardinal(Pbyte(Data)[1]);
  // Check the button(s) value
  Btn := Cardinal(Pbyte(Data)[4]);
  trackbnt := Cardinal(Pbyte(Data)[5]);
  if trackbnt = 4 then
    checkboxtrack.Checked := TRUE
  else if trackbnt = 8 then
    checkboxtrack.Checked := FALSE;
  // string grid code goes here (Xaxis and Yaxis)
  // Launch the second form if a button is pressed
  cur := Btn and $000F;
  Btn := Btn and $00F0;

  Label71.Caption := inttostr(Btn) + ' ' + inttostr(cur);
  // label71.Caption:=inttostr(pint(data)[1]);
  if lastgamebutton <> Btn then
  begin
    case Btn of
      { 64:radiobuttonspeed(radiobuttonSlew);//radiobuttonSlew.checked:=true;
        128:radiobuttonspeed(radiobuttonFind);
        32:radiobuttonspeed(radiobuttonCenter) ;
        16:radiobuttonspeed(radiobuttonGuide)   ; }
      64:
        Joystickex1Button4_Change(Joystickex1, TRUE, 0, 0);
        // radiobuttonSlew.checked:=true;
      128:
        Joystickex1Button1_Change(Joystickex1, TRUE, 0, 0);
      32:
        Joystickex1Button2_Change(Joystickex1, TRUE, 0, 0);
      16:
        Joystickex1Button3_Change(Joystickex1, TRUE, 0, 0);
      0:
        begin
          case lastgamebutton of
            64:
              Joystickex1Button4_Change(Joystickex1, FALSE, 0, 0);
              // radiobuttonSlew.checked:=true;
            128:
              Joystickex1Button1_Change(Joystickex1, FALSE, 0, 0);
            32:
              Joystickex1Button2_Change(Joystickex1, FALSE, 0, 0);
            16:
              Joystickex1Button3_Change(Joystickex1, FALSE, 0, 0);
          end;
        end;
    end;
  end;
  lastgamebutton := Btn;
  if lastgamedir <> cur then
  begin
    case cur of
      { 0:    Joystickex1JoyMove(Joystickex1,1,0,0,false);
        1:    Joystickex1JoyMove(Joystickex1,2,0,0,false);
        2:    Joystickex1JoyMove(Joystickex1,2,1,0,false);
        3:    Joystickex1JoyMove(Joystickex1,2,2,0,false);
        4:    Joystickex1JoyMove(Joystickex1,1,2,0,false);
        5:    Joystickex1JoyMove(Joystickex1,0,2,0,false);
        6:    Joystickex1JoyMove(Joystickex1,0,1,0,false);
        7:    Joystickex1JoyMove(Joystickex1,0,0,0,false);
        15:  Joystickex1JoyMove(Joystickex1,1,1,0,false); }
      6:
        Joystickex1JoyMove(Joystickex1, 1, 0, 0, FALSE);
      7:
        Joystickex1JoyMove(Joystickex1, 2, 0, 0, FALSE);
      0:
        Joystickex1JoyMove(Joystickex1, 2, 1, 0, FALSE);
      1:
        Joystickex1JoyMove(Joystickex1, 2, 2, 0, FALSE);
      2:
        Joystickex1JoyMove(Joystickex1, 1, 2, 0, FALSE);
      3:
        Joystickex1JoyMove(Joystickex1, 0, 2, 0, FALSE);
      4:
        Joystickex1JoyMove(Joystickex1, 0, 1, 0, FALSE);
      5:
        Joystickex1JoyMove(Joystickex1, 0, 0, 0, FALSE);
      15:
        Joystickex1JoyMove(Joystickex1, 1, 1, 0, FALSE);

    end;
  end;
  lastgamedir := cur;
end;

function TMain.ProcessLX200(command: String): String;
var
  responseStr, commando, temp: String;
  cadena: TStringList;
  n: Integer;
begin
  with Tele do
  begin
    if command[1] = ':' then
      command := '#' + command;
    if command[1] = #6 then
      command := '#:' + command;
    temp := '';

    cadena := FormatString(command, '#:');
    for n := 1 to cadena.count - 1 do
    begin
      commando := cadena[n];
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
              focuslowspeed;
            'Q':
              FocuStop;
          end;

        'C':
          case commando[2] of
            'M':
              begin
                if eqmount = ECUATOR then
                begin
                  Sync(pier_side_east);
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
                responseStr := returneq(TRUE);
            'Z':
              if eqmount = ECUATOR then
              begin
                if Preci then
                  responseStr := inttodec(trunc(azimuth(now) * 3600.0), 3)
                else
                  responseStr := inttodec(trunc(azimuth(now) * 3600.0), 4)
              end
              else
              begin
                if Preci then
                  responseStr := inttodec(trunc(arpos * ArStepSize), 3)
                else
                  responseStr := inttodec(trunc(arpos * ArStepSize), 4);
              end;
            'A':
              if eqmount = ECUATOR then
              begin
                if Preci then
                  responseStr := inttodec(trunc(altitude(now) * 3600.0), 3)
                else
                  responseStr := inttodec(trunc(altitude(now) * 3600.0), 4)
              end
              else
              begin
                if Preci then
                  responseStr := inttodec(trunc(decpos * DecStepSize), 3)
                else
                  responseStr := inttodec(trunc(decpos * DecStepSize), 4);
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
              begin
                Altcontrol := FALSE;
                piccomm := GoNorth;
                Tele.DeSlew := FALSE;
              end;
            's':
              begin
                Altcontrol := FALSE;
                piccomm := Tele.GoSouth;
                Tele.DeSlew := FALSE;
              end;
            'e':
              begin
                Azcontrol := FALSE;
                piccomm := Tele.GoEast;
                Tele.RaSlew := FALSE;
              end;
            'w':
              begin
                Azcontrol := FALSE;
                piccomm := Tele.GoWest;
                Tele.RaSlew := FALSE;
              end;
            'S':
              begin
                if eqmount = ECUATOR then
                begin
                  gotoSlew;
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
            'n', 's':
              begin
                if Tele.eqmount = ECUATOR then
                begin
                  piccomm := Tele.StopDec;
                  Tele.DeSlew := FALSE;
                end
                else
                  NorthUp;
              end;

            'e', 'w':
              begin
                if Tele.eqmount = ECUATOR then
                begin
                  setspeed;
                  piccomm := Tele.SetSideralSpeed;
                  Tele.RaSlew := FALSE;
                end
                else
                  WestUp;
              end;

          else
            SetSideralSpeed;
            StopDec;

          end;
        'R':
          case commando[2] of
            'C':
              RadioButtonSpeed(RadioButtonCenter);
            'G':
              RadioButtonSpeed(RadioButtonGuide);
            'M':
              RadioButtonSpeed(RadioButtonFind);
            'S':
              RadioButtonSpeed(RadioButtonSlew);
          end;
        'U':
          Preci := NOT(Preci);
        'S':
          case commando[2] of
            'r':
              begin
                ardest := LX200Artoint(commando, Preci);
                if NOT pier_side_east then
                  ardest := (ardest + 180 * 3600) MOD (360 * 3600)
                  // decdest:=180*3600-decdest;
                    ;

                responseStr := '1';
              end;
            'd':
              begin
                DecDest := LX200Dectoint(commando, Preci);
                if NOT pier_side_east then
                  // decdest := signo(decdest) * 180 * 3600 - decdest;
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
      Preci := TRUE;
      temp := '110#';
    end;
    ProcessLX200 := temp;
  end;
end;

procedure TMain.CheckboxgotoClick(Sender: TObject);
begin
  Tele.lineal := Checkboxgoto.Checked
end;

procedure TMain.fillPECfour();
var
  i: Integer;
  X: double;
  periodo: Integer;
  PE_module,PE_msec,periodosec,phase,periodof:double;
begin
  periodo:=(86164)div LongEditGearAr.Value;
  periodof:=86164.091 /  LongEditGearAr.Value;
  periodosec:=floateditredar.Value;
  phase:=floateditphase.value*(PI/180.0)  ;
  PE_module:=floateditpe.Value;
  PE_msec:=floateditpe2.Value;
  Serie := TTASerie.create(TAChartPEC);
  seriespd := TTASerie.create(TAChartPEC);
  Serie.SetColor(1, clred);
  TAChartPEC.AddSerie(Serie);
  TAChartPEC.AddSerie(seriespd);
  // Seriespd.ShowLines:=true;
  // Serie.ShowLines:=true;
  Serie.ShowPoints := FALSE;
  Serie.Title := 'Sinus';
  for i := 1 to periodo do

  begin
    X := i * (2 * pi / periodof);
      Serie.AddXY(i, PE_module * sin(X) + PE_msec*(sin (X*periodosec+phase))  , clred);
      seriespd.AddXY(i, (PE_module * cos(X)+PE_msec*(periodosec)*cos(X*periodosec+phase)) * (2.0 * pi*10.0 / periodof), clyellow);
    //seriespd.AddXY(i, (PE_module * cos(X)+PE_msec*(periodosec)*cos(X*periodosec+phase)) * (2 * pi / periodo)/1.25, clyellow);
    //  Serie.AddXY(i, PE_module * sin(X) +4 * sin((X) * 12)  , clred);
   // seriespd.AddXY(i, (PE_module * cos(X)+4  * 6 * cos((X) * 12) ) * (2 * pi / periodo)/1.25, clyellow);
  //  Serie.AddXY(i, 20 * sin(X) + 4 * sin((X) * 12) + 2 * sin(X * 47), clred);
   // seriespd.AddXY(i, (20 * cos(X) + 4 * 12 * cos((X) * 12) + 2 * 47 *
  //    cos(X * 47)) * (2 * pi / 480.0)/1.25, clyellow);
    // series2.AddXY(n, 20 * cos((n + 30) * pi / 180.0) - 0 * sin(n * (pi / 30))+ 0 * sin(n * (pi / 3)), '', clgreen);
    // series3.AddXY(n,(series1.YValue[n]-series1.YValue[n-1]),'',clgreen);
  end;

end;


procedure Tmain.fillPEC();
var
  i,first: Integer;
  X,y: double;
  item:string;

   SL: TStringList;
   items: TStringDynArray;
begin
 first :=5;
    Serie.Destroy;
    Seriespd.Destroy;
  Serie := TTASerie.create(TAChartPEC);
  seriespd := TTASerie.create(TAChartPEC);
  Serie.SetColor(1, clred);
  TAChartPEC.AddSerie(Serie);
  TAChartPEC.AddSerie(seriespd);
  Seriespd.ShowLines:=true;
  Serie.ShowLines:=true;
  Serie.ShowPoints := FALSE;
  Serie.Title := 'Sinus';
    SL := TStringList.Create;
  try
    SL.LoadFromFile(s_inipath+'mypec.txt');
    for i := first to SL.Count - 1 do
    begin
      items := SplitString(SL[i], #9#32);
      y:= StrToFloat(items[2]);
      Serie.AddXY(i-first,y,clred);

    end;
     for i := first to SL.Count - 2 do
      seriespd.AddXY(i-first,(serie.GetyValue(i-first+1)-(serie.GetyValue(i-first)))*10,claqua);


  finally
    SL.Free;


end;
 end;
procedure TMain.DrawPELine;
var
  angle,X, Y, c: Integer;
  temp: string;
 spdc:double;
  //angle:real ;
begin
  Y := 500;
  //TAChartPEC.Canvas.MoveTo(linex, 0);
 // TAChartPEC.Canvas.LineTo(linex, Y);
  // angle:=(tele.ArPos-tele.zeropec)mod tele.pe_size;
  // if angle<0 then angle:=360+angle;
  // label65.caption:=inttostr(angle);
    label68.caption:=inttostr(picpec)+'  '+inttostr(tele.zeropec);
  // angle:=(angle*360)div tele.pe_size;
  angle := round(Tele.worm_angle);
{     Label65.Caption := inttostr(round(angle / (240/LongEditGearAr.Value ))) + #10#13 +
    Format('PE:%3f4"', [Serie.GetYValue(angle)]) + #10#13 +
    Format('Speed:%3f4', [SIDERALF - seriespd.GetYValue(angle)]);}
 // Canvas.Pen.Color := clwhite;
  temp := Tele.ReturnAr(TRUE, Serie.GetYValue(angle));
  Label66.Caption := temp;
 // tachartPEC.Repaint;
  TAChartPEC.Canvas.Pen.Mode := pmxor;

if (abs(Tele.target_ra_speed )< ((0.999+tele.GuideRate)*sideralf))and (abs(Tele.target_ra_speed )>=((1.0-tele.GuideRate)*sideralf)) then
begin
    spdc:=seriespd.GetYValue(angle)/10.0;//scale

     case tele.baserate of
    0:
      tele.target_ra_speed := SIDERALF - spdc;
    2:
      tele.target_ra_speed := SOLARF- spdc;
    1:
      tele.target_ra_speed := LUNARF - spdc;
    3:
      tele.target_ra_speed := KINGF -spdc;
    4:
      tele.target_ra_speed := 0;
  end;
end;
 // Tele.target_ra_speed := SIDERALF - seriespd.GetYValue(angle);
 //  Tele.target_ra_speed
{    Label65.Caption := inttostr(round(angle / (240/LongEditGearAr.Value ))) + #10#13 +
    Format('PE:%3f4"', [Serie.GetYValue(angle)]) + #10#13 +
    Format('Speed:%4f5', [tele.target_ra_speed ]);}
   Label65.Caption := floattostr((angle / (240/LongEditGearAr.Value ))) + #10#13 +
    Format('PE:%3f4"', [Serie.GetYValue(angle)]) + #10#13 +
    Format('Speed:%4f5', [tele.target_ra_speed ]);
  c := 0; // Series1.CalcYPos( );
  With TAChartPEC do
  begin
   X :=trunc( Serie.GetXImgValue(angle));


 TAChartPEC.Canvas.MoveTo(linex, 0);
 TAChartPEC.Canvas.LineTo(linex, Y);

  TAChartPEC.Canvas.MoveTo(X, c);
  TAChartPEC.Canvas.LineTo(X, Y);
     linex := X;
  end;
  // label6.caption := floattostr(tele.ArStepSize/(tele.getraspeed*tele.RA_timertick));
end;

procedure TMain.listcomports(cbx: TComboBox);
var
  reg: TRegistry;
  st: Tstrings;
  i: Integer;
begin
  reg := TRegistry.create;
  try
    cbx.clear;
    reg.RootKey := HKEY_LOCAL_MACHINE;
    reg.OpenKeyReadOnly('hardware\devicemap\serialcomm');
    st := TStringList.create;
    try
      reg.GetValueNames(st);
      for i := 0 to st.count - 1 do
        cbx.Items.Add(reg.ReadString(st.strings[i]));
      cbx.Sorted := TRUE;

    finally
      st.Free;
    end;
    reg.CloseKey;
  finally
    reg.Free;
  end;
end;

procedure TMain.Save_Mount;
var
  inifile: TiniFile;
begin

  inifile := TiniFile.create(s_inipath + 'mount.ini');
  with inifile do
  begin

    writeinteger('Mount', 'index', RadioGroup1.ItemIndex);

  end;
  inifile.Free;
end;

procedure TMain.Read_mount;
var
  inifile: TiniFile;
  temp:integer;
begin
  inifile := TiniFile.create(s_inipath + 'mount.ini');
  with inifile do
  begin
        RadioGroup1.ItemIndex :=Readinteger('Mount', 'index',0);
  end;
  inifile.Free;
 { case radiogroup1.ItemIndex of
  0: inifile_name:='picgoto.ini';
  1: inifile_name:='picgoto2.ini';
  2: inifile_name:='picgoto3.ini';  }


end;

end.
