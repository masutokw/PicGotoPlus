program PicgotoPlus;

{$R *.dres}

uses
  Forms,
  dialogs,
  PicGoto in 'PicGoto.pas' {Main},
  serial in 'serial.pas',
  ptool in 'ptool.pas',
  setupfrm in 'setupfrm.pas' {SetupDialogForm},
  PicgotoPlus_TLB in 'PicgotoPlus_TLB.pas',
  PicgotoPlusi in 'PicgotoPlusi.pas' {Telescope: CoClass},
  telescope in 'telescope.pas',
  PicgotoPlusfi in 'PicgotoPlusfi.pas',
  PicgotoPLusWi in 'PicgotoPLusWi.pas',
  align in 'align.pas',
  picplus in 'picplus.pas',
  ComServ,
  ComObj,
  windows,
  Vcl.Themes,
  Vcl.Styles;

{$R *.TLB}

{$R *.res}
 type
  {TFactoryRegisterClass }
  TFactoryRegisterClass = class(TObject)
  private
    procedure FactoryRegisterClassObject(Factory: TComObjectFactory);
  end;

{ TFactoryRegisterClass }
procedure TFactoryRegisterClass.FactoryRegisterClassObject(
  Factory: TComObjectFactory);
begin
  Factory.RegisterClassObject;
end;


// Make additional initialization steps when
// user have not write access to the registry, because in unit
// ComServer.pas in TComServer.Initialize handles EOleRegistrationError
// instead of EOleSysError that will be occureed when Comserver does not
// registred
procedure DoInitComServer;
begin
  // Processes iterative actions on factories associated with a given server -
  // create stub class
  with TFactoryRegisterClass.Create do
  try
     ComClassManager.ForEachFactory(ComServer, FactoryRegisterClassObject);
  finally
     Free;
  end;
  // inform the OLE SCM about all registered classes, and permits activation
  // requests for those class objects.
  if ComServer.StartSuspended then ComObj.CoResumeClassObjects;
end;
begin

    try
      Application.Initialize;
    except
       on E:EOleRegistrationError  do
             // halt when server process registration only
         if ComServer.StartMode in [smRegServer, smUnregServer] then raise
         else // process registration: skip ComServer.pas bug
             begin  DoInitComServer ; end;
      
      on E:EOleSysError do
         // halt when server process registration only
         if ComServer.StartMode in [smRegServer, smUnregServer] then raise
         else // process registration: skip ComServer.pas bug
             begin  DoInitComServer ; end;
      else raise
    end;

    // ShowMessage('Self-Registering: ASCOM ' + DRIVER_ID);

  TStyleManager.TrySetStyle('Cobalt XEMedia');
  Application.Title := 'PicGoto++';
  Application.CreateForm(TMain, Main);
  Application.Run;

end.
