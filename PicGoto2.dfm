object Main: TMain
  Left = 294
  Top = 183
  Width = 528
  Height = 328
  AlphaBlendValue = 160
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = 'PicGoto++ Server v2.2.18'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsStayOnTop
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF002222
    2222222222222222222222222222AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    AAAAA77777777777777AAAAAAAAA44444444444FFFFFFFFFF444444444444444
    4444444FFFFFFFFFF44444444444444444444F4FFF7777FFF444444444444444
    4444FF4FFFFFFFFFF444444444444444444FFF4FFFFFFFFFF444444444444444
    44FFFF0FFFFFFFFFF4444444444444444FFFFF0FFF4444FFF444444444444444
    44FFFF4FF44FF44FF444444444444444444FF4FF4FFFFFF4F444444444444444
    4444FF44FFFFFFF4444444444444444444444F44FFF00FFF4444444444444444
    444444F4FFF00FFFF4444444444444444444444F4FFFFFF44F44444449444444
    84444444FFFFFFF4FFF4444444444444444444444F4FF44FFFFF444444444444
    4444444444F4444FFFF4F4444444444444444444444F44FFFFFF4F4444444444
    4F4444444444FFFFFFFFF4F4444444444444444444444FFFFFFFFF4F44444444
    44444444444444FFFFFFFFFFF4444444444444444444444FFFF0FFFFFF444444
    4444444444444444FFFF0FFFF444444484444444444444444FFFFFFF44444444
    4444444444F4444444FFFFF4444444444444448444444444444FFF4444444444
    44444444444444444444F44444444444F4444444444444484444444444444444
    4444444444444444444444444444444444444444444444444444444444440000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Label67: TLabel
    Left = 424
    Top = 3
    Width = 45
    Height = 15
    Caption = 'Label67'
    Visible = False
  end
  object GroupBoxControl: TGroupBox
    Left = 0
    Top = 0
    Width = 124
    Height = 234
    Caption = 'KeyPad'
    Color = clBtnFace
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 112
      Top = 344
      Width = 32
      Height = 14
      Caption = 'Label1'
    end
    object Panel1: TPanel
      Left = 6
      Top = 11
      Width = 115
      Height = 114
      Cursor = crArrow
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = True
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      object Shape1: TShape
        Left = 1
        Top = 2
        Width = 10
        Height = 10
        Brush.Color = clRed
        Shape = stCircle
      end
      object ButtonNE: TButton
        Left = 11
        Top = 10
        Width = 23
        Height = 21
        Caption = 'NE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnMouseDown = ButtonNEMouseDown
        OnMouseUp = ButtonNEMouseUp
      end
      object ButtonN: TButton
        Left = 43
        Top = 8
        Width = 28
        Height = 24
        Caption = 'N'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnMouseDown = ButtonNMouseDown
        OnMouseUp = ButtonNMouseUp
      end
      object ButtonNW: TButton
        Tag = 1
        Left = 80
        Top = 11
        Width = 23
        Height = 21
        Caption = 'NW'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnMouseDown = ButtonNEMouseDown
        OnMouseUp = ButtonNEMouseUp
      end
      object ButtonW: TButton
        Left = 78
        Top = 38
        Width = 28
        Height = 24
        Caption = 'W'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnMouseDown = ButtonWMouseDown
        OnMouseUp = ButtonWMouseUp
      end
      object ButtonSW: TButton
        Tag = 2
        Left = 80
        Top = 70
        Width = 23
        Height = 21
        Caption = 'SW'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnMouseDown = ButtonNEMouseDown
        OnMouseUp = ButtonNEMouseUp
      end
      object ButtonS: TButton
        Left = 43
        Top = 67
        Width = 28
        Height = 24
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnMouseDown = ButtonSMouseDown
        OnMouseUp = ButtonNMouseUp
      end
      object ButtonH: TButton
        Left = 44
        Top = 33
        Width = 26
        Height = 16
        Caption = 'H'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = ButtonHClick
      end
      object ButtonE: TButton
        Tag = 1
        Left = 8
        Top = 38
        Width = 28
        Height = 24
        Caption = 'E'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        OnMouseDown = ButtonWMouseDown
        OnMouseUp = ButtonWMouseUp
      end
      object ButtonSE: TButton
        Tag = 3
        Left = 11
        Top = 69
        Width = 23
        Height = 21
        Caption = 'SE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnMouseDown = ButtonNEMouseDown
        OnMouseUp = ButtonNEMouseUp
      end
      object RadioButtonSlew: TRadioButton
        Tag = 4
        Left = 2
        Top = 92
        Width = 28
        Height = 17
        Hint = 'Set Slew Speed'
        Caption = 'S'
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        OnClick = RadioButtonSpeed
      end
      object RadioButtonCenter: TRadioButton
        Tag = 2
        Left = 54
        Top = 92
        Width = 28
        Height = 17
        Hint = 'Set Center Speed'
        Caption = 'C'
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 10
        OnClick = RadioButtonSpeed
      end
      object RadioButtonFind: TRadioButton
        Tag = 3
        Left = 28
        Top = 92
        Width = 25
        Height = 17
        Hint = 'Set Find speed'
        Caption = 'F'
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        OnClick = RadioButtonSpeed
      end
      object RadioButtonGuide: TRadioButton
        Tag = 1
        Left = 81
        Top = 93
        Width = 30
        Height = 15
        Hint = 'Set Guide Speed'
        Caption = 'G'
        Checked = True
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        TabStop = True
        OnClick = RadioButtonSpeed
      end
      object ButtonPark: TButton
        Left = 44
        Top = 50
        Width = 26
        Height = 16
        Hint = 'Park mount'
        Caption = 'Park'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        OnClick = ButtonParkClick
      end
    end
    object GroupBox11: TGroupBox
      Left = 6
      Top = 125
      Width = 114
      Height = 53
      Caption = 'Focus'
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      object LabelFocusCount: TLabel
        Left = 63
        Top = 13
        Width = 48
        Height = 15
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clAqua
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        OnDblClick = LabelFocusCountDblClick
      end
      object Button4: TButton
        Left = 34
        Top = 14
        Width = 24
        Height = 16
        Caption = 'Out'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnMouseDown = Button4MouseDown
        OnMouseUp = Button4MouseUp
      end
      object Button5: TButton
        Left = 6
        Top = 14
        Width = 24
        Height = 16
        Caption = 'In'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnMouseDown = Button5MouseDown
        OnMouseUp = Button4MouseUp
      end
      object Buttoneye1: TButton
        Left = 6
        Top = 34
        Width = 24
        Height = 16
        Caption = 'M1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = Buttoneye1Click
        OnContextPopup = Buttoneye1ContextPopup
      end
      object Buttoneye2: TButton
        Left = 33
        Top = 34
        Width = 24
        Height = 16
        Caption = 'M2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = Buttoneye2Click
        OnContextPopup = Buttoneye2ContextPopup
      end
      object Buttoneye3: TButton
        Left = 60
        Top = 34
        Width = 24
        Height = 16
        Caption = 'M3'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = Buttoneye3Click
        OnContextPopup = Buttoneye3ContextPopup
      end
      object Buttoneye4: TButton
        Left = 88
        Top = 34
        Width = 24
        Height = 16
        Caption = 'M4'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = Buttoneye4Click
        OnContextPopup = Buttoneye4ContextPopup
      end
    end
    object GroupBox6: TGroupBox
      Left = 5
      Top = 178
      Width = 114
      Height = 54
      Caption = 'Filter'
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      object LabelWheelCount: TLabel
        Left = 61
        Top = 13
        Width = 48
        Height = 15
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clAqua
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        OnDblClick = LabelWheelCountDblClick
      end
      object Buttonwheelcc: TButton
        Left = 5
        Top = 14
        Width = 24
        Height = 16
        Caption = 'Cc'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnMouseDown = ButtonwheelccMouseDown
        OnMouseUp = ButtonwheelccMouseUp
      end
      object Buttonwheelcw: TButton
        Left = 34
        Top = 14
        Width = 24
        Height = 16
        Caption = 'Cw'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnMouseDown = ButtonwheelcwMouseDown
        OnMouseUp = ButtonwheelccMouseUp
      end
      object Buttonaux1: TButton
        Tag = 1
        Left = 17
        Top = 35
        Width = 14
        Height = 16
        Caption = 'R'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = Buttonaux1Click
        OnContextPopup = Buttonaux1ContextPopup
      end
      object Buttonaux2: TButton
        Tag = 2
        Left = 31
        Top = 35
        Width = 14
        Height = 16
        Caption = 'G'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = Buttonaux2Click
        OnContextPopup = Buttonaux2ContextPopup
      end
      object Buttonaux3: TButton
        Tag = 3
        Left = 44
        Top = 35
        Width = 14
        Height = 16
        Caption = 'B'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = Buttonaux3Click
        OnContextPopup = Buttonaux3ContextPopup
      end
      object Buttonaux4: TButton
        Tag = 4
        Left = 58
        Top = 35
        Width = 14
        Height = 16
        Caption = '1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = Buttonaux4Click
        OnContextPopup = Buttonaux4ContextPopup
      end
      object Buttonaux5: TButton
        Tag = 5
        Left = 71
        Top = 35
        Width = 14
        Height = 16
        Caption = '2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = Buttonaux5Click
        OnContextPopup = Buttonaux5ContextPopup
      end
      object Buttonaux6: TButton
        Left = 4
        Top = 35
        Width = 14
        Height = 16
        Caption = 'L'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = Buttonaux6Click
        OnContextPopup = Buttonaux6ContextPopup
      end
      object Buttonaux8: TButton
        Tag = 7
        Left = 99
        Top = 35
        Width = 14
        Height = 16
        Caption = '4'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnClick = Buttonaux8Click
        OnContextPopup = Buttonaux8ContextPopup
      end
      object Buttonaux7: TButton
        Tag = 6
        Left = 84
        Top = 35
        Width = 14
        Height = 16
        Caption = '3'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        OnClick = Buttonaux7Click
        OnContextPopup = Buttonaux7ContextPopup
      end
    end
  end
  object PageControlConf: TPageControl
    Left = 126
    Top = 0
    Width = 394
    Height = 238
    Hint = 'Set Coords'
    ActivePage = TabSheet7
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabIndex = 6
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Controls'
      object GroupBoxPosition: TGroupBox
        Left = 0
        Top = 0
        Width = 381
        Height = 206
        Hint = 'Input RA'
        Caption = 'Position'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Panel2: TPanel
          Left = 6
          Top = 13
          Width = 207
          Height = 68
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindow
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = True
          ParentFont = False
          TabOrder = 0
          object LabelAR1: TLabel
            Left = 2
            Top = 5
            Width = 194
            Height = 25
            Hint = 'Right Ascension'
            Alignment = taRightJustify
            AutoSize = False
            Caption = '00h00m00s.10'
            Color = clBlack
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -21
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object LabelDec1: TLabel
            Left = 3
            Top = 34
            Width = 193
            Height = 25
            Hint = 'Declination'
            Alignment = taRightJustify
            AutoSize = False
            Caption = '+00'#186'00'#39'00'#39#39
            Color = clBlack
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -21
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
        end
        object GroupBox7: TGroupBox
          Left = 217
          Top = 0
          Width = 163
          Height = 82
          Caption = 'Local Coordinates'
          TabOrder = 2
          object LabelHourAngle: TLabel
            Left = 55
            Top = 14
            Width = 96
            Height = 19
            Hint = 'Local Hour Angle'
            Alignment = taRightJustify
            AutoSize = False
            Caption = '00h00m00s'
            Color = clBlack
            Font.Charset = ANSI_CHARSET
            Font.Color = clTeal
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object LabelAzimuth: TLabel
            Left = 55
            Top = 36
            Width = 94
            Height = 19
            Hint = 'Azimuth'
            Alignment = taRightJustify
            AutoSize = False
            BiDiMode = bdLeftToRight
            Caption = '000'#186'00"00'#39
            Color = clBlack
            Font.Charset = ANSI_CHARSET
            Font.Color = clMoneyGreen
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentColor = False
            ParentFont = False
          end
          object LabelAltitude: TLabel
            Left = 55
            Top = 59
            Width = 95
            Height = 19
            Hint = 'Altitude'
            Alignment = taRightJustify
            AutoSize = False
            Caption = '+00'#186'00"00'#39
            Color = clBlack
            Font.Charset = ANSI_CHARSET
            Font.Color = clMoneyGreen
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object StaticText17: TStaticText
            Left = 10
            Top = 16
            Width = 25
            Height = 18
            Hint = 'Local Hour Angle'
            Caption = 'LHA'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object StaticText18: TStaticText
            Left = 10
            Top = 60
            Width = 43
            Height = 18
            Caption = 'Altitude:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object StaticText33: TStaticText
            Left = 9
            Top = 38
            Width = 46
            Height = 18
            Caption = 'Azimuth.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
        end
        object Elbrus: TGroupBox
          Left = 218
          Top = 83
          Width = 162
          Height = 30
          Caption = 'Elbrus'
          TabOrder = 3
          object Label16: TLabel
            Left = 2
            Top = 12
            Width = 56
            Height = 14
            Caption = '00h00m00s'
          end
          object Label17: TLabel
            Left = 60
            Top = 12
            Width = 61
            Height = 14
            Caption = '+00'#186'00m00s'
          end
          object ButtonElbrus: TButton
            Left = 130
            Top = 12
            Width = 26
            Height = 15
            Hint = 'Get coords from Elbrus'
            Caption = 'Get'
            TabOrder = 0
            OnClick = ButtonElbrusClick
          end
        end
        object GroupBox4: TGroupBox
          Left = 4
          Top = 83
          Width = 213
          Height = 59
          Caption = 'Target'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object LabePierSide: TLabel
            Left = 147
            Top = 40
            Width = 23
            Height = 14
            Caption = 'East'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object MaskEditAr: TMaskEdit
            Left = 6
            Top = 12
            Width = 80
            Height = 16
            Hint = 'RA Input '
            AutoSelect = False
            AutoSize = False
            Color = clBlack
            Ctl3D = False
            EditMask = '90h00m00s;1; '
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            MaxLength = 9
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            Text = '00h00m00s'
          end
          object MaskEditDec: TMaskEdit
            Left = 6
            Top = 30
            Width = 80
            Height = 16
            Hint = 'Dec Input'
            AutoSelect = False
            AutoSize = False
            Color = clBlack
            Ctl3D = False
            EditMask = '#00'#186'00'#39'00";1; '
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            MaxLength = 10
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
            Text = '+00'#186'00'#39'00"'
          end
          object ButtonSync: TButton
            Left = 87
            Top = 30
            Width = 38
            Height = 16
            Hint = 'Sync to coords.'
            Caption = 'Sync'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = ButtonSyncClick
          end
          object Buttongoto: TButton
            Left = 88
            Top = 11
            Width = 38
            Height = 16
            Hint = 'Slew to Cords'
            Caption = 'GoTo'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = ButtongotoClick
          end
          object CheckBoxTarget: TCheckBox
            Left = 130
            Top = 39
            Width = 14
            Height = 17
            Hint = 'Get coords from external'
            Checked = True
            State = cbChecked
            TabOrder = 4
          end
          object CheckBoxtguide: TCheckBox
            Left = 130
            Top = 8
            Width = 75
            Height = 17
            Hint = 'set target as instrumental coordinates'
            Caption = 'Send target'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            OnClick = CheckBoxtguideClick
          end
          object CheckBoxlocktarget: TCheckBox
            Left = 130
            Top = 24
            Width = 77
            Height = 17
            Hint = 'Disable Lock target on guide'
            Caption = 'Enable lock'
            TabOrder = 6
          end
          object buttonMeridian: TButton
            Left = 177
            Top = 39
            Width = 34
            Height = 16
            Hint = 'Swap pier side'
            Caption = 'CM'
            TabOrder = 7
            OnClick = buttonMeridianClick
          end
        end
        object GroupBoxState: TGroupBox
          Left = 2
          Top = 142
          Width = 370
          Height = 64
          Caption = 'Status'
          TabOrder = 4
          object labelarmspeed: TLabel
            Left = 46
            Top = 11
            Width = 50
            Height = 14
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0'
            Color = clBlack
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object labeldemspeed: TLabel
            Left = 46
            Top = 29
            Width = 50
            Height = 14
            Alignment = taRightJustify
            AutoSize = False
            Color = clBlack
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object labelRAStatus: TLabel
            Left = 3
            Top = 11
            Width = 40
            Height = 14
            Caption = 'RaTrack'
          end
          object LabelDecStatus: TLabel
            Left = 2
            Top = 30
            Width = 38
            Height = 14
            Caption = 'DecRun'
          end
          object Label14: TLabel
            Left = 98
            Top = 11
            Width = 13
            Height = 14
            Caption = '"/s'
          end
          object Label33: TLabel
            Left = 99
            Top = 29
            Width = 13
            Height = 14
            Caption = '"/s'
          end
          object Labeldexpeed: TLabel
            Left = 113
            Top = 29
            Width = 50
            Height = 14
            Alignment = taRightJustify
            AutoSize = False
            Color = clBlack
            Font.Charset = ANSI_CHARSET
            Font.Color = clYellow
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Labelraxpeed: TLabel
            Left = 113
            Top = 11
            Width = 50
            Height = 14
            Alignment = taRightJustify
            AutoSize = False
            Color = clBlack
            Font.Charset = ANSI_CHARSET
            Font.Color = clYellow
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label36: TLabel
            Left = 165
            Top = 29
            Width = 7
            Height = 14
            Caption = 'X'
          end
          object Label37: TLabel
            Left = 165
            Top = 11
            Width = 7
            Height = 14
            Caption = 'X'
          end
          object Labeldelta: TLabel
            Left = 268
            Top = 11
            Width = 63
            Height = 14
            Alignment = taRightJustify
            AutoSize = False
            Color = clBlack
            Font.Charset = ANSI_CHARSET
            Font.Color = clMoneyGreen
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Labeldeltalt: TLabel
            Left = 268
            Top = 29
            Width = 62
            Height = 14
            Alignment = taRightJustify
            AutoSize = False
            Color = clBlack
            Font.Charset = ANSI_CHARSET
            Font.Color = clMoneyGreen
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label4: TLabel
            Left = 205
            Top = 12
            Width = 59
            Height = 14
            Caption = 'Delta RA/Az'
          end
          object Label64: TLabel
            Left = 206
            Top = 29
            Width = 49
            Height = 14
            Caption = 'Delta Dec.'
          end
          object CheckBoxAutoslew: TCheckBox
            Left = 4
            Top = 47
            Width = 41
            Height = 13
            Hint = 'Auto speed for goto'
            Caption = 'Auto'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 0
            OnClick = CheckBoxAutoslewClick
          end
          object CheckBoxSmartGoto: TCheckBox
            Left = 47
            Top = 47
            Width = 50
            Height = 13
            Caption = 'Smart'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
          object CheckBox2: TCheckBox
            Left = 146
            Top = 46
            Width = 49
            Height = 14
            Hint = 'Progressive Speed Change'
            Caption = 'Accel'
            Checked = True
            Ctl3D = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 2
            OnClick = CheckBox2Click
          end
          object CheckBox6: TCheckBox
            Left = 97
            Top = 47
            Width = 45
            Height = 13
            Hint = ' Dec Microstep while guiding'
            Caption = 'AGM'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = CheckBox6Click
          end
          object checkboxtrack: TCheckBox
            Left = 205
            Top = 45
            Width = 51
            Height = 16
            Caption = 'Track'
            TabOrder = 4
            OnClick = checkboxtrackClick
          end
        end
        object TrackBar3: TTrackBar
          Left = 272
          Top = 189
          Width = 97
          Height = 11
          Hint = 'Set transparency'
          Ctl3D = False
          Orientation = trHorizontal
          ParentCtl3D = False
          ParentShowHint = False
          Frequency = 1
          Position = 0
          SelEnd = 0
          SelStart = 0
          ShowHint = True
          TabOrder = 5
          ThumbLength = 10
          TickMarks = tmBottomRight
          TickStyle = tsAuto
          OnChange = TrackBar3Change
        end
        object GroupBox3: TGroupBox
          Left = 218
          Top = 112
          Width = 159
          Height = 31
          Caption = 'Focus'
          TabOrder = 6
          object CheckBoxJoyF: TCheckBox
            Left = 3
            Top = 11
            Width = 84
            Height = 15
            Hint = 'Joystick focus mode'
            Caption = 'Focus mode'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object CheckBox5: TCheckBox
            Left = 84
            Top = 11
            Width = 72
            Height = 15
            Hint = 'Joystick focus speed'
            Caption = 'Low speed'
            Checked = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            State = cbChecked
            TabOrder = 1
            OnClick = CheckBox5Click
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Log'
      ImageIndex = 2
      object GroupBoxTraffic: TGroupBox
        Left = 0
        Top = 6
        Width = 381
        Height = 183
        Caption = 'Traffic'
        TabOrder = 0
        object Label3: TLabel
          Left = 96
          Top = 163
          Width = 96
          Height = 16
          Caption = 'Disconnected'
          Color = clRed
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label10: TLabel
          Left = 10
          Top = 146
          Width = 106
          Height = 16
          Caption = 'Lx200 Status/IP'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object MemoTraffic: TMemo
          Left = 8
          Top = 16
          Width = 182
          Height = 124
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clYellow
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Lines.Strings = (
            'Waiting for commands')
          ParentFont = False
          TabOrder = 0
        end
        object CheckBoxLogTCP: TCheckBox
          Left = 6
          Top = 163
          Width = 81
          Height = 17
          Caption = 'Disable Log'
          TabOrder = 1
        end
        object memolog: TMemo
          Left = 194
          Top = 19
          Width = 177
          Height = 119
          TabOrder = 2
        end
        object Button16: TButton
          Left = 249
          Top = 147
          Width = 75
          Height = 25
          Caption = 'Button16'
          TabOrder = 3
          OnClick = Button16Click
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Mount'
      ImageIndex = 1
      object GroupBoxAxis: TGroupBox
        Left = 0
        Top = 2
        Width = 237
        Height = 110
        Hint = 'Save Settings into PIC '
        Caption = 'Telescope Axis'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object LongEditGearAr: TLongEdit
          Left = 21
          Top = 29
          Width = 32
          Height = 18
          Hint = '0..1000'
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Value = 180
          MaxValue = 1000
        end
        object LongEditGearDe: TLongEdit
          Left = 21
          Top = 50
          Width = 32
          Height = 18
          Hint = '0..10000'
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Value = 180
          MaxValue = 10000
        end
        object FloatEditRedAr: TFloatEdit
          Left = 58
          Top = 29
          Width = 48
          Height = 18
          Hint = '0..10000'
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Value = 3.92
          MaxValue = 10000
        end
        object FloatEditRedDec: TFloatEdit
          Left = 58
          Top = 50
          Width = 49
          Height = 18
          Hint = '0..10000'
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          Value = 3.92
          MaxValue = 10000
        end
        object LongEditStepAr: TLongEdit
          Left = 109
          Top = 29
          Width = 34
          Height = 18
          Hint = '0..10000'
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Value = 4000
          MaxValue = 10000
        end
        object LongEditStepDe: TLongEdit
          Left = 109
          Top = 50
          Width = 34
          Height = 18
          Hint = '0..10000'
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          Value = 4000
          MaxValue = 10000
        end
        object StaticText1: TStaticText
          Left = 24
          Top = 11
          Width = 28
          Height = 18
          Caption = 'Gear'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object StaticText2: TStaticText
          Left = 61
          Top = 11
          Width = 26
          Height = 18
          Caption = 'Red.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object StaticText3: TStaticText
          Left = 103
          Top = 11
          Width = 39
          Height = 18
          Caption = 'Msteps'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object StaticText4: TStaticText
          Left = 2
          Top = 29
          Width = 19
          Height = 18
          Caption = 'RA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object StaticText5: TStaticText
          Left = 2
          Top = 50
          Width = 17
          Height = 18
          Caption = 'DE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
        object Save: TButton
          Left = 117
          Top = 88
          Width = 41
          Height = 18
          Hint = 'Save Configuration on disk'
          Caption = 'Save'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
          OnClick = SaveClick
        end
        object ButtonSaveEEprom: TButton
          Left = 166
          Top = 88
          Width = 59
          Height = 18
          Hint = 'Save settings on EEPROM'
          Caption = 'EEPROM'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 12
          OnClick = ButtonSaveEEpromClick
        end
        object CheckRunP: TCheckBox
          Left = 2
          Top = 75
          Width = 80
          Height = 17
          Caption = 'Run on start'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
        end
        object LongEditbackshDe: TLongEdit
          Left = 150
          Top = 50
          Width = 41
          Height = 18
          Hint = '0..1000000'
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 14
          Value = 0
          MaxValue = 1000000
        end
        object LongEditbackshar: TLongEdit
          Left = 149
          Top = 29
          Width = 42
          Height = 18
          Hint = '0..1000000'
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 15
          Value = 0
          MaxValue = 1000000
        end
        object StaticText47: TStaticText
          Left = 147
          Top = 11
          Width = 82
          Height = 18
          Caption = 'Backsh  Set Act'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
        end
        object Buttonbackra: TButton
          Left = 193
          Top = 30
          Width = 17
          Height = 17
          TabOrder = 17
          OnClick = ButtonbackraClick
        end
        object Buttonbackde: TButton
          Left = 193
          Top = 51
          Width = 17
          Height = 17
          TabOrder = 18
          OnClick = ButtonbackdeClick
        end
        object CheckBsa: TCheckBox
          Left = 213
          Top = 30
          Width = 17
          Height = 17
          TabOrder = 19
          OnClick = CheckBsaClick
        end
        object CheckBsd: TCheckBox
          Left = 213
          Top = 51
          Width = 17
          Height = 17
          TabOrder = 20
          OnClick = CheckBsdClick
        end
        object CheckBoxpark: TCheckBox
          Left = 2
          Top = 90
          Width = 87
          Height = 17
          Hint = 'Save motors counters on eeprom and stop them'
          Caption = 'Save on exit'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 21
        end
      end
      object GroupBox1: TGroupBox
        Left = 239
        Top = 0
        Width = 146
        Height = 124
        Caption = 'Speed Rates RA/Dec'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object StaticText9: TStaticText
          Left = 7
          Top = 21
          Width = 29
          Height = 18
          Caption = 'Slew'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object LongEditSlew: TLongEdit
          Left = 47
          Top = 16
          Width = 35
          Height = 18
          Hint = '0..2000'
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Value = 25
          MaxValue = 2000
        end
        object StaticText13: TStaticText
          Left = 130
          Top = 17
          Width = 11
          Height = 18
          Caption = 'X'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object StaticText14: TStaticText
          Left = 130
          Top = 37
          Width = 11
          Height = 18
          Caption = 'X'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object LongEditFind: TLongEdit
          Left = 47
          Top = 36
          Width = 35
          Height = 18
          Hint = '0..1000'
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Value = 16
          MaxValue = 1000
        end
        object StaticText10: TStaticText
          Left = 7
          Top = 39
          Width = 24
          Height = 18
          Caption = 'Find'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object StaticText11: TStaticText
          Left = 7
          Top = 59
          Width = 36
          Height = 18
          Caption = 'Center'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object LongEditCenter: TLongEdit
          Left = 47
          Top = 56
          Width = 35
          Height = 18
          Hint = '0..40'
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          Value = 4
          MaxValue = 40
        end
        object StaticText15: TStaticText
          Left = 130
          Top = 58
          Width = 11
          Height = 18
          Caption = 'X'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object StaticText12: TStaticText
          Left = 7
          Top = 79
          Width = 32
          Height = 18
          Caption = 'Guide'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object StaticText16: TStaticText
          Left = 130
          Top = 77
          Width = 11
          Height = 18
          Caption = 'X'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
        object LongEditSlewDe: TLongEdit
          Left = 91
          Top = 16
          Width = 35
          Height = 18
          Hint = '0..2000'
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
          Value = 25
          MaxValue = 2000
        end
        object LongEditFindDe: TLongEdit
          Left = 91
          Top = 36
          Width = 35
          Height = 18
          Hint = '0..1000'
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 12
          Value = 16
          MaxValue = 1000
        end
        object LongEditCenterDe: TLongEdit
          Left = 91
          Top = 56
          Width = 35
          Height = 18
          Hint = '0..16'
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 13
          Value = 4
          MaxValue = 16
        end
        object FloatEditGuide: TFloatEdit
          Left = 47
          Top = 77
          Width = 35
          Height = 18
          Hint = '0..4'
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 14
          Value = 3
          MaxValue = 4
        end
        object FloatEditGuideDec: TFloatEdit
          Left = 91
          Top = 77
          Width = 35
          Height = 18
          Hint = '0..4'
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 15
          Value = 3
          MaxValue = 4
        end
        object StaticText35: TStaticText
          Left = 7
          Top = 103
          Width = 31
          Height = 18
          Caption = 'Ramp'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
        end
        object LongEditRAramp: TLongEdit
          Left = 46
          Top = 100
          Width = 35
          Height = 18
          Hint = '0..900'
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 17
          Value = 200
          MaxValue = 900
        end
        object LongEditDeRamp: TLongEdit
          Left = 91
          Top = 100
          Width = 35
          Height = 18
          Hint = '0..800'
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 18
          Value = 200
          MaxValue = 800
        end
      end
      object GroupBox12: TGroupBox
        Left = 240
        Top = 124
        Width = 144
        Height = 83
        Caption = 'AutoSpeed'
        TabOrder = 2
        object LongEdit_RA_Radius: TLongEdit
          Left = 41
          Top = 13
          Width = 35
          Height = 18
          Hint = '0..2000'
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Value = 25
          MaxValue = 2000
        end
        object LongEdit_DE_Radius: TLongEdit
          Left = 79
          Top = 13
          Width = 35
          Height = 18
          Hint = '0..1000'
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Value = 25
          MaxValue = 1000
        end
        object StaticText29: TStaticText
          Left = 4
          Top = 17
          Width = 37
          Height = 18
          Caption = 'Radius'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object LongEditNearRA: TLongEdit
          Left = 42
          Top = 36
          Width = 35
          Height = 18
          Hint = '0..2000'
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          Value = 15
          MaxValue = 2000
        end
        object LongEditNearde: TLongEdit
          Left = 80
          Top = 36
          Width = 35
          Height = 18
          Hint = '0..1000'
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Value = 15
          MaxValue = 1000
        end
        object StaticText30: TStaticText
          Left = 7
          Top = 37
          Width = 4
          Height = 4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object StaticText31: TStaticText
          Left = 120
          Top = 37
          Width = 11
          Height = 18
          Caption = 'X'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object StaticText32: TStaticText
          Left = 117
          Top = 14
          Width = 24
          Height = 17
          Caption = 'Min.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object StaticText36: TStaticText
          Left = 6
          Top = 37
          Width = 27
          Height = 18
          Caption = 'Near'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object LongEdit11: TLongEdit
          Left = 42
          Top = 58
          Width = 35
          Height = 18
          Hint = '0..1000'
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
          Visible = False
          Value = 16
          MaxValue = 1000
        end
        object LongEdit12: TLongEdit
          Left = 80
          Top = 58
          Width = 35
          Height = 18
          Hint = '0..1000'
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
          Visible = False
          Value = 16
          MaxValue = 1000
        end
      end
      object GroupBox2: TGroupBox
        Left = 1
        Top = 113
        Width = 236
        Height = 56
        Caption = 'PIC Tips'
        TabOrder = 3
        object Label9: TLabel
          Left = 171
          Top = 14
          Width = 18
          Height = 14
          Caption = '128'
          Color = clBtnFace
          ParentColor = False
        end
        object Label21: TLabel
          Left = 67
          Top = 18
          Width = 12
          Height = 14
          Caption = 'us'
        end
        object FloatEditPrescaler: TFloatEdit
          Left = 3
          Top = 14
          Width = 60
          Height = 18
          Hint = '0..5'
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Value = 0.4000067
          MaxValue = 5
        end
        object RadioPresc4: TRadioButton
          Left = 3
          Top = 36
          Width = 79
          Height = 14
          Caption = 'Presc.0,4 us'
          Checked = True
          TabOrder = 1
          TabStop = True
        end
        object RadioButton5: TRadioButton
          Left = 88
          Top = 36
          Width = 86
          Height = 14
          Caption = 'Presc. 0,8 us'
          TabOrder = 2
        end
        object Button3: TButton
          Left = 194
          Top = 12
          Width = 30
          Height = 18
          Caption = 'Ok'
          TabOrder = 3
          OnClick = Button3Click
        end
        object TrackBarLed: TTrackBar
          Left = 85
          Top = 13
          Width = 83
          Height = 21
          Hint = 'Led Brightness Control'
          Max = 128
          Orientation = trHorizontal
          ParentShowHint = False
          Frequency = 1
          Position = 128
          SelEnd = 0
          SelStart = 0
          ShowHint = True
          TabOrder = 4
          ThumbLength = 10
          TickMarks = tmBottomRight
          TickStyle = tsManual
          OnChange = TrackBarLedChange
        end
      end
      object Radiomount: TRadioGroup
        Left = 2
        Top = 169
        Width = 235
        Height = 36
        Caption = 'Mount type'
        Columns = 3
        Items.Strings = (
          'Ecuatorial'
          'Alt-az'
          'Aligned')
        TabOrder = 4
        OnClick = RadiomountClick
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Conf'
      ImageIndex = 3
      object Label25: TLabel
        Left = 10
        Top = 147
        Width = 3
        Height = 14
      end
      object Label34: TLabel
        Left = 332
        Top = 133
        Width = 38
        Height = 14
        Caption = 'Label34'
        Visible = False
      end
      object Label6: TLabel
        Left = 300
        Top = 136
        Width = 32
        Height = 14
        Caption = 'Label6'
        Visible = False
      end
      object GroupBoxSerial: TGroupBox
        Left = 1
        Top = 4
        Width = 201
        Height = 89
        Caption = 'Serial Settings'
        TabOrder = 0
        object ComboBoxPort: TComboBox
          Left = 53
          Top = 12
          Width = 70
          Height = 22
          Ctl3D = False
          ItemHeight = 14
          ParentCtl3D = False
          TabOrder = 0
          Text = 'com4'
          Items.Strings = (
            'com1'
            'com2'
            'com3'
            'com4'
            'com5'
            'com6'
            'com7'
            'com8'
            'com9'
            'com10'
            'com11'
            'com12'
            'com13'
            'com14'
            'com15'
            'com16'
            'com17'
            'com18'
            'com19'
            'com20'
            'com21'
            'com22'
            ''
            ''
            '')
        end
        object ComboBoxBps: TComboBox
          Left = 53
          Top = 34
          Width = 70
          Height = 22
          Ctl3D = False
          ItemHeight = 14
          ParentCtl3D = False
          TabOrder = 1
          Text = '19200'
          Items.Strings = (
            '9600'
            '19200'
            '38400'
            '57600')
        end
        object StaticText6: TStaticText
          Left = 7
          Top = 15
          Width = 44
          Height = 18
          Caption = 'ComPort'
          TabOrder = 2
        end
        object StaticText7: TStaticText
          Left = 7
          Top = 36
          Width = 23
          Height = 18
          Caption = 'Bps'
          TabOrder = 3
        end
        object LongEditTimeout: TLongEdit
          Left = 53
          Top = 67
          Width = 68
          Height = 18
          Hint = '0..1000'
          Ctl3D = False
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Value = 200
          MaxValue = 1000
        end
        object StaticText8: TStaticText
          Left = 6
          Top = 67
          Width = 43
          Height = 18
          Caption = 'TimeOut'
          TabOrder = 5
        end
        object LongEditpoll: TLongEdit
          Left = 155
          Top = 36
          Width = 29
          Height = 17
          Hint = '0..3000'
          Ctl3D = False
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          Value = 500
          MaxValue = 3000
        end
        object StaticText34: TStaticText
          Left = 124
          Top = 36
          Width = 30
          Height = 18
          Caption = 'Timer'
          TabOrder = 7
        end
        object buttonbaudrate: TButton
          Left = 125
          Top = 12
          Width = 70
          Height = 22
          Caption = 'Save on Pic'
          TabOrder = 8
          OnClick = buttonbaudrateClick
        end
        object Buttonch_timer: TButton
          Left = 131
          Top = 67
          Width = 47
          Height = 19
          Caption = 'Set timer'
          TabOrder = 9
          OnClick = Buttonch_timerClick
        end
      end
      object GroupBoxHost: TGroupBox
        Left = 1
        Top = 94
        Width = 184
        Height = 61
        Caption = 'Host Server'
        TabOrder = 1
        object Label7: TLabel
          Left = 8
          Top = 16
          Width = 30
          Height = 14
          Caption = 'IP/Port'
        end
        object EditAddr: TEdit
          Left = 48
          Top = 14
          Width = 78
          Height = 20
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          Text = '127.0.0.1'
        end
        object ButtonListen: TButton
          Left = 131
          Top = 36
          Width = 41
          Height = 20
          Caption = 'Listen'
          TabOrder = 1
        end
        object ButtonServerClose: TButton
          Left = 48
          Top = 36
          Width = 76
          Height = 20
          Caption = ' Close Server'
          TabOrder = 2
        end
        object LongEditPort: TLongEdit
          Left = 131
          Top = 14
          Width = 39
          Height = 20
          Hint = '0..100000'
          Ctl3D = False
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          Value = 10001
          MaxValue = 100000
        end
      end
      object GroupBox5: TGroupBox
        Left = 202
        Top = 3
        Width = 175
        Height = 126
        Caption = 'Geodata'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object Label22: TLabel
          Left = 4
          Top = 38
          Width = 50
          Height = 14
          Caption = 'Longitude:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 5
          Top = 61
          Width = 41
          Height = 14
          Caption = 'Latitude:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 6
          Top = 15
          Width = 44
          Height = 14
          Caption = 'Location:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label29: TLabel
          Left = 2
          Top = 84
          Width = 54
          Height = 14
          Caption = 'GMT offset'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object MaskEditLong: TMaskEdit
          Left = 61
          Top = 35
          Width = 99
          Height = 20
          Hint = 'Dec Input'
          Ctl3D = False
          EditMask = '#000'#186'00'#39'00";1; '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          MaxLength = 11
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          Text = '-004'#186'12'#39'17"'
        end
        object MaskEditLat: TMaskEdit
          Left = 62
          Top = 58
          Width = 97
          Height = 20
          Hint = 'Dec Input'
          Ctl3D = False
          EditMask = '#00'#186'00'#39'00";1; '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          MaxLength = 10
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          Text = '+36'#186'43'#39'13"'
        end
        object EditLocation: TEdit
          Left = 62
          Top = 12
          Width = 98
          Height = 20
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          Text = 'PDS 57'
        end
        object LongEditGMT: TLongEdit
          Left = 59
          Top = 81
          Width = 41
          Height = 18
          Hint = '-12..12'
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          Value = 0
          MinValue = -12
          MaxValue = 12
        end
        object Button_loc: TButton
          Left = 111
          Top = 81
          Width = 49
          Height = 18
          Caption = 'Ok'
          TabOrder = 4
          OnClick = Button_locClick
        end
        object CheckBoxDLST: TCheckBox
          Left = 4
          Top = 102
          Width = 97
          Height = 17
          Caption = 'DLTS'
          Enabled = False
          TabOrder = 5
        end
      end
      object Button13: TButton
        Left = 196
        Top = 139
        Width = 64
        Height = 18
        Caption = 'Button13'
        TabOrder = 3
        Visible = False
        OnClick = Button13Click
      end
      object GroupBox16: TGroupBox
        Left = 4
        Top = 154
        Width = 181
        Height = 53
        Caption = 'GroupBox16'
        TabOrder = 4
        object CheckBox3: TCheckBox
          Left = 113
          Top = 20
          Width = 57
          Height = 19
          Caption = 'Enable'
          TabOrder = 0
          OnClick = CheckBox3Click
        end
        object Buttonenableres: TButton
          Left = 4
          Top = 17
          Width = 93
          Height = 25
          Caption = 'Reset PIC Enc.'
          Enabled = False
          TabOrder = 1
          OnClick = ButtonenableresClick
        end
      end
      object GroupBoxHid: TGroupBox
        Left = 192
        Top = 128
        Width = 185
        Height = 81
        Caption = 'HID'
        TabOrder = 5
        object Label71: TLabel
          Left = 144
          Top = 24
          Width = 38
          Height = 14
          Caption = 'Label71'
        end
        object lstHidDevices: TListBox
          Left = 8
          Top = 16
          Width = 129
          Height = 57
          ItemHeight = 14
          TabOrder = 0
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'F/W'
      ImageIndex = 4
      object GroupBox13: TGroupBox
        Left = 0
        Top = -1
        Width = 378
        Height = 95
        Caption = 'Focuser settings'
        TabOrder = 0
        object Label2: TLabel
          Left = 3
          Top = 19
          Width = 53
          Height = 14
          Caption = 'Focus Max'
        end
        object Label8: TLabel
          Left = 255
          Top = 14
          Width = 50
          Height = 14
          Caption = 'Backslash'
        end
        object Label38: TLabel
          Left = 3
          Top = 38
          Width = 54
          Height = 14
          Caption = 'Fine Speed'
        end
        object Label39: TLabel
          Left = 3
          Top = 56
          Width = 54
          Height = 14
          Caption = 'Fast speed'
        end
        object Label40: TLabel
          Left = 3
          Top = 74
          Width = 43
          Height = 14
          Caption = 'StepSize'
        end
        object Label46: TLabel
          Left = 152
          Top = 19
          Width = 32
          Height = 14
          Caption = 'Mark1:'
        end
        object Label47: TLabel
          Left = 152
          Top = 37
          Width = 32
          Height = 14
          Caption = 'Mark2:'
        end
        object Label48: TLabel
          Left = 152
          Top = 73
          Width = 32
          Height = 14
          Caption = 'Mark4:'
        end
        object Label49: TLabel
          Left = 152
          Top = 55
          Width = 32
          Height = 14
          Caption = 'Mark3:'
        end
        object Label35: TLabel
          Left = 256
          Top = 35
          Width = 31
          Height = 14
          Caption = 'Reset '
        end
        object LongEditFocusmax: TLongEdit
          Left = 64
          Top = 13
          Width = 50
          Height = 18
          Hint = '0..1000000'
          Ctl3D = True
          MaxLength = 10
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Value = 0
          MaxValue = 1000000
        end
        object LongEditFocusBack: TLongEdit
          Left = 306
          Top = 11
          Width = 50
          Height = 18
          Hint = '0..10000'
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Value = 0
          MaxValue = 10000
        end
        object LongEditFocusfinespeed: TLongEdit
          Left = 64
          Top = 32
          Width = 50
          Height = 18
          Hint = '0..10000'
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Value = 0
          MaxValue = 10000
        end
        object LongEditFocusMaxSpeed: TLongEdit
          Left = 64
          Top = 51
          Width = 50
          Height = 18
          Hint = '0..10000'
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          Value = 0
          MaxValue = 10000
        end
        object FloatEditfocusres: TFloatEdit
          Left = 64
          Top = 70
          Width = 50
          Height = 18
          Hint = '0..10000'
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Decimals = 2
          MaxValue = 10000
        end
        object StaticText37: TStaticText
          Left = 118
          Top = 16
          Width = 18
          Height = 18
          Caption = 'ms'
          TabOrder = 5
        end
        object StaticText38: TStaticText
          Left = 356
          Top = 12
          Width = 18
          Height = 18
          Caption = 'ms'
          TabOrder = 6
        end
        object StaticText39: TStaticText
          Left = 118
          Top = 34
          Width = 27
          Height = 18
          Caption = 'ms/s'
          TabOrder = 7
        end
        object StaticText40: TStaticText
          Left = 118
          Top = 52
          Width = 27
          Height = 18
          Caption = 'ms/s'
          TabOrder = 8
        end
        object StaticText41: TStaticText
          Left = 116
          Top = 71
          Width = 18
          Height = 18
          Caption = 'um'
          TabOrder = 9
        end
        object LongEditeye1: TLongEdit
          Left = 199
          Top = 13
          Width = 50
          Height = 18
          Hint = '0..1000000'
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
          Value = 0
          MaxValue = 1000000
        end
        object LongEditeye2: TLongEdit
          Left = 199
          Top = 32
          Width = 50
          Height = 18
          Hint = '0..1000000'
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
          Value = 0
          MaxValue = 1000000
        end
        object LongEditeye3: TLongEdit
          Left = 199
          Top = 52
          Width = 50
          Height = 18
          Hint = '0..1000000'
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 12
          Value = 0
          MaxValue = 1000000
        end
        object LongEditeye4: TLongEdit
          Left = 199
          Top = 72
          Width = 50
          Height = 18
          Hint = '0..1000000'
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 13
          Value = 0
          MaxValue = 1000000
        end
        object ButtonFocusUpdate: TButton
          Left = 310
          Top = 73
          Width = 55
          Height = 19
          Caption = 'Update'
          TabOrder = 14
          OnClick = ButtonFocusUpdateClick
        end
        object CheckBoxbsf: TCheckBox
          Left = 256
          Top = 54
          Width = 107
          Height = 17
          Caption = 'Active correction'
          TabOrder = 15
          OnClick = CheckBoxbsfClick
        end
        object LongEditFocusReset: TLongEdit
          Left = 307
          Top = 32
          Width = 50
          Height = 18
          Hint = '0..1000000'
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 16
          Value = 0
          MaxValue = 1000000
        end
      end
      object GroupBox15: TGroupBox
        Left = -2
        Top = 95
        Width = 382
        Height = 114
        Caption = 'Rotator settings'
        TabOrder = 1
        object Label20: TLabel
          Left = 4
          Top = 17
          Width = 48
          Height = 14
          Caption = 'Top count'
        end
        object Label42: TLabel
          Left = 265
          Top = 72
          Width = 50
          Height = 14
          Caption = 'Backslash'
        end
        object Label43: TLabel
          Left = 6
          Top = 37
          Width = 54
          Height = 14
          Caption = 'Fine Speed'
        end
        object Label44: TLabel
          Left = 6
          Top = 57
          Width = 54
          Height = 14
          Caption = 'Fast speed'
        end
        object Label45: TLabel
          Left = 6
          Top = 77
          Width = 50
          Height = 14
          Caption = 'StepAngle'
        end
        object Label50: TLabel
          Left = 144
          Top = 34
          Width = 19
          Height = 14
          Caption = 'Red'
        end
        object Label51: TLabel
          Left = 144
          Top = 52
          Width = 30
          Height = 14
          Caption = 'Green'
        end
        object Label52: TLabel
          Left = 144
          Top = 71
          Width = 21
          Height = 14
          Caption = 'Blue'
        end
        object Label53: TLabel
          Left = 144
          Top = 14
          Width = 49
          Height = 14
          Caption = 'Luminanc.'
        end
        object Label54: TLabel
          Left = 145
          Top = 94
          Width = 42
          Height = 14
          Caption = 'Custom1'
        end
        object Label55: TLabel
          Left = 270
          Top = 13
          Width = 42
          Height = 14
          Caption = 'Custom2'
        end
        object Label69: TLabel
          Left = 270
          Top = 33
          Width = 42
          Height = 14
          Caption = 'Custom3'
        end
        object Label70: TLabel
          Left = 270
          Top = 53
          Width = 42
          Height = 14
          Caption = 'Custom4'
        end
        object CheckBoxbsaux: TCheckBox
          Left = 5
          Top = 94
          Width = 99
          Height = 17
          Caption = 'Active correction'
          TabOrder = 17
        end
        object LongEditTopRcounter: TLongEdit
          Left = 62
          Top = 13
          Width = 50
          Height = 18
          Hint = '0..1000000'
          MaxLength = 10
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Value = 0
          MaxValue = 1000000
        end
        object LongEditRotbackSlash: TLongEdit
          Left = 316
          Top = 71
          Width = 51
          Height = 18
          Hint = '0..10000'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Value = 0
          MaxValue = 10000
        end
        object LongEdittRotFspeed: TLongEdit
          Left = 63
          Top = 32
          Width = 50
          Height = 18
          Hint = '0..10000'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Value = 0
          MaxValue = 10000
        end
        object LongEdittRotFFspeed: TLongEdit
          Left = 63
          Top = 52
          Width = 50
          Height = 18
          Hint = '0..10000'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          Value = 0
          MaxValue = 10000
        end
        object FloatEditrotstepangle: TFloatEdit
          Left = 63
          Top = 73
          Width = 50
          Height = 17
          Hint = '0..10000'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Decimals = 2
          MaxValue = 10000
        end
        object StaticText42: TStaticText
          Left = 113
          Top = 14
          Width = 18
          Height = 18
          Caption = 'ms'
          TabOrder = 5
        end
        object StaticText43: TStaticText
          Left = 366
          Top = 71
          Width = 18
          Height = 18
          Caption = 'ms'
          TabOrder = 6
        end
        object StaticText44: TStaticText
          Left = 114
          Top = 34
          Width = 27
          Height = 18
          Caption = 'ms/s'
          TabOrder = 7
        end
        object StaticText45: TStaticText
          Left = 114
          Top = 54
          Width = 27
          Height = 18
          Caption = 'ms/s'
          TabOrder = 8
        end
        object StaticText46: TStaticText
          Left = 114
          Top = 74
          Width = 18
          Height = 18
          Caption = 'um'
          TabOrder = 9
        end
        object LongEditAux1: TLongEdit
          Left = 200
          Top = 10
          Width = 50
          Height = 18
          Hint = '0..1000000'
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
          Value = 0
          MaxValue = 1000000
        end
        object LongEditAux2: TLongEdit
          Left = 200
          Top = 31
          Width = 50
          Height = 18
          Hint = '0..1000000'
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
          Value = 0
          MaxValue = 1000000
        end
        object LongEditAux3: TLongEdit
          Left = 200
          Top = 51
          Width = 50
          Height = 18
          Hint = '0..1000000'
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 12
          Value = 0
          MaxValue = 1000000
        end
        object LongEditAux4: TLongEdit
          Left = 200
          Top = 71
          Width = 50
          Height = 18
          Hint = '0..1000000'
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 13
          Value = 0
          MaxValue = 1000000
        end
        object LongEditaux5: TLongEdit
          Left = 200
          Top = 91
          Width = 50
          Height = 18
          Hint = '0..1000000'
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 14
          Value = 0
          MaxValue = 1000000
        end
        object LongEditaux6: TLongEdit
          Left = 316
          Top = 11
          Width = 50
          Height = 18
          Hint = '0..1000000'
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 15
          Value = 0
          MaxValue = 1000000
        end
        object Button8: TButton
          Left = 317
          Top = 92
          Width = 49
          Height = 19
          Caption = 'Update'
          TabOrder = 16
          OnClick = Button8Click
        end
        object LongEditaux7: TLongEdit
          Left = 316
          Top = 31
          Width = 50
          Height = 18
          Hint = '0..1000000'
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 18
          Value = 0
          MaxValue = 1000000
        end
        object LongEditaux8: TLongEdit
          Left = 316
          Top = 51
          Width = 50
          Height = 18
          Hint = '0..1000000'
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 19
          Value = 0
          MaxValue = 1000000
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Motors'
      ImageIndex = 5
      object GroupBoxRaMotors: TGroupBox
        Left = 1
        Top = 7
        Width = 377
        Height = 201
        Caption = ' Microsteps  Table Configuration'
        Enabled = False
        TabOrder = 0
        object Label5: TLabel
          Left = 39
          Top = 56
          Width = 27
          Height = 14
          Caption = 'unset'
        end
        object LongEdit1: TLongEdit
          Left = 17
          Top = 32
          Width = 30
          Height = 18
          Hint = '0..255'
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Value = 0
          MaxValue = 255
        end
        object LongEdit2: TLongEdit
          Left = 51
          Top = 32
          Width = 30
          Height = 18
          Hint = '0..235'
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Value = 38
          MaxValue = 235
        end
        object LongEdit3: TLongEdit
          Left = 86
          Top = 32
          Width = 30
          Height = 18
          Hint = '0..235'
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Value = 76
          MaxValue = 235
        end
        object LongEdit4: TLongEdit
          Left = 121
          Top = 32
          Width = 30
          Height = 18
          Hint = '0..235'
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          Value = 102
          MaxValue = 235
        end
        object LongEdit5: TLongEdit
          Left = 156
          Top = 32
          Width = 30
          Height = 18
          Hint = '0..235'
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Value = 127
          MaxValue = 235
        end
        object LongEdit6: TLongEdit
          Left = 190
          Top = 32
          Width = 30
          Height = 18
          Hint = '0..249'
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          Value = 153
          MaxValue = 249
        end
        object LongEdit7: TLongEdit
          Left = 225
          Top = 32
          Width = 30
          Height = 18
          Hint = '0..249'
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          Value = 178
          MaxValue = 249
        end
        object LongEdit8: TLongEdit
          Left = 261
          Top = 32
          Width = 30
          Height = 18
          Hint = '0..249'
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          Value = 191
          MaxValue = 249
        end
        object LongEdit9: TLongEdit
          Left = 296
          Top = 32
          Width = 30
          Height = 18
          Hint = '0..255'
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          Value = 220
          MaxValue = 255
        end
        object LongEdit10: TLongEdit
          Left = 330
          Top = 32
          Width = 30
          Height = 18
          Hint = '0..255'
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
          Value = 235
          MaxValue = 255
        end
        object StaticText19: TStaticText
          Left = 28
          Top = 12
          Width = 10
          Height = 18
          Caption = '1'
          TabOrder = 10
        end
        object StaticText20: TStaticText
          Left = 62
          Top = 12
          Width = 10
          Height = 18
          Caption = '2'
          TabOrder = 11
        end
        object StaticText21: TStaticText
          Left = 97
          Top = 12
          Width = 10
          Height = 18
          Caption = '3'
          TabOrder = 12
        end
        object StaticText22: TStaticText
          Left = 132
          Top = 12
          Width = 10
          Height = 18
          Caption = '4'
          TabOrder = 13
        end
        object StaticText23: TStaticText
          Left = 167
          Top = 12
          Width = 10
          Height = 18
          Caption = '5'
          TabOrder = 14
        end
        object StaticText24: TStaticText
          Left = 201
          Top = 12
          Width = 10
          Height = 18
          Caption = '6'
          TabOrder = 15
        end
        object StaticText25: TStaticText
          Left = 236
          Top = 12
          Width = 10
          Height = 18
          Caption = '7'
          TabOrder = 16
        end
        object StaticText26: TStaticText
          Left = 271
          Top = 12
          Width = 10
          Height = 18
          Caption = '8'
          TabOrder = 17
        end
        object StaticText27: TStaticText
          Left = 306
          Top = 12
          Width = 10
          Height = 18
          Caption = '9'
          TabOrder = 18
        end
        object StaticText28: TStaticText
          Left = 341
          Top = 12
          Width = 16
          Height = 18
          Caption = '10'
          TabOrder = 19
        end
        object ButtonPWM: TButton
          Left = 223
          Top = 54
          Width = 138
          Height = 18
          Caption = 'Change RA PWM values'
          Enabled = False
          TabOrder = 20
          OnClick = ButtonPWMClick
        end
        object CheckBoxNMsteps: TCheckBox
          Left = 6
          Top = 187
          Width = 87
          Height = 17
          Caption = '10 microsteps'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 21
          Visible = False
        end
        object LongEdit1d: TLongEdit
          Left = 17
          Top = 113
          Width = 30
          Height = 18
          Hint = '0..255'
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 22
          Value = 0
          MaxValue = 255
        end
        object LongEdit2d: TLongEdit
          Left = 51
          Top = 113
          Width = 30
          Height = 18
          Hint = '0..235'
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 23
          Value = 38
          MaxValue = 235
        end
        object LongEdit3d: TLongEdit
          Left = 85
          Top = 113
          Width = 30
          Height = 18
          Hint = '0..235'
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 24
          Value = 76
          MaxValue = 235
        end
        object LongEdit4d: TLongEdit
          Left = 120
          Top = 113
          Width = 30
          Height = 18
          Hint = '0..235'
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 25
          Value = 102
          MaxValue = 235
        end
        object LongEdit5d: TLongEdit
          Left = 156
          Top = 113
          Width = 30
          Height = 18
          Hint = '0..249'
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 26
          Value = 127
          MaxValue = 249
        end
        object LongEdit6d: TLongEdit
          Left = 189
          Top = 113
          Width = 30
          Height = 18
          Hint = '0..251'
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 27
          Value = 153
          MaxValue = 251
        end
        object LongEdit7d: TLongEdit
          Left = 224
          Top = 113
          Width = 30
          Height = 18
          Hint = '0..253'
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 28
          Value = 178
          MaxValue = 253
        end
        object LongEdit8d: TLongEdit
          Left = 260
          Top = 113
          Width = 30
          Height = 18
          Hint = '0..253'
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 29
          Value = 191
          MaxValue = 253
        end
        object LongEdit9d: TLongEdit
          Left = 295
          Top = 113
          Width = 30
          Height = 18
          Hint = '0..253'
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 30
          Value = 220
          MaxValue = 253
        end
        object LongEdit10d: TLongEdit
          Left = 329
          Top = 113
          Width = 30
          Height = 18
          Hint = '0..253'
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 31
          Value = 235
          MaxValue = 253
        end
        object ButtonchangePWM2: TButton
          Left = 227
          Top = 142
          Width = 134
          Height = 18
          Caption = 'Change DE PWM Values'
          Enabled = False
          TabOrder = 32
          OnClick = ButtonchangePWM2Click
        end
        object Button10: TButton
          Left = 136
          Top = 54
          Width = 85
          Height = 18
          Caption = 'Restore default'
          Enabled = False
          TabOrder = 33
          OnClick = Button10Click
        end
        object Button11: TButton
          Left = 135
          Top = 142
          Width = 85
          Height = 18
          Caption = 'Restore default'
          Enabled = False
          TabOrder = 34
          OnClick = Button11Click
        end
        object Tracktune: TTrackBar
          Left = 5
          Top = 75
          Width = 358
          Height = 26
          Max = 254
          Min = 20
          Orientation = trHorizontal
          Frequency = 1
          Position = 25
          SelEnd = 0
          SelStart = 0
          TabOrder = 35
          TickMarks = tmBottomRight
          TickStyle = tsAuto
          OnChange = TracktuneChange
        end
        object Buttonblock: TButton
          Left = 81
          Top = 54
          Width = 52
          Height = 18
          Caption = 'Block RA'
          TabOrder = 36
          OnClick = ButtonblockClick
        end
        object Button12: TButton
          Left = 80
          Top = 142
          Width = 53
          Height = 18
          Caption = 'Block DE'
          TabOrder = 37
          OnClick = Button12Click
        end
        object Tracktunedec: TTrackBar
          Left = 5
          Top = 160
          Width = 358
          Height = 26
          Max = 255
          Min = 20
          Orientation = trHorizontal
          Frequency = 1
          Position = 25
          SelEnd = 0
          SelStart = 0
          TabOrder = 38
          TickMarks = tmBottomRight
          TickStyle = tsAuto
          OnChange = TracktunedecChange
        end
      end
      object CheckBoxNMenable: TCheckBox
        Left = 6
        Top = 148
        Width = 58
        Height = 17
        Caption = 'Enable '
        TabOrder = 1
        OnClick = CheckBoxNMenableClick
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Spy '
      ImageIndex = 6
      object GroupBox8: TGroupBox
        Left = 6
        Top = 4
        Width = 162
        Height = 94
        Caption = 'msteps/s'
        TabOrder = 0
        object Label18: TLabel
          Left = 68
          Top = 15
          Width = 83
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label19: TLabel
          Left = 4
          Top = 15
          Width = 54
          Height = 14
          Caption = 'RA . speed'
        end
        object Label12: TLabel
          Left = 4
          Top = 70
          Width = 59
          Height = 14
          Caption = 'DE Encoder:'
        end
        object Label13: TLabel
          Left = 4
          Top = 51
          Width = 61
          Height = 14
          Caption = 'RA Encoder:'
        end
        object LabelEncDec: TLabel
          Left = 67
          Top = 69
          Width = 84
          Height = 16
          Hint = 'Virtual Encoder Value'
          Alignment = taRightJustify
          AutoSize = False
          Caption = '00000000'
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clLime
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Laberarpos: TLabel
          Left = 68
          Top = 51
          Width = 83
          Height = 16
          Hint = 'Virtual Encoder Value'
          Alignment = taRightJustify
          AutoSize = False
          Caption = '00000000'
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clLime
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label31: TLabel
          Left = 4
          Top = 33
          Width = 49
          Height = 14
          Caption = 'DE. speed'
        end
        object Label30: TLabel
          Left = 68
          Top = 33
          Width = 83
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
      end
      object GroupBox10: TGroupBox
        Left = 0
        Top = 102
        Width = 378
        Height = 108
        Caption = 'Stepper Settings'
        TabOrder = 1
        object Label11: TLabel
          Left = 45
          Top = 64
          Width = 26
          Height = 14
          Alignment = taRightJustify
          Caption = '0X/0"'
        end
        object Label56: TLabel
          Left = 234
          Top = 15
          Width = 31
          Height = 14
          Caption = 'RA "/s'
        end
        object Label57: TLabel
          Left = 235
          Top = 38
          Width = 29
          Height = 14
          Caption = 'De "/s'
        end
        object Label41: TLabel
          Left = 91
          Top = 15
          Width = 7
          Height = 14
          Caption = 'X'
        end
        object Label60: TLabel
          Left = 91
          Top = 36
          Width = 7
          Height = 14
          Caption = 'X'
        end
        object Label61: TLabel
          Left = 1
          Top = 16
          Width = 15
          Height = 14
          Caption = 'RA'
        end
        object Label62: TLabel
          Left = 2
          Top = 37
          Width = 13
          Height = 14
          Caption = 'DE'
        end
        object Label63: TLabel
          Left = 45
          Top = 87
          Width = 25
          Height = 14
          Alignment = taRightJustify
          Caption = '0x/0"'
        end
        object Button6: TButton
          Left = 335
          Top = 15
          Width = 35
          Height = 18
          Caption = 'Set'
          TabOrder = 0
          OnClick = Button6Click
        end
        object FloatEdit1: TFloatEdit
          Left = 270
          Top = 15
          Width = 59
          Height = 18
          TabOrder = 1
          Value = 15.01
        end
        object TrackBar1: TTrackBar
          Left = 75
          Top = 61
          Width = 301
          Height = 19
          Max = 720
          Orientation = trHorizontal
          Frequency = 1
          Position = 360
          SelEnd = 0
          SelStart = 0
          TabOrder = 2
          TickMarks = tmBottomRight
          TickStyle = tsAuto
          OnChange = TrackBar1Change
        end
        object FloatEdit2: TFloatEdit
          Left = 270
          Top = 38
          Width = 59
          Height = 18
          TabOrder = 3
          Value = 15.01
        end
        object Button9: TButton
          Left = 336
          Top = 38
          Width = 35
          Height = 18
          Caption = 'Set'
          TabOrder = 4
          OnClick = Button9Click
        end
        object TrackBar2: TTrackBar
          Left = 75
          Top = 84
          Width = 301
          Height = 19
          Max = 720
          Orientation = trHorizontal
          Frequency = 1
          Position = 360
          SelEnd = 0
          SelStart = 0
          TabOrder = 5
          TickMarks = tmBottomRight
          TickStyle = tsAuto
          OnChange = TrackBar2Change
        end
        object LongEditforb_min: TLongEdit
          Left = 19
          Top = 13
          Width = 31
          Height = 18
          Hint = '0..1500'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          Value = 45
          MaxValue = 1500
        end
        object LongEditForb_max: TLongEdit
          Left = 51
          Top = 13
          Width = 34
          Height = 18
          Hint = '0..1500'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          Value = 120
          MaxValue = 1500
        end
        object Button18: TButton
          Left = 109
          Top = 13
          Width = 50
          Height = 18
          Caption = 'Set Zone'
          TabOrder = 8
          OnClick = Button18Click
        end
        object LongEditforb_min_dec: TLongEdit
          Left = 19
          Top = 35
          Width = 31
          Height = 18
          Hint = '0..1500'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
          Value = 45
          MaxValue = 1500
        end
        object LongEditForb_max_dec: TLongEdit
          Left = 51
          Top = 35
          Width = 34
          Height = 18
          Hint = '0..1500'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
          Value = 120
          MaxValue = 1500
        end
        object CheckBoxZone: TCheckBox
          Left = 107
          Top = 35
          Width = 84
          Height = 15
          Caption = 'Enable Zone'
          TabOrder = 11
          OnClick = CheckBoxZoneClick
        end
      end
      object GroupBox14: TGroupBox
        Left = 173
        Top = -1
        Width = 214
        Height = 104
        Caption = 'GraveGroup'
        TabOrder = 2
        object Labelfocus: TLabel
          Left = 8
          Top = 62
          Width = 55
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label59: TLabel
          Left = 61
          Top = 47
          Width = 27
          Height = 14
          Caption = 'unset'
        end
        object Label58: TLabel
          Left = 8
          Top = 47
          Width = 27
          Height = 14
          Caption = 'unset'
        end
        object Label32: TLabel
          Left = 121
          Top = 19
          Width = 38
          Height = 14
          Caption = 'Label32'
        end
        object CheckBox1: TCheckBox
          Left = 10
          Top = 32
          Width = 46
          Height = 16
          Hint = 'Set East Meridian Invert Dec Directio'
          Caption = 'Invert Dec'
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = CheckBox1Click
        end
        object ButtonConnect: TButton
          Left = 93
          Top = 35
          Width = 63
          Height = 17
          Hint = 'Disconnect serial port'
          Caption = 'Disconnect'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindow
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = ButtonConnectClick
        end
        object Button2: TButton
          Left = 89
          Top = 54
          Width = 71
          Height = 21
          Caption = 'About'
          TabOrder = 2
          OnClick = Button2Click
        end
        object Buttonf: TButton
          Left = 62
          Top = 16
          Width = 26
          Height = 16
          Hint = 'Slow Forward'
          Caption = 'F+'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          OnMouseDown = ButtonfMouseDown
          OnMouseUp = ButtonfMouseUp
        end
        object Buttonfast: TButton
          Left = 90
          Top = 16
          Width = 26
          Height = 16
          Hint = 'Fast Forward'
          Caption = 'FF+'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 4
          OnMouseDown = ButtonfastMouseDown
          OnMouseUp = ButtonfastMouseUp
        end
        object Buttonmm: TButton
          Left = 35
          Top = 16
          Width = 26
          Height = 16
          Hint = 'Fast Back'
          Caption = 'FF-'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 5
          OnMouseDown = ButtonmmMouseDown
          OnMouseUp = ButtonmmMouseUp
        end
        object Buttonfm: TButton
          Left = 8
          Top = 16
          Width = 26
          Height = 16
          Hint = 'Slow Back'
          Caption = 'F-'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 6
          OnMouseDown = ButtonfmMouseDown
          OnMouseUp = ButtonfmMouseUp
        end
        object Edit1: TEdit
          Left = 9
          Top = 77
          Width = 80
          Height = 22
          TabOrder = 7
          Text = '#:RS##:Mn#'
        end
        object Button7: TButton
          Left = 90
          Top = 79
          Width = 56
          Height = 19
          Caption = 'Button7'
          TabOrder = 8
        end
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'PEC'
      ImageIndex = 7
      OnHide = TabSheet8Hide
      OnShow = TabSheet8Show
      object GroupBox9: TGroupBox
        Left = 0
        Top = 0
        Width = 386
        Height = 209
        Align = alClient
        Caption = 'Pec Curve'
        Color = clBtnFace
        ParentColor = False
        TabOrder = 0
        object Chart1: TChart
          Left = -1
          Top = -2
          Width = 375
          Height = 191
          AllowPanning = pmNone
          AnimatedZoomSteps = 7
          BackWall.Brush.Color = clWhite
          BackWall.Color = clBtnText
          Gradient.Direction = gdFromTopLeft
          Gradient.EndColor = 4194432
          Gradient.StartColor = 4227327
          MarginBottom = 1
          MarginLeft = 0
          MarginRight = 0
          MarginTop = 3
          Title.Alignment = taLeftJustify
          Title.Text.Strings = (
            'TChart')
          Title.Visible = False
          BackColor = clBtnText
          Legend.Visible = False
          View3D = False
          View3DOptions.Perspective = 7
          View3DWalls = False
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object Label15: TLabel
            Left = 0
            Top = 0
            Width = 6
            Height = 14
            Caption = '0'
          end
          object Series1: TLineSeries
            Marks.ArrowLength = 8
            Marks.Style = smsValue
            Marks.Visible = False
            SeriesColor = clBlue
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1
            YValues.Order = loNone
            object TeeFunction1: TLowTeeFunction
            end
          end
          object Series2: TLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            SeriesColor = clRed
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1
            YValues.Order = loNone
            object TeeFunction2: TLowTeeFunction
            end
          end
          object Series3: TLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            SeriesColor = clGreen
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1
            YValues.Order = loNone
          end
        end
      end
    end
    object align: TTabSheet
      Caption = 'Align'
      ImageIndex = 8
      object GroupBox17: TGroupBox
        Left = 6
        Top = 4
        Width = 370
        Height = 198
        Caption = 'Align'
        TabOrder = 0
        object GroupBox18: TGroupBox
          Left = 19
          Top = 14
          Width = 185
          Height = 174
          Caption = 'Align'
          TabOrder = 0
          object Label28: TLabel
            Left = 12
            Top = 133
            Width = 90
            Height = 14
            Caption = '00;00:00 00'#186'00"00'
          end
          object Radiostar1: TRadioButton
            Tag = 1
            Left = 12
            Top = 36
            Width = 50
            Height = 17
            Caption = 'Star1'
            TabOrder = 0
            OnClick = RadionoalignClick
          end
          object RadioButton3: TRadioButton
            Tag = 2
            Left = 12
            Top = 57
            Width = 50
            Height = 17
            Caption = 'Star2'
            TabOrder = 1
            OnClick = RadionoalignClick
          end
          object Radiostar3: TRadioButton
            Tag = 3
            Left = 12
            Top = 78
            Width = 50
            Height = 17
            Caption = 'Star3'
            TabOrder = 2
            OnClick = RadionoalignClick
          end
          object Radionoalign: TRadioButton
            Left = 12
            Top = 15
            Width = 113
            Height = 17
            Caption = 'No align mode'
            Checked = True
            TabOrder = 3
            TabStop = True
            OnClick = RadionoalignClick
          end
          object Buttongetzenith: TButton
            Left = 74
            Top = 101
            Width = 69
            Height = 20
            Caption = 'Virtual pole'
            TabOrder = 4
            OnClick = ButtongetzenithClick
          end
          object Button_align: TButton
            Left = 9
            Top = 101
            Width = 60
            Height = 20
            Caption = 'Align now!'
            TabOrder = 5
            OnClick = Button_alignClick
          end
        end
        object GroupBox19: TGroupBox
          Left = 207
          Top = 15
          Width = 152
          Height = 171
          Caption = 'Init'
          TabOrder = 1
          object Label27: TLabel
            Left = 12
            Top = 127
            Width = 33
            Height = 14
            Caption = 'Coorrs'
          end
          object Label26: TLabel
            Left = 10
            Top = 149
            Width = 7
            Height = 14
            Caption = 'Z'
          end
          object Button15: TButton
            Left = 8
            Top = 14
            Width = 80
            Height = 23
            Caption = 'From Geodata'
            TabOrder = 0
            OnClick = Button15Click
          end
          object FloatEditz1: TFloatEdit
            Left = 20
            Top = 148
            Width = 40
            Height = 17
            Hint = '0..10000'
            Ctl3D = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            MaxValue = 10000
          end
          object FloatEditz2: TFloatEdit
            Left = 63
            Top = 148
            Width = 40
            Height = 17
            Hint = '0..10000'
            Ctl3D = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            MaxValue = 10000
          end
          object FloatEditz3: TFloatEdit
            Left = 107
            Top = 148
            Width = 40
            Height = 17
            Hint = '0..10000'
            Ctl3D = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            MaxValue = 10000
          end
          object Button14: TButton
            Left = 8
            Top = 44
            Width = 69
            Height = 20
            Caption = 'Set Init'
            TabOrder = 4
            OnClick = ButtongetzenithClick
          end
        end
      end
    end
  end
  object GroupBoxcoords: TGroupBox
    Left = 0
    Top = 234
    Width = 124
    Height = 58
    Caption = 'Coords'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = False
    object labelAR: TLabel
      Left = 5
      Top = 15
      Width = 113
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = '00h00m00s.10'
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Labeldec: TLabel
      Left = 5
      Top = 35
      Width = 114
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = '+00'#186'00'#39'00'#39#39
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
  end
  object Buttonclose: TButton
    Left = 108
    Top = 3
    Width = 16
    Height = 14
    Hint = 'Exit'
    BiDiMode = bdRightToLeft
    Caption = ' x'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnContextPopup = ButtoncloseContextPopup
  end
  object Button17: TButton
    Left = 91
    Top = 3
    Width = 16
    Height = 14
    Hint = 'Minimize'
    BiDiMode = bdRightToLeft
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = Button17Click
  end
  object Buttonfold: TButton
    Left = 76
    Top = 3
    Width = 16
    Height = 14
    Hint = 'Fold'
    BiDiMode = bdRightToLeft
    Caption = '/'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = ButtonfoldClick
  end
  object Panel3: TPanel
    Left = 126
    Top = 239
    Width = 392
    Height = 55
    TabOrder = 6
    Visible = False
    object Label65: TLabel
      Left = 51
      Top = 4
      Width = 24
      Height = 14
      Caption = '0 0 0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label66: TLabel
      Left = 201
      Top = 5
      Width = 12
      Height = 14
      Caption = '00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label68: TLabel
      Left = 172
      Top = 36
      Width = 7
      Height = 15
      Caption = '0'
    end
    object Button20: TButton
      Left = 328
      Top = 25
      Width = 50
      Height = 15
      Caption = 'Show'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button20Click
    end
    object Button19: TButton
      Left = 328
      Top = 7
      Width = 50
      Height = 15
      Caption = 'Reset'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button19Click
    end
    object CheckBoxPec: TCheckBox
      Left = 259
      Top = 35
      Width = 51
      Height = 17
      Caption = 'PEC'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object DdeClientConv1: TDdeClientConv
    Left = 131
    Top = 241
  end
  object DdeClientItem1: TDdeClientItem
    Left = 133
    Top = 247
  end
  object LX200Server: TServerSocket
    Active = False
    Port = 10000
    ServerType = stNonBlocking
    OnClientConnect = LX200ServerAccept
    OnClientDisconnect = LX200ServerClientDisconnect
    OnClientRead = LX200ServerClientRead
    Left = 139
    Top = 241
  end
  object Joystickex1: TJoystickex
    GamePort = Gameport1
    Polling = False
    Interval = 50
    EventThreshold = 0.1
    Scaled = True
    XScaledBy = 1
    YScaledBy = 1
    ZScaledBy = 100
    CalAutoSave = True
    CalAutoLoad = True
    OnButton1_Change = Joystickex1Button1_Change
    OnButton2_Change = Joystickex1Button2_Change
    OnButton3_Change = Joystickex1Button3_Change
    OnButton4_Change = Joystickex1Button4_Change
    OnButton5_Change = Joystickex1Button5_Change
    JoyMove = Joystickex1JoyMove
    Left = 128
    Top = 240
  end
  object adpInstanceControl1: TadpInstanceControl
    Enabled = True
    MaxInstances = 1
    Left = 138
    Top = 240
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 160
    Top = 243
  end
  object JvHidDeviceController: TJvHidDeviceController
    OnEnumerate = JvHidDeviceControllerEnumerate
    OnDeviceChange = JvHidDeviceControllerDeviceChange
    Left = 168
    Top = 256
  end
end
