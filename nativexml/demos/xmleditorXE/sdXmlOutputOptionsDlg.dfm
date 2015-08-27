object XmlOutputOptionsDlg: TXmlOutputOptionsDlg
  Left = 1389
  Top = 727
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'XML Output Options'
  ClientHeight = 282
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 233
    Height = 217
    Caption = 'XML Encoding'
    TabOrder = 0
    object rbStoredEncoding: TRadioButton
      Left = 8
      Top = 24
      Width = 113
      Height = 17
      Caption = 'Stored Encoding'
      TabOrder = 0
    end
    object rbDefaultEncodings: TRadioButton
      Left = 8
      Top = 48
      Width = 113
      Height = 17
      Caption = 'Default Encodings:'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object rbCodepage: TRadioButton
      Left = 8
      Top = 152
      Width = 217
      Height = 17
      Caption = 'Ansi encoding with specific codepage'
      TabOrder = 2
    end
    object lbDefaultEncodings: TListBox
      Left = 24
      Top = 72
      Width = 121
      Height = 73
      ItemHeight = 13
      Items.Strings = (
        'utf-8'
        'utf-16'
        'windows-1252')
      TabOrder = 3
    end
    object edCodepage: TEdit
      Left = 24
      Top = 176
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'windows-1258'
    end
  end
  object btnOK: TButton
    Left = 144
    Top = 232
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 272
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object rgXmlFormat: TRadioGroup
    Left = 247
    Top = 8
    Width = 218
    Height = 81
    Caption = 'Xml Format'
    ItemIndex = 0
    Items.Strings = (
      'Compact'
      'Readable'
      'Preserve')
    TabOrder = 3
  end
end
