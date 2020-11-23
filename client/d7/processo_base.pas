unit processo_base;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, ComCtrls, StdCtrls, Buttons, ToolWin;

type
  TForm1 = class(TForm)
    http: TIdHTTP;
    ToolBar1: TToolBar;
    BitBtn1: TBitBtn;
    ToolButton1: TToolButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
