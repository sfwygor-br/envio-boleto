unit configurarTabelionato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, processo_base, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, StdCtrls, Buttons, ComCtrls, ToolWin;

type
  TfconfigurarTabelionato = class(TForm1)
    Memo1: TMemo;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Edit6: TEdit;
    Label7: TLabel;
    Edit7: TEdit;
    BitBtn2: TBitBtn;
    ToolButton2: TToolButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure estado(C, R, U, D : boolean);
  end;

var
  fconfigurarTabelionato: TfconfigurarTabelionato;
  id : string;

implementation

uses ulkjson;

{$R *.dfm}

procedure TfconfigurarTabelionato.BitBtn1Click(Sender: TObject);
var
  js, Items, Item: TlkJSONbase;
  I, J, code: Integer;
  res : TStringStream;

begin
  inherited;
  //id := '5fb9b77ca1362219046f841x';
  http.ProtocolVersion := pv1_0;
  http.Request.ContentType := 'application/json';
  HTTP.Request.UserAgent := 'Mozilla/3.0 (compatible; Indy Library)';
  res := TStringStream.Create('');

  http.Get('http://localhost:81/api/readTabelionatoId/' + id, res);
  code := http.ResponseCode;

  if (code = 200) then
  begin

    js := TlkJSON.ParseText(res.DataString) as TlkJSONobject;
    Memo1.text := res.DataString;
    js := TlkJSON.ParseText(res.datastring);
    for I := 0 to Pred(js.Count) do
    begin
      Items := js.Field['dados'];
      Edit1.Text := VarToStr(Items.Field['tabelionato'].Value);
      Edit2.Text := VarToStr(Items.Field['endereco'].Value);
      Edit3.Text := VarToStr(Items.Field['telefone'].Value);
      Edit4.Text := VarToStr(Items.Field['tabeliao'].Value);
      Edit5.Text := VarToStr(Items.Field['cpf'].Value);
    end;

    estado(false, true, true, true);

  end
  else
    estado(true, false, false, false);
end;

procedure TfconfigurarTabelionato.estado(C, R, U, D: boolean);
begin
  if C then
  begin
    BitBtn2.Visible := True;
    BitBtn1.Visible := False;
  end
  else if R then
  begin
    BitBtn2.Visible := False;
    BitBtn1.Visible := True;
  end;
end;

procedure TfconfigurarTabelionato.FormShow(Sender: TObject);
begin
  inherited;
  id := 'null';
  BitBtn1.Click;
  //estado(true, false, false, false);
end;

procedure TfconfigurarTabelionato.BitBtn2Click(Sender: TObject);
var
  js : string;
  jsRes, Items : TlkJSONbase;
  req, res : TStringStream;
  I, code : integer;

begin
  inherited;
  js := '{';
  js := js + '"tabelionato" : "' + Edit1.Text + '", ';
  js := js + '"endereco" : "' + Edit2.Text + '", ';
  js := js + '"telefone" : "' + Edit3.Text + '", ';
  js := js + '"tabeliao" : "' + Edit4.Text + '", ';
  js := js + '"cpf" : "' + Edit5.Text + '" ';
  js := js + '}';

  http.ProtocolVersion := pv1_0;
  http.Request.ContentType := 'application/json';
  HTTP.Request.UserAgent := 'Mozilla/3.0 (compatible; Indy Library)';
  res := TStringStream.Create('');
  req := TStringStream.Create(js);

  http.Post('http://localhost:81/api/createTabelionato', req, res);
  code := http.ResponseCode;

  if (code = 200) then
  begin

    jsRes := TlkJSON.ParseText(res.DataString) as TlkJSONobject;
    Memo1.text := res.DataString;
    jsRes := TlkJSON.ParseText(res.datastring);
    for I := 0 to Pred(jsRes.Count) do
    begin
      Items := jsRes.Field['dados'];
      id := VarToStr(Items.Field['_id'].Value);
    end;

    BitBtn1.Click;

  end
  else
    estado(false, true, true, false);
end;

end.
