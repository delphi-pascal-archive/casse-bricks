object FormDif: TFormDif
  Left = 379
  Top = 205
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Choix de la Difficult'#233
  ClientHeight = 266
  ClientWidth = 292
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
  object SpeedButtonOk: TSpeedButton
    Left = 45
    Top = 211
    Width = 92
    Height = 38
    Cursor = crHandPoint
    Caption = 'Ok'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButtonOkClick
  end
  object SpeedButtonCancel: TSpeedButton
    Left = 169
    Top = 211
    Width = 88
    Height = 38
    Cursor = crHandPoint
    Caption = 'Quitter'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButtonCancelClick
  end
  object GroupBox1: TGroupBox
    Left = 40
    Top = 32
    Width = 217
    Height = 153
    Caption = 'Difficult'#233
    Color = 14145495
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object RadioButton1: TRadioButton
      Left = 52
      Top = 24
      Width = 133
      Height = 17
      Cursor = crHandPoint
      Caption = '     Normal'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object RadioButton2: TRadioButton
      Left = 52
      Top = 73
      Width = 117
      Height = 17
      Cursor = crHandPoint
      Caption = '     Difficile'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object RadioButton3: TRadioButton
      Left = 52
      Top = 112
      Width = 157
      Height = 33
      Cursor = crHandPoint
      Caption = '     Tr'#232's Difficile'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
end
