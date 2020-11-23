unit PicgotoPlus_TLB;

// ************************************************************************ //
// WARNING
// -------
// The types declared in this file were generated from data read from a
// Type Library. If this type library is explicitly or indirectly (via
// another type library referring to this type library) re-imported, or the
// 'Refresh' command of the Type Library Editor activated while editing the
// Type Library, the contents of this file will be regenerated and all
// manual modifications will be lost.
// ************************************************************************ //

// PASTLWTR : $Revision:   1.130.1.0.1.0.1.6  $
// File generated on 03/10/2013 11:55:35 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\picgotoII\PicgotoPlus.tlb (1)
// LIBID: {B5F434CB-9598-49CC-98E4-8B44F83800B9}
// LCID: 0
// Helpfile:
// DepndLst:
// (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// (2) v4.0 StdVCL, (C:\WINDOWS\system32\stdvcl40.dll)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}

interface

uses Windows, ActiveX, Classes, Graphics, StdVCL, Variants;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
// Type Libraries     : LIBID_xxxx
// CoClasses          : CLASS_xxxx
// DISPInterfaces     : DIID_xxxx
// Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  PicgotoPlusMajorVersion = 1;
  PicgotoPlusMinorVersion = 0;

  LIBID_PicgotoPlus: TGUID = '{B5F434CB-9598-49CC-98E4-8B44F83800B9}';

  IID_ITelescope: TGUID = '{10E6D9FE-9DAD-4AF0-B226-FE2E717796E0}';
  CLASS_Telescope: TGUID = '{465DE964-4BB1-46A5-B920-D158A3FFB34A}';
  IID_IRate: TGUID = '{45869C19-EBB6-448A-BA65-5C26EB3B6748}';
  CLASS_Rate: TGUID = '{FA35F808-D58C-421E-B7FA-4E9DA6D0DA8A}';
  IID_IFocuser: TGUID = '{E4BE0EDA-785D-4A83-85A0-F2C5AE67F3EF}';
  CLASS_Focuser: TGUID = '{7892B5AD-DBED-4451-8DA4-77CDB3B2DF1D}';
  IID_IFilterWheel: TGUID = '{DF7F8465-DA05-4285-94A5-6A27E077411D}';
  CLASS_FilterWheel: TGUID = '{CD0527BC-89B1-4215-8B9B-279DEAB1D53C}';
  IID_IAxisRates: TGUID = '{D418C876-22C3-407D-806E-8D13FD6A13B2}';
  IID_ITrackingRates: TGUID = '{AF07ABEC-343F-41BA-836E-AC9AF57CBFBA}';
  CLASS_TrackingRates: TGUID = '{26702E69-B4B7-41EC-9D05-3A194A07F8A2}';
  CLASS_AxisRates: TGUID = '{B1EBEC46-5958-478E-AAB6-AC392F7FC463}';

  // *********************************************************************//
  // Declaration of Enumerations defined in Type Library
  // *********************************************************************//
  // Constants for enum AlignmentModes
type
  AlignmentModes = TOleEnum;

const
  algAltAz = $00000000;
  algGermanPolar = $00000001;
  algPolar = $00000002;

  // Constants for enum EquatorialCoordinateType
type
  EquatorialCoordinateType = TOleEnum;

const
  equLocalTopocentric = $00000001;
  equJ2000 = $00000002;
  equJ2050 = $00000003;
  equOther = $00000000;
  equB1950 = $00000004;

  // Constants for enum PierSide
type
  PierSide = TOleEnum;

const
  pierEast = $00000000;
  pierWest = $00000001;

  // Constants for enum DriveRates
type
  DriveRates = TOleEnum;

const
  driveSidereal = $00000000;
  driveLunar = $00000001;
  driveSolar = $00000002;
  driveKing = $00000003;

  // Constants for enum TelescopeAxes
type
  TelescopeAxes = TOleEnum;

const
  axisPrimary = $00000000;
  axisSecondary = $00000001;
  axisTertiary = $00000002;

  // Constants for enum GuideDirections
type
  GuideDirections = TOleEnum;

