object SetupDialogForm: TSetupDialogForm
  Left = 978
  Top = 246
  BorderStyle = bsToolWindow
  Caption = 'Pgtsetup'
  ClientHeight = 91
  ClientWidth = 256
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF004444
    4444444444444444444444444444444444444444444444444444444444444444
    4444444CCCCCCCCC44444444444444444444444CCCCCCCCC4444444444444444
    4444444444CC444444444444444444444444444444CC44444444444444444444
    4444444444CC444444444444444444444444444444CC44444444444444444444
    4444444444CC444444444444444444444444444444CC44449944444444444444
    4444444444CC44499944444444444B44444444444CCC44499444444444444444
    4444444444CCC4994444444444444B4B4444F44444CCCC944444444444444444
    444FFFF44444CCC44444444444444444444FFFFF44449C444444444444444444
    44FFFFFFF0499444444444444444444444FFFFFF0FF944444444B44444444444
    444FFFF0FFFF0444444444444444444444444FF0FFF0FF444444B4B444444444
    4444440FFF0FFFFF444444444444444444444444FF0FFFFFF444444444444B44
    4444444440FFFFFFFFF444444444444444444444444FFFFFFFFF444444444B4B
    444444444444FFFFFFF444444444444444444444444444FFFFF4444444444444
    444444444444444FFF44444444444444444B4444444444444F444B4444444444
    4BB444444444444444444444444444444BBB4B444444444444444B4B44444444
    4444444444444444444444444444444444444444444444444444444444440000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 13
    Top = 60
    Width = 121
    Height = 13
    Caption = 'LX200 COM based Driver'
  end
  object Button1: TButton
    Left = 193
    Top = 57
    Width = 46
    Height = 28
    Caption = '&Exit'
    TabOrder = 0
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 11
    Top = 7
    Width = 228
    Height = 46
    Caption = 'Settings'
    TabOrder = 1
    object Label1: TLabel
      Left = 7
      Top = 19
      Width = 165
      Height = 13
      Caption = 'Configuration  on  Picgoto'#180's Panels'
    end
  end
end
