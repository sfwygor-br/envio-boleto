unit processo_base;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, ComCtrls, StdCtrls, Buttons, ToolWin;

type
  TFprocessoBase = class(TForm)
    http: TIdHTTP;
    ToolBar1: TToolBar;
    BitBtn1: TBitBtn;
    ToolButton1: TToolButton;
    BitBtn2: TBitBtn;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    BitBtn3: TBitBtn;
    Memo1: TMemo;
    pgc1: TPageControl;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure estado(C, R, U, D : boolean);
  end;

var
  FprocessoBase : TFprocessoBase;
  id, host, porta : string;

implementation

{$R *.dfm}

uses UPreferencias;

procedure TFprocessoBase.estado(C, R, U, D: boolean);
begin
  if C then
  begin
    BitBtn3.Visible := True;
    BitBtn1.Visible := False;
    BitBtn2.Visible := False;
  end;

  if R then
  begin
    BitBtn3.Visible := False;
    BitBtn1.Visible := True;
    BitBtn2.Visible := False;
  end;

  if U then
  begin
    BitBtn3.Visible := False;
    BitBtn1.Visible := True;
    BitBtn2.Visible := True;
  end;
end;

procedure TFprocessoBase.FormShow(Sender: TObject);
begin
  id := FPreferencias.tenantID.Text;
  host := FPreferencias.hostAPI.Text;
  porta := FPreferencias.portaAPI.Text;
  BitBtn1.Click;
  //estado(true, false, false, false);
end;

end.