const
  guideNorth = $00000000;
  guideSouth = $00000001;
  guideEast = $00000002;
  guideWest = $00000003;

type

  // *********************************************************************//
  // Forward declaration of types defined in TypeLibrary
  // *********************************************************************//
  ITelescope = interface;
  ITelescopeDisp = dispinterface;
  IRate = interface;
  IRateDisp = dispinterface;
  IFocuser = interface;
  IFocuserDisp = dispinterface;
  IFilterWheel = interface;
  IFilterWheelDisp = dispinterface;
  IAxisRates = interface;
  IAxisRatesDisp = dispinterface;
  ITrackingRates = interface;
  ITrackingRatesDisp = dispinterface;

  // *********************************************************************//
  // Declaration of CoClasses defined in Type Library
  // (NOTE: Here we map each CoClass to its Default Interface)
  // *********************************************************************//
  Telescope = ITelescope;
  Rate = IRate;
  Focuser = IFocuser;
  FilterWheel = IFilterWheel;
  TrackingRates = ITrackingRates;
  AxisRates = IAxisRates;

  // *********************************************************************//
  // Interface: ITelescope
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {10E6D9FE-9DAD-4AF0-B226-FE2E717796E0}
  // *********************************************************************//
  ITelescope = interface(IDispatch)
    ['{10E6D9FE-9DAD-4AF0-B226-FE2E717796E0}']
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
    procedure Set_DeclinationRate(Value: Double); safecall;
    function Get_Description: WideString; safecall;
    function Get_DoesRefraction: WordBool; safecall;
    procedure Set_DoesRefraction(Value: WordBool); safecall;
    function Get_DriverInfo: WideString; safecall;
    function Get_DriverVersion: WideString; safecall;
    function Get_EquatorialSystem: EquatorialCoordinateType; safecall;
    function Get_FocalLength: Double; safecall;
    function Get_GuideRateDeclination: Double; safecall;
    procedure Set_GuideRateDeclination(Value: Double); safecall;
    function Get_GuideRateRightAscension: Double; safecall;
    procedure Set_GuideRateRightAscension(Value: Double); safecall;
    function Get_InterfaceVersion: SYSINT; safecall;
    function Get_IsPulseGuiding: WordBool; safecall;
    function Get_Name: WideString; safecall;
    function Get_RightAscension: Double; safecall;
    function Get_RightAscensionRate: Double; safecall;
    procedure Set_RightAscensionRate(Value: Double); safecall;
    function Get_SideOfPier: PierSide; safecall;
    procedure Set_SideOfPier(Value: PierSide); safecall;
    function Get_SiderealTime: Double; safecall;
    function Get_SiteElevation: Double; safecall;
    procedure Set_SiteElevation(Value: Double); safecall;
    function Get_SiteLatitude: Double; safecall;
    procedure Set_SiteLatitude(Value: Double); safecall;
    function Get_SiteLongitude: Double; safecall;
    procedure Set_SiteLongitude(Value: Double); safecall;
    function Get_Slewing: WordBool; safecall;
    function Get_SlewSettleTime: SYSINT; safecall;
    procedure Set_SlewSettleTime(Value: SYSINT); safecall;
    function Get_TargetDeclination: Double; safecall;
    procedure Set_TargetDeclination(Value: Double); safecall;
    function Get_TargetRightAscension: Double; safecall;
    procedure Set_TargetRightAscension(Value: Double); safecall;
    function Get_Tracking: WordBool; safecall;
    procedure Set_Tracking(Value: WordBool); safecall;
    function Get_TrackingRate: DriveRates; safecall;
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
    procedure DestinationSideOfPier(RightAscension: Double;
      Declination: Double); safecall;
    procedure FindHome; safecall;
    procedure MoveAxis(Axis: TelescopeAxes; Rate: Double); safecall;
    procedure Park; safecall;
    procedure PulseGuide(Direction: GuideDirections;
      Duration: Integer); safecall;
    procedure SetPark; safecall;
    procedure SetUpDialog; safecall;
    procedure SlewToAltAz(Azimut: Double; Altitude: Double); safecall;
    procedure SlewToAltAzAsync(Azimut: Double; Altitude: Double); safecall;
    procedure SlewToCoordinates(RightAscension: Double;
      Declination: Double); safecall;
    procedure SlewToCoordinatesAsync(RightAscension: Double;
      Declination: Double); safecall;
    procedure SlewToTarget; safecall;
    procedure SlewToTargetAsync; safecall;
    procedure SyncToAltAz(Azimuth: Double; Altitude: Double); safecall;
    procedure SyncToCoordinates(RightAscension: Double;
      Declination: Double); safecall;
    procedure SyncToTarget; safecall;
    procedure Unpark; safecall;
    property AlignmentMode: AlignmentModes read Get_AlignmentMode;
    property Altitude: Double read Get_Altitude;
    property ApertureArea: Double read Get_ApertureArea;
    property ApertureDiameter: Double read Get_ApertureDiameter;
    property AtHome: WordBool read Get_AtHome;
    property AtPark: WordBool read Get_AtPark;
    property Azimuth: Double read Get_Azimuth;
    property CanFindHome: WordBool read Get_CanFindHome;
    property CanPark: WordBool read Get_CanPark;
    property CanPulseGuide: WordBool read Get_CanPulseGuide;
    property CanSetDeclinationRate: WordBool read Get_CanSetDeclinationRate;
    property CanSetGuideRates: WordBool read Get_CanSetGuideRates;
    property CanSetPark: WordBool read Get_CanSetPark;
    property CanSetPierSide: WordBool read Get_CanSetPierSide;
    property CanSetRightAscensionRate: WordBool
      read Get_CanSetRightAscensionRate;
    property CanSetTracking: WordBool read Get_CanSetTracking;
    property CanSlew: WordBool read Get_CanSlew;
    property CanSlewAltAz: WordBool read Get_CanSlewAltAz;
    property CanSlewAltAzAsync: WordBool read Get_CanSlewAltAzAsync;
    property CanSlewAsync: WordBool read Get_CanSlewAsync;
    property CanSync: WordBool read Get_CanSync;
    property CanSyncAltAz: WordBool read Get_CanSyncAltAz;
    property CanUnpark: WordBool read Get_CanUnpark;
    property Connected: WordBool read Get_Connected write Set_Connected;
    property Declination: Double read Get_Declination;
    property DeclinationRate: Double read Get_DeclinationRate
      write Set_DeclinationRate;
    property Description: WideString read Get_Description;
    property DoesRefraction: WordBool read Get_DoesRefraction
      write Set_DoesRefraction;
    property DriverInfo: WideString read Get_DriverInfo;
    property DriverVersion: WideString read Get_DriverVersion;
    property EquatorialSystem: EquatorialCoordinateType
      read Get_EquatorialSystem;
    property FocalLength: Double read Get_FocalLength;
    property GuideRateDeclination: Double read Get_GuideRateDeclination
      write Set_GuideRateDeclination;
    property GuideRateRightAscension: Double read Get_GuideRateRightAscension
      write Set_GuideRateRightAscension;
    property InterfaceVersion: SYSINT read Get_InterfaceVersion;
    property IsPulseGuiding: WordBool read Get_IsPulseGuiding;
    property Name: WideString read Get_Name;
    property RightAscension: Double read Get_RightAscension;
    property RightAscensionRate: Double read Get_RightAscensionRate
      write Set_RightAscensionRate;
    property SideOfPier: PierSide read Get_SideOfPier write Set_SideOfPier;
    property SiderealTime: Double read Get_SiderealTime;
    property SiteElevation: Double read Get_SiteElevation
      write Set_SiteElevation;
    property SiteLatitude: Double read Get_SiteLatitude write Set_SiteLatitude;
    property SiteLongitude: Double read Get_SiteLongitude
      write Set_SiteLongitude;
    property Slewing: WordBool read Get_Slewing;
    property SlewSettleTime: SYSINT read Get_SlewSettleTime
      write Set_SlewSettleTime;
    property TargetDeclination: Double read Get_TargetDeclination
      write Set_TargetDeclination;
    property TargetRightAscension: Double read Get_TargetRightAscension
      write Set_TargetRightAscension;
    property Tracking: WordBool read Get_Tracking write Set_Tracking;
    property TrackingRate: DriveRates read Get_TrackingRate
      write Set_TrackingRate;
    property TrackingRates: ITrackingRates read Get_TrackingRates;
    property UTCDate: TDateTime read Get_UTCDate write Set_UTCDate;
  end;

  // *********************************************************************//
  // DispIntf:  ITelescopeDisp
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {10E6D9FE-9DAD-4AF0-B226-FE2E717796E0}
  // *********************************************************************//
  ITelescopeDisp = dispinterface
    ['{10E6D9FE-9DAD-4AF0-B226-FE2E717796E0}']
    property AlignmentMode: AlignmentModes readonly dispid 1;
    property Altitude: Double readonly dispid 2;
    property ApertureArea: Double readonly dispid 3;
    property ApertureDiameter: Double readonly dispid 4;
    property AtHome: WordBool readonly dispid 5;
    property AtPark: WordBool readonly dispid 6;
    property Azimuth: Double readonly dispid 7;
    property CanFindHome: WordBool readonly dispid 8;
    property CanPark: WordBool readonly dispid 9;
    property CanPulseGuide: WordBool readonly dispid 10;
    property CanSetDeclinationRate: WordBool readonly dispid 11;
    property CanSetGuideRates: WordBool readonly dispid 12;
    property CanSetPark: WordBool readonly dispid 13;
    property CanSetPierSide: WordBool readonly dispid 14;
    property CanSetRightAscensionRate: WordBool readonly dispid 15;
    property CanSetTracking: WordBool readonly dispid 16;
    property CanSlew: WordBool readonly dispid 17;
    property CanSlewAltAz: WordBool readonly dispid 18;
    property CanSlewAltAzAsync: WordBool readonly dispid 19;
    property CanSlewAsync: WordBool readonly dispid 20;
    property CanSync: WordBool readonly dispid 21;
    property CanSyncAltAz: WordBool readonly dispid 22;
    property CanUnpark: WordBool readonly dispid 23;
    property Connected: WordBool dispid 24;
    property Declination: Double readonly dispid 25;
    property DeclinationRate: Double dispid 26;
    property Description: WideString readonly dispid 27;
    property DoesRefraction: WordBool dispid 28;
    property DriverInfo: WideString readonly dispid 29;
    property DriverVersion: WideString readonly dispid 30;
    property EquatorialSystem: EquatorialCoordinateType readonly dispid 31;
    property FocalLength: Double readonly dispid 32;
    property GuideRateDeclination: Double dispid 33;
    property GuideRateRightAscension: Double dispid 34;
    property InterfaceVersion: SYSINT readonly dispid 35;
    property IsPulseGuiding: WordBool readonly dispid 36;
    property Name: WideString readonly dispid 37;
    property RightAscension: Double readonly dispid 38;
    property RightAscensionRate: Double dispid 39;
    property SideOfPier: PierSide dispid 40;
    property SiderealTime: Double readonly dispid 41;
    property SiteElevation: Double dispid 42;
    property SiteLatitude: Double dispid 43;
    property SiteLongitude: Double dispid 44;
    property Slewing: WordBool readonly dispid 45;
    property SlewSettleTime: SYSINT dispid 46;
    property TargetDeclination: Double dispid 47;
    property TargetRightAscension: Double dispid 48;
    property Tracking: WordBool dispid 49;
    property TrackingRate: DriveRates dispid 50;
    property TrackingRates: ITrackingRates readonly dispid 51;
    property UTCDate: TDateTime dispid 52;
    procedure AbortSlew; dispid 53;
    procedure AxisRates(Axis: TelescopeAxes); dispid 54;
    function CanMoveAxis(Axis: TelescopeAxes): WordBool; dispid 55;
    procedure CommandBlind(const Command: WideString; Raw: WordBool); dispid 56;
    procedure CommandBool(const Command: WideString; Raw: Integer); dispid 57;
    procedure CommandString(const Command: WideString; Raw: WordBool);
      dispid 58;
    procedure DestinationSideOfPier(RightAscension: Double;
      Declination: Double); dispid 59;
    procedure FindHome; dispid 60;
    procedure MoveAxis(Axis: TelescopeAxes; Rate: Double); dispid 61;
    procedure Park; dispid 62;
    procedure PulseGuide(Direction: GuideDirections; Duration: Integer);
      dispid 63;
    procedure SetPark; dispid 64;
    procedure SetUpDialog; dispid 65;
    procedure SlewToAltAz(Azimut: Double; Altitude: Double); dispid 66;
    procedure SlewToAltAzAsync(Azimut: Double; Altitude: Double); dispid 67;
    procedure SlewToCoordinates(RightAscension: Double; Declination: Double);
      dispid 68;
    procedure SlewToCoordinatesAsync(RightAscension: Double;
      Declination: Double); dispid 69;
    procedure SlewToTarget; dispid 70;
    procedure SlewToTargetAsync; dispid 71;
    procedure SyncToAltAz(Azimuth: Double; Altitude: Double); dispid 72;
    procedure SyncToCoordinates(RightAscension: Double; Declination: Double);
      dispid 73;
    procedure SyncToTarget; dispid 74;
    procedure Unpark; dispid 75;
  end;

  // *********************************************************************//
  // Interface: IRate
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {45869C19-EBB6-448A-BA65-5C26EB3B6748}
  // *********************************************************************//
  IRate = interface(IDispatch)
    ['{45869C19-EBB6-448A-BA65-5C26EB3B6748}']
    function Get_Maximum: Double; safecall;
    procedure Set_Maximum(Value: Double); safecall;
    function Get_Minimum: Double; safecall;
    procedure Set_Minimum(Value: Double); safecall;
    property Maximum: Double read Get_Maximum write Set_Maximum;
    property Minimum: Double read Get_Minimum write Set_Minimum;
  end;

  // *********************************************************************//
  // DispIntf:  IRateDisp
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {45869C19-EBB6-448A-BA65-5C26EB3B6748}
  // *********************************************************************//
  IRateDisp = dispinterface
    ['{45869C19-EBB6-448A-BA65-5C26EB3B6748}']
    property Maximum: Double dispid 4;
    property Minimum: Double dispid 5;
  end;

  // *********************************************************************//
  // Interface: IFocuser
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {E4BE0EDA-785D-4A83-85A0-F2C5AE67F3EF}
  // *********************************************************************//
  IFocuser = interface(IDispatch)
    ['{E4BE0EDA-785D-4A83-85A0-F2C5AE67F3EF}']
    function Get_Absolute: WordBool; safecall;
    function Get_IsMoving: WordBool; safecall;
    function Get_Link: WordBool; safecall;
    procedure Set_Link(__MIDL_0095: WordBool); safecall;
    function Get_MaxIncrement: Integer; safecall;
    function Get_MaxStep: Integer; safecall;
    function Get_Position: Integer; safecall;
    function Get_StepSize: Double; safecall;
    function Get_TempComp: WordBool; safecall;
    procedure Set_TempComp(__MIDL_0101: WordBool); safecall;
    function Get_TempCompAvailable: WordBool; safecall;
    function Get_Temperature: Double; safecall;
    procedure Halt; safecall;
    procedure SetUpDialog; safecall;
    procedure Move(val: Integer); safecall;
    property Absolute: WordBool read Get_Absolute;
    property IsMoving: WordBool read Get_IsMoving;
    property Link: WordBool read Get_Link write Set_Link;
    property MaxIncrement: Integer read Get_MaxIncrement;
    property MaxStep: Integer read Get_MaxStep;
    property Position: Integer read Get_Position;
    property StepSize: Double read Get_StepSize;
    property TempComp: WordBool read Get_TempComp write Set_TempComp;
    property TempCompAvailable: WordBool read Get_TempCompAvailable;
    property Temperature: Double read Get_Temperature;
  end;

  // *********************************************************************//
  // DispIntf:  IFocuserDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {E4BE0EDA-785D-4A83-85A0-F2C5AE67F3EF}
  // *********************************************************************//
  IFocuserDisp = dispinterface
    ['{E4BE0EDA-785D-4A83-85A0-F2C5AE67F3EF}']
    property Absolute: WordBool readonly dispid 101;
    property IsMoving: WordBool readonly dispid 102;
    property Link: WordBool dispid 103;
    property MaxIncrement: Integer readonly dispid 104;
    property MaxStep: Integer readonly dispid 105;
    property Position: Integer readonly dispid 106;
    property StepSize: Double readonly dispid 107;
    property TempComp: WordBool dispid 108;
    property TempCompAvailable: WordBool readonly dispid 109;
    property Temperature: Double readonly dispid 110;
    procedure Halt; dispid 401;
    procedure SetUpDialog; dispid 402;
    procedure Move(val: Integer); dispid 403;
  end;

  // *********************************************************************//
  // Interface: IFilterWheel
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {DF7F8465-DA05-4285-94A5-6A27E077411D}
  // *********************************************************************//
  IFilterWheel = interface(IDispatch)
    ['{DF7F8465-DA05-4285-94A5-6A27E077411D}']
    function Get_Connected: WordBool; safecall;
    procedure Set_Connected(Value: WordBool); safecall;
    function Get_FocusOffsets: PSafeArray; safecall;
    function Get_Position: Smallint; safecall;
    procedure Set_Position(pVal: Smallint); safecall;
    function Get_Names: PSafeArray; safecall;
    procedure SetUpDialog; safecall;
    property Connected: WordBool read Get_Connected write Set_Connected;
    property FocusOffsets: PSafeArray read Get_FocusOffsets;
    property Position: Smallint read Get_Position write Set_Position;
    property Names: PSafeArray read Get_Names;
  end;

  // *********************************************************************//
  // DispIntf:  IFilterWheelDisp
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {DF7F8465-DA05-4285-94A5-6A27E077411D}
  // *********************************************************************//
  IFilterWheelDisp = dispinterface
    ['{DF7F8465-DA05-4285-94A5-6A27E077411D}']
    property Connected: WordBool dispid 1;
    property FocusOffsets: { ??PSafeArray } OleVariant readonly dispid 102;
    property Position: Smallint dispid 103;
    property Names: { ??PSafeArray } OleVariant readonly dispid 104;
    procedure SetUpDialog; dispid 401;
  end;

  // *********************************************************************//
  // Interface: IAxisRates
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {D418C876-22C3-407D-806E-8D13FD6A13B2}
  // *********************************************************************//
  IAxisRates = interface(IDispatch)
    ['{D418C876-22C3-407D-806E-8D13FD6A13B2}']
    function Get_Count: Integer; safecall;
    function Get_Item(Index: Integer): IRate; safecall;
    function Get_NewEnum: IEnumVARIANT; safecall;
    property Count: Integer read Get_Count;
    property Item[Index: Integer]: IRate read Get_Item; default;
    property NewEnum: IEnumVARIANT read Get_NewEnum;
  end;

  // *********************************************************************//
  // DispIntf:  IAxisRatesDisp
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {D418C876-22C3-407D-806E-8D13FD6A13B2}
  // *********************************************************************//
  IAxisRatesDisp = dispinterface
    ['{D418C876-22C3-407D-806E-8D13FD6A13B2}']
    property Count: Integer readonly dispid 101;
    property Item[Index: Integer]: IRate readonly dispid 0; default;
    property NewEnum: IEnumVARIANT readonly dispid - 4;
  end;

  // *********************************************************************//
  // Interface: ITrackingRates
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {AF07ABEC-343F-41BA-836E-AC9AF57CBFBA}
  // *********************************************************************//
  ITrackingRates = interface(IDispatch)
    ['{AF07ABEC-343F-41BA-836E-AC9AF57CBFBA}']
    function Get_Count: Integer; safecall;
    function Get_Item(Index: Integer): DriveRates; safecall;
    function GetEnumerator: IEnumVARIANT; safecall;
    property Count: Integer read Get_Count;
    property Item[Index: Integer]: DriveRates read Get_Item; default;
  end;

  // *********************************************************************//
  // DispIntf:  ITrackingRatesDisp
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {AF07ABEC-343F-41BA-836E-AC9AF57CBFBA}
  // *********************************************************************//
  ITrackingRatesDisp = dispinterface
    ['{AF07ABEC-343F-41BA-836E-AC9AF57CBFBA}']
    property Count: Integer readonly dispid 101;
    property Item[Index: Integer]: DriveRates readonly dispid 0; default;
    function GetEnumerator: IEnumVARIANT; dispid 1;
  end;

  // *********************************************************************//
  // The Class CoTelescope provides a Create and CreateRemote method to
  // create instances of the default interface ITelescope exposed by
  // the CoClass Telescope. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoTelescope = class
    class function Create: ITelescope;
    class function CreateRemote(const MachineName: string): ITelescope;
  end;

  // *********************************************************************//
  // The Class CoRate provides a Create and CreateRemote method to
  // create instances of the default interface IRate exposed by
  // the CoClass Rate. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoRate = class
    class function Create: IRate;
    class function CreateRemote(const MachineName: string): IRate;
  end;

  // *********************************************************************//
  // The Class CoFocuser provides a Create and CreateRemote method to
  // create instances of the default interface IFocuser exposed by
  // the CoClass Focuser. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoFocuser = class
    class function Create: IFocuser;
    class function CreateRemote(const MachineName: string): IFocuser;
  end;

  // *********************************************************************//
  // The Class CoFilterWheel provides a Create and CreateRemote method to
  // create instances of the default interface IFilterWheel exposed by
  // the CoClass FilterWheel. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoFilterWheel = class
    class function Create: IFilterWheel;
    class function CreateRemote(const MachineName: string): IFilterWheel;
  end;

  // *********************************************************************//
  // The Class CoTrackingRates provides a Create and CreateRemote method to
  // create instances of the default interface ITrackingRates exposed by
  // the CoClass TrackingRates. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoTrackingRates = class
    class function Create: ITrackingRates;
    class function CreateRemote(const MachineName: string): ITrackingRates;
  end;

  // *********************************************************************//
  // The Class CoAxisRates provides a Create and CreateRemote method to
  // create instances of the default interface IAxisRates exposed by
  // the CoClass AxisRates. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoAxisRates = class
    class function Create: IAxisRates;
    class function CreateRemote(const MachineName: string): IAxisRates;
  end;

