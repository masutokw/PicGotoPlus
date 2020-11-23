unit setupfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, EnhEdits;

type
  TSetupDialogForm = class(TForm)
    Button1: TButton;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SetupDialogForm: TSetupDialogForm;

implementation

{$R *.dfm}

procedure TSetupDialogForm.Button1Click(Sender: TObject);
begin
  self.Close;
end;

end.
