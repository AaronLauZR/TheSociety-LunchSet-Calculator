object TheSocietyLunchSetCalculator_fm: TTheSocietyLunchSetCalculator_fm
  Left = 0
  Top = 0
  Caption = 'The Society Restaurant & Bar Lunch Set Calculator'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lbMeal: TLabel
    Left = 16
    Top = 16
    Width = 55
    Height = 15
    Caption = 'Meal Price'
  end
  object lbQty: TLabel
    Left = 166
    Top = 16
    Width = 46
    Height = 15
    Caption = 'Quantity'
  end
  object lbMultiply: TLabel
    Left = 143
    Top = 40
    Width = 17
    Height = 15
    Caption = '  x  '
  end
  object lbDiscount: TLabel
    Left = 488
    Top = 16
    Width = 94
    Height = 15
    Caption = 'Discount Amount'
  end
  object lbTax: TLabel
    Left = 488
    Top = 72
    Width = 38
    Height = 15
    Caption = 'Tax (%)'
  end
  object lbPrice: TLabel
    Left = 318
    Top = 16
    Width = 134
    Height = 15
    Caption = 'Price after Discount + Tax'
  end
  object lbEqual: TLabel
    Left = 292
    Top = 40
    Width = 20
    Height = 15
    Caption = '  =  '
  end
  object lbCopyright: TLabel
    Left = 438
    Top = 418
    Width = 178
    Height = 15
    Caption = 'Copyright @ 2025 by AaronLauZR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object edMeal0: TcxTextEdit
    Left = 16
    Top = 37
    TabOrder = 0
    Text = '0.00'
    Width = 121
  end
  object edQty0: TcxTextEdit
    Left = 166
    Top = 37
    TabOrder = 1
    Text = '0'
    Width = 121
  end
  object btnAdd: TButton
    Left = 16
    Top = 74
    Width = 33
    Height = 25
    Caption = '+'
    TabOrder = 2
    OnClick = btnAddClick
  end
  object btnCalculate: TButton
    Left = 488
    Top = 130
    Width = 75
    Height = 25
    Caption = 'Calculate'
    TabOrder = 3
    OnClick = btnCalculateClick
  end
  object edDiscount: TcxTextEdit
    Left = 488
    Top = 37
    TabOrder = 4
    Text = '0.00'
    Width = 121
  end
  object edTax: TcxTextEdit
    Left = 488
    Top = 93
    TabOrder = 5
    Text = '16'
    Width = 121
  end
  object edPrice0: TcxTextEdit
    Left = 318
    Top = 37
    Enabled = False
    StyleDisabled.TextColor = clWindowText
    TabOrder = 6
    Width = 134
  end
end