implementation

uses ComObj;

class function CoTelescope.Create: ITelescope;
begin
  Result := CreateComObject(CLASS_Telescope) as ITelescope;
end;

class function CoTelescope.CreateRemote(const MachineName: string): ITelescope;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Telescope) as ITelescope;
end;

class function CoRate.Create: IRate;
begin
  Result := CreateComObject(CLASS_Rate) as IRate;
end;

class function CoRate.CreateRemote(const MachineName: string): IRate;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Rate) as IRate;
end;

class function CoFocuser.Create: IFocuser;
begin
  Result := CreateComObject(CLASS_Focuser) as IFocuser;
end;

class function CoFocuser.CreateRemote(const MachineName: string): IFocuser;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Focuser) as IFocuser;
end;

class function CoFilterWheel.Create: IFilterWheel;
begin
  Result := CreateComObject(CLASS_FilterWheel) as IFilterWheel;
end;

class function CoFilterWheel.CreateRemote(const MachineName: string)
  : IFilterWheel;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_FilterWheel)
    as IFilterWheel;
end;

class function CoTrackingRates.Create: ITrackingRates;
begin
  Result := CreateComObject(CLASS_TrackingRates) as ITrackingRates;
end;

class function CoTrackingRates.CreateRemote(const MachineName: string)
  : ITrackingRates;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TrackingRates)
    as ITrackingRates;
end;

class function CoAxisRates.Create: IAxisRates;
begin
  Result := CreateComObject(CLASS_AxisRates) as IAxisRates;
end;

class function CoAxisRates.CreateRemote(const MachineName: string): IAxisRates;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AxisRates) as IAxisRates;
end;

end.
