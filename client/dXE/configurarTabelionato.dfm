inherited fconfigurarTabelionato: TfconfigurarTabelionato
  Left = 699
  Top = 125
  Caption = 'Configurar tabelionato'
  ClientHeight = 287
  OldCreateOrder = True
  ExplicitHeight = 325
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Top = 262
    inherited BitBtn3: TBitBtn
      OnClick = BitBtn3Click
    end
    inherited BitBtn1: TBitBtn
      Visible = False
      OnClick = BitBtn1Click
    end
    inherited BitBtn2: TBitBtn
      Font.Color = clBlack
      Font.Style = []
      OnClick = BitBtn2Click
    end
  end
  inherited Memo1: TMemo
    Top = 182
    ReadOnly = True
    ExplicitTop = 133
  end
  inherited pgc1: TPageControl
    Height = 182
    ActivePage = Tabelionato
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 527
    ExplicitHeight = 171
    object Tabelionato: TTabSheet
      Caption = 'Tabelionato'
      ExplicitHeight = 332
      object bvl1: TBevel
        Left = 0
        Top = 0
        Width = 519
        Height = 154
        Align = alClient
        ExplicitLeft = 152
        ExplicitTop = 80
        ExplicitWidth = 50
        ExplicitHeight = 50
      end
      object lbl1: TLabel
        Left = 44
        Top = 120
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = 'CPF'
      end
      object lbl2: TLabel
        Left = 23
        Top = 96
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tabeli'#227'o'
      end
      object lbl3: TLabel
        Left = 22
        Top = 72
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = 'Telefone'
      end
      object lbl4: TLabel
        Left = 18
        Top = 48
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Endere'#231'o'
      end
      object lbl5: TLabel
        Left = 8
        Top = 24
        Width = 56
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tabelionato'
      end
      object Edit1: TEdit
        Left = 72
        Top = 16
        Width = 425
        Height = 21
        TabOrder = 0
        OnExit = Edit1Exit
      end
      object Edit2: TEdit
        Left = 72
        Top = 112
        Width = 425
        Height = 21
        TabOrder = 1
        OnExit = Edit1Exit
      end
      object Edit3: TEdit
        Left = 72
        Top = 88
        Width = 425
        Height = 21
        TabOrder = 2
        OnExit = Edit1Exit
      end
      object Edit4: TEdit
        Left = 72
        Top = 64
        Width = 425
        Height = 21
        TabOrder = 3
        OnExit = Edit1Exit
      end
      object Edit5: TEdit
        Left = 72
        Top = 40
        Width = 425
        Height = 21
        TabOrder = 4
        OnExit = Edit1Exit
      end
    end
    object SMTP: TTabSheet
      Caption = 'SMTP'
      ImageIndex = 1
      ExplicitLeft = 8
      ExplicitTop = 22
      ExplicitHeight = 356
      object bvl2: TBevel
        Left = 0
        Top = 0
        Width = 519
        Height = 154
        Align = alClient
        ExplicitLeft = 264
        ExplicitTop = 160
        ExplicitWidth = 50
        ExplicitHeight = 50
      end
      object lbl7: TLabel
        Left = 19
        Top = 127
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Senha'
      end
      object lbl6: TLabel
        Left = 14
        Top = 100
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Usu'#225'rio'
      end
      object lbl8: TLabel
        Left = 16
        Top = 73
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = 'Secure'
      end
      object lbl9: TLabel
        Left = 23
        Top = 48
        Width = 25
        Height = 13
        Alignment = taRightJustify
        Caption = 'Porta'
      end
      object lbl10: TLabel
        Left = 26
        Top = 24
        Width = 22
        Height = 13
        Alignment = taRightJustify
        Caption = 'Host'
      end
      object Edit10: TEdit
        Left = 56
        Top = 124
        Width = 425
        Height = 21
        TabOrder = 0
      end
      object Edit9: TEdit
        Left = 56
        Top = 97
        Width = 425
        Height = 21
        TabOrder = 1
      end
      object Edit8: TEdit
        Left = 56
        Top = 70
        Width = 425
        Height = 21
        TabOrder = 2
      end
      object Edit7: TEdit
        Left = 56
        Top = 43
        Width = 425
        Height = 21
        TabOrder = 3
      end
      object Edit6: TEdit
        Left = 56
        Top = 16
        Width = 425
        Height = 21
        TabOrder = 4
      end
    end
  end
  inherited http: TIdHTTP
    Left = 496
    Top = 0
  end
end
