object Form1: TForm1
  Left = 193
  Top = 126
  Width = 543
  Height = 480
  Caption = 'fprocessoBase'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 413
    Width = 527
    Height = 29
    Align = alBottom
    Caption = 'ToolBar1'
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object BitBtn1: TBitBtn
      Left = 8
      Top = 2
      Width = 75
      Height = 22
      Caption = 'Atualizar'
      TabOrder = 0
    end
  end
  object http: TIdHTTP
    MaxLineAction = maException
    ReadTimeout = 0
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 352
    Top = 16
  end
end
