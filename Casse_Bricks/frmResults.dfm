object frmRes: TfrmRes
  Left = 277
  Top = 110
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Top des Scores'
  ClientHeight = 553
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 492
    Height = 553
    Cursor = crHandPoint
    ActivePage = TabSheet2
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    RaggedRight = True
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Normal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      object Label1: TLabel
        Left = 100
        Top = 24
        Width = 37
        Height = 20
        Caption = 'Nom'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 230
        Top = 24
        Width = 99
        Height = 20
        Caption = 'Briques/Res'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 380
        Top = 24
        Width = 54
        Height = 20
        Caption = 'Temps'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 15
        Top = 80
        Width = 13
        Height = 16
        Caption = '1.'
      end
      object Label5: TLabel
        Left = 15
        Top = 112
        Width = 13
        Height = 16
        Caption = '2.'
      end
      object Label6: TLabel
        Left = 15
        Top = 144
        Width = 13
        Height = 16
        Caption = '3.'
      end
      object Label7: TLabel
        Left = 15
        Top = 176
        Width = 13
        Height = 16
        Caption = '4.'
      end
      object Label8: TLabel
        Left = 15
        Top = 208
        Width = 13
        Height = 16
        Caption = '5.'
      end
      object Label9: TLabel
        Left = 15
        Top = 240
        Width = 13
        Height = 16
        Caption = '6.'
      end
      object Label10: TLabel
        Left = 15
        Top = 272
        Width = 13
        Height = 16
        Caption = '7.'
      end
      object Label11: TLabel
        Left = 15
        Top = 304
        Width = 13
        Height = 16
        Caption = '8.'
      end
      object Label12: TLabel
        Left = 15
        Top = 336
        Width = 13
        Height = 16
        Caption = '9.'
      end
      object Label13: TLabel
        Left = 9
        Top = 368
        Width = 21
        Height = 16
        Caption = '10.'
      end
      object Label14: TLabel
        Left = 5
        Top = 24
        Width = 36
        Height = 20
        Caption = 'Pos.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 46
        Top = 80
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label16: TLabel
        Left = 46
        Top = 112
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label17: TLabel
        Left = 46
        Top = 144
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label18: TLabel
        Left = 46
        Top = 176
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label19: TLabel
        Left = 46
        Top = 208
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label20: TLabel
        Left = 46
        Top = 240
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label21: TLabel
        Left = 46
        Top = 272
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label22: TLabel
        Left = 46
        Top = 304
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label23: TLabel
        Left = 46
        Top = 336
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label24: TLabel
        Left = 46
        Top = 368
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label25: TLabel
        Left = 263
        Top = 80
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label26: TLabel
        Left = 263
        Top = 112
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label27: TLabel
        Left = 263
        Top = 144
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label28: TLabel
        Left = 263
        Top = 176
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label29: TLabel
        Left = 263
        Top = 208
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label30: TLabel
        Left = 263
        Top = 240
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label31: TLabel
        Left = 263
        Top = 272
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label32: TLabel
        Left = 263
        Top = 304
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label33: TLabel
        Left = 263
        Top = 336
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label34: TLabel
        Left = 263
        Top = 368
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label35: TLabel
        Left = 336
        Top = 80
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object Label36: TLabel
        Left = 336
        Top = 112
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object Label37: TLabel
        Left = 336
        Top = 144
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object Label38: TLabel
        Left = 336
        Top = 176
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object Label39: TLabel
        Left = 336
        Top = 208
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object Label40: TLabel
        Left = 336
        Top = 240
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object Label41: TLabel
        Left = 336
        Top = 272
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object Label42: TLabel
        Left = 336
        Top = 304
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object Label43: TLabel
        Left = 336
        Top = 336
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object Label44: TLabel
        Left = 336
        Top = 368
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object SpeedButton1: TSpeedButton
        Left = 188
        Top = 480
        Width = 93
        Height = 41
        Cursor = crHandPoint
        Caption = 'Ok'
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 24
        Top = 419
        Width = 210
        Height = 46
        Cursor = crHandPoint
        Caption = 'R'#233'initialiser Normal'
        OnClick = SpeedButton2Click
      end
      object SpeedButton3: TSpeedButton
        Left = 250
        Top = 419
        Width = 210
        Height = 46
        Cursor = crHandPoint
        Caption = 'R'#233'initialiser Tous'
        OnClick = SpeedButton3Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Difficile'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ImageIndex = 1
      ParentFont = False
      object Label45: TLabel
        Left = 5
        Top = 24
        Width = 36
        Height = 20
        Caption = 'Pos.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label49: TLabel
        Left = 15
        Top = 80
        Width = 13
        Height = 16
        Caption = '1.'
      end
      object Label50: TLabel
        Left = 15
        Top = 112
        Width = 13
        Height = 16
        Caption = '2.'
      end
      object Label51: TLabel
        Left = 15
        Top = 144
        Width = 13
        Height = 16
        Caption = '3.'
      end
      object Label52: TLabel
        Left = 15
        Top = 176
        Width = 13
        Height = 16
        Caption = '4.'
      end
      object Label53: TLabel
        Left = 15
        Top = 208
        Width = 13
        Height = 16
        Caption = '5.'
      end
      object Label54: TLabel
        Left = 15
        Top = 240
        Width = 13
        Height = 16
        Caption = '6.'
      end
      object Label55: TLabel
        Left = 15
        Top = 272
        Width = 13
        Height = 16
        Caption = '7.'
      end
      object Label56: TLabel
        Left = 15
        Top = 304
        Width = 13
        Height = 16
        Caption = '8.'
      end
      object Label57: TLabel
        Left = 15
        Top = 336
        Width = 13
        Height = 16
        Caption = '9.'
      end
      object Label58: TLabel
        Left = 9
        Top = 368
        Width = 21
        Height = 16
        Caption = '10.'
      end
      object Label59: TLabel
        Left = 46
        Top = 368
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label60: TLabel
        Left = 46
        Top = 336
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label61: TLabel
        Left = 46
        Top = 304
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label62: TLabel
        Left = 46
        Top = 272
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label63: TLabel
        Left = 46
        Top = 240
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label64: TLabel
        Left = 46
        Top = 208
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label65: TLabel
        Left = 46
        Top = 176
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label66: TLabel
        Left = 46
        Top = 144
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label67: TLabel
        Left = 46
        Top = 112
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label68: TLabel
        Left = 46
        Top = 80
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label69: TLabel
        Left = 263
        Top = 80
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label70: TLabel
        Left = 263
        Top = 112
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label71: TLabel
        Left = 263
        Top = 144
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label72: TLabel
        Left = 263
        Top = 176
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label73: TLabel
        Left = 263
        Top = 208
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label74: TLabel
        Left = 263
        Top = 240
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label75: TLabel
        Left = 263
        Top = 272
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label76: TLabel
        Left = 263
        Top = 304
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label77: TLabel
        Left = 263
        Top = 336
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label78: TLabel
        Left = 263
        Top = 368
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label79: TLabel
        Left = 336
        Top = 368
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object Label80: TLabel
        Left = 336
        Top = 336
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object Label81: TLabel
        Left = 336
        Top = 304
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object Label82: TLabel
        Left = 336
        Top = 272
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object Label83: TLabel
        Left = 336
        Top = 240
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object Label84: TLabel
        Left = 336
        Top = 208
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object Label85: TLabel
        Left = 336
        Top = 176
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object Label86: TLabel
        Left = 336
        Top = 144
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object Label87: TLabel
        Left = 336
        Top = 112
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object Label88: TLabel
        Left = 336
        Top = 80
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object SpeedButton4: TSpeedButton
        Left = 188
        Top = 480
        Width = 93
        Height = 41
        Cursor = crHandPoint
        Caption = 'Ok'
        OnClick = SpeedButton1Click
      end
      object SpeedButton5: TSpeedButton
        Left = 24
        Top = 419
        Width = 210
        Height = 46
        Cursor = crHandPoint
        Caption = 'R'#233'initialiser Difficile'
        OnClick = SpeedButton5Click
      end
      object SpeedButton6: TSpeedButton
        Left = 250
        Top = 419
        Width = 210
        Height = 46
        Cursor = crHandPoint
        Caption = 'R'#233'initialiser Tous'
        OnClick = SpeedButton3Click
      end
      object Label46: TLabel
        Left = 100
        Top = 24
        Width = 37
        Height = 20
        Caption = 'Nom'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label47: TLabel
        Left = 230
        Top = 24
        Width = 99
        Height = 20
        Caption = 'Briques/Res'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label48: TLabel
        Left = 380
        Top = 24
        Width = 54
        Height = 20
        Caption = 'Temps'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Tr'#232's Difficile'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ImageIndex = 2
      ParentFont = False
      object Label89: TLabel
        Left = 5
        Top = 24
        Width = 36
        Height = 20
        Caption = 'Pos.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label93: TLabel
        Left = 15
        Top = 80
        Width = 13
        Height = 16
        Caption = '1.'
      end
      object Label94: TLabel
        Left = 15
        Top = 112
        Width = 13
        Height = 16
        Caption = '2.'
      end
      object Label95: TLabel
        Left = 15
        Top = 144
        Width = 13
        Height = 16
        Caption = '3.'
      end
      object Label96: TLabel
        Left = 15
        Top = 176
        Width = 13
        Height = 16
        Caption = '4.'
      end
      object Label97: TLabel
        Left = 15
        Top = 208
        Width = 13
        Height = 16
        Caption = '5.'
      end
      object Label98: TLabel
        Left = 15
        Top = 240
        Width = 13
        Height = 16
        Caption = '6.'
      end
      object Label99: TLabel
        Left = 15
        Top = 272
        Width = 13
        Height = 16
        Caption = '7.'
      end
      object Label100: TLabel
        Left = 15
        Top = 304
        Width = 13
        Height = 16
        Caption = '8.'
      end
      object Label101: TLabel
        Left = 15
        Top = 336
        Width = 13
        Height = 16
        Caption = '9.'
      end
      object Label102: TLabel
        Left = 9
        Top = 368
        Width = 21
        Height = 16
        Caption = '10.'
      end
      object Label103: TLabel
        Left = 46
        Top = 368
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label104: TLabel
        Left = 46
        Top = 336
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label105: TLabel
        Left = 46
        Top = 304
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label106: TLabel
        Left = 46
        Top = 272
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label107: TLabel
        Left = 46
        Top = 240
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label108: TLabel
        Left = 46
        Top = 208
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label109: TLabel
        Left = 46
        Top = 176
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label110: TLabel
        Left = 46
        Top = 144
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label111: TLabel
        Left = 46
        Top = 112
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label112: TLabel
        Left = 46
        Top = 80
        Width = 115
        Height = 16
        Caption = '                 --         '
      end
      object Label113: TLabel
        Left = 263
        Top = 80
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label114: TLabel
        Left = 263
        Top = 112
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label115: TLabel
        Left = 263
        Top = 144
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label116: TLabel
        Left = 263
        Top = 176
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label117: TLabel
        Left = 263
        Top = 208
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label118: TLabel
        Left = 263
        Top = 240
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label119: TLabel
        Left = 263
        Top = 272
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label120: TLabel
        Left = 263
        Top = 304
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label121: TLabel
        Left = 263
        Top = 336
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label122: TLabel
        Left = 263
        Top = 368
        Width = 19
        Height = 16
        Caption = ' -- '
      end
      object Label123: TLabel
        Left = 336
        Top = 368
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object Label124: TLabel
        Left = 336
        Top = 336
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object Label125: TLabel
        Left = 336
        Top = 304
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object Label126: TLabel
        Left = 336
        Top = 272
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object Label127: TLabel
        Left = 336
        Top = 240
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object Label128: TLabel
        Left = 336
        Top = 208
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object Label129: TLabel
        Left = 336
        Top = 176
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object Label130: TLabel
        Left = 336
        Top = 144
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object Label131: TLabel
        Left = 336
        Top = 112
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object Label132: TLabel
        Left = 336
        Top = 80
        Width = 139
        Height = 16
        Caption = '                --                '
      end
      object SpeedButton7: TSpeedButton
        Left = 188
        Top = 479
        Width = 93
        Height = 42
        Cursor = crHandPoint
        Caption = 'Ok'
        OnClick = SpeedButton1Click
      end
      object SpeedButton8: TSpeedButton
        Left = 24
        Top = 419
        Width = 210
        Height = 46
        Cursor = crHandPoint
        Caption = 'R'#233'initialiser Tr'#233's Difficile'
        OnClick = SpeedButton8Click
      end
      object SpeedButton9: TSpeedButton
        Left = 250
        Top = 419
        Width = 210
        Height = 46
        Cursor = crHandPoint
        Caption = 'R'#233'initialiser Tous'
        OnClick = SpeedButton3Click
      end
      object Label90: TLabel
        Left = 100
        Top = 24
        Width = 37
        Height = 20
        Caption = 'Nom'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label91: TLabel
        Left = 230
        Top = 24
        Width = 99
        Height = 20
        Caption = 'Briques/Res'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label92: TLabel
        Left = 380
        Top = 24
        Width = 54
        Height = 20
        Caption = 'Temps'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
end
