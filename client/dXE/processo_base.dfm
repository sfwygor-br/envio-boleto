object FprocessoBase: TFprocessoBase
  Left = 193
  Top = 126
  Caption = 'fprocessoBase'
  ClientHeight = 489
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 464
    Width = 527
    Height = 25
    Align = alBottom
    Caption = 'ToolBar1'
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object BitBtn3: TBitBtn
      Left = 8
      Top = 0
      Width = 75
      Height = 22
      Caption = 'Cadastrar'
      TabOrder = 2
      Visible = False
    end
    object ToolButton2: TToolButton
      Left = 83
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object BitBtn1: TBitBtn
      Left = 91
      Top = 0
      Width = 75
      Height = 22
      Caption = 'Atualizar'
      TabOrder = 0
    end
    object ToolButton3: TToolButton
      Left = 166
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object BitBtn2: TBitBtn
      Left = 174
      Top = 0
      Width = 75
      Height = 22
      Caption = 'Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 384
    Width = 527
    Height = 80
    Align = alBottom
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 527
    Height = 384
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 48
    ExplicitTop = 104
    ExplicitWidth = 289
    ExplicitHeight = 193
  end
  object http: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentRangeInstanceLength = -1
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 352
    Top = 16
  end
end
