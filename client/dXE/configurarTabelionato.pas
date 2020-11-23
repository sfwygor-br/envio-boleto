unit configurarTabelionato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, processo_base, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, StdCtrls, Buttons, ComCtrls, ToolWin, Vcl.ExtCtrls;

type
  TfconfigurarTabelionato = class(TFprocessoBase)
    Tabelionato: TTabSheet;
    bvl1: TBevel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    SMTP: TTabSheet;
    bvl2: TBevel;
    Edit10: TEdit;
    lbl7: TLabel;
    lbl6: TLabel;
    Edit9: TEdit;
    Edit8: TEdit;
    lbl8: TLabel;
    lbl9: TLabel;
    Edit7: TEdit;
    Edit6: TEdit;
    lbl10: TLabel;

    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
  private
    { Private declarations }
    procedure update;
  public
    { Public declarations }
  end;

var
  fconfigurarTabelionato: TfconfigurarTabelionato;

implementation

uses ulkjson, UPreferencias;

{$R *.dfm}

procedure TfconfigurarTabelionato.BitBtn1Click(Sender: TObject);
var
  js, Items, js2, Items2 : TlkJSONbase;
  I, J, code: Integer;
  res : TStringStream;
  requesturi : string;

begin
  inherited;
  http.ProtocolVersion := pv1_1;
  http.Request.ContentType := 'application/json';
  HTTP.Request.UserAgent := 'Mozilla/3.0 (compatible; Indy Library)';
  res := TStringStream.Create('');

  requesturi := 'http://' +host+ ':' +porta+ '/api/readTabelionatoId/' + id;
  Memo1.Lines.Add('request => ' + requesturi);
  http.Get(requesturi, res);
  code := http.ResponseCode;

  if (code = 200) then
  begin

    js := TlkJSON.ParseText(res.DataString) as TlkJSONobject;
    Memo1.Lines.Add(res.DataString);
    for I := 0 to Pred(js.Count) do
    begin
      Items := js.Field['dados'];
      if assigned(Items) then
      begin
        Edit1.Text := VarToStr(Items.Field['tabelionato'].Value);
        Edit2.Text := VarToStr(Items.Field['endereco'].Value);
        Edit3.Text := VarToStr(Items.Field['telefone'].Value);
        Edit4.Text := VarToStr(Items.Field['tabeliao'].Value);
        Edit5.Text := VarToStr(Items.Field['cpf'].Value);
      end;

      for J := 0 to Pred(Items.Count) do
      begin
        Items2 := Items.Field['servidorSMTP'];
        if assigned(Items2) then
        begin
          Edit6.Text := VarToStr(Items2.Field['host'].Value);
          Edit7.Text := VarToStr(Items2.Field['porta'].Value);
          Edit8.Text := VarToStr(Items2.Field['autenticacao'].Value);
          Edit9.Text := VarToStr(Items2.Field['usuario'].Value);
          Edit10.Text := VarToStr(Items2.Field['senha'].Value);
        end;
      end;

    end;

    estado(false, true, false, true);

  end
  else
    estado(true, false, false, false);
end;

procedure TfconfigurarTabelionato.BitBtn2Click(Sender: TObject);
var
  js, requesturi : string;
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
  js := js + '"cpf" : "' + Edit5.Text + '", ';
  js := js + '"servidorSMTP" : [ { ';
  js := js + '"host" : "' + Edit6.Text + '", ';
  js := js + '"porta" : "' + Edit7.Text + '", ';
  js := js + '"autenticacao" : "' + Edit8.Text + '", ';
  js := js + '"usuario" : "' + Edit9.Text + '", ';
  js := js + '"senha" : "' + Edit10.Text + '" ';
  js := js + '} ] ';
  js := js + '}';

  http.ProtocolVersion := pv1_1;
  http.Request.ContentType := 'application/json';
  HTTP.Request.UserAgent := 'Mozilla/3.0 (compatible; Indy Library)';
  res := TStringStream.Create('');
  req := TStringStream.Create(js);

  requesturi := 'http://' +host+ ':' +porta+ '/api/updateTabelionatoId/' + id;
  Memo1.Lines.Add('request => ' + requesturi);
  Memo1.Lines.Add('datastring => ' + req.datastring);
  http.Put(requesturi, req, res);
  code := http.ResponseCode;

  if (code = 200) then
  begin

    estado(false, true, false, false);

  end
  else
    estado(false, true, true, false);

end;

procedure TfconfigurarTabelionato.BitBtn3Click(Sender: TObject);
var
  js, requesturi : string;
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
  js := js + '"cpf" : "' + Edit5.Text + '", ';
  js := js + '"servidorSMTP" : [ { ';
  js := js + '"host" : "' + Edit6.Text + '", ';
  js := js + '"porta" : "' + Edit7.Text + '", ';
  js := js + '"autenticacao" : "' + Edit8.Text + '", ';
  js := js + '"usuario" : "' + Edit9.Text + '", ';
  js := js + '"senha" : "' + Edit10.Text + '" ';
  js := js + '} ] ';
  js := js + '}';

  http.ProtocolVersion := pv1_1;
  http.Request.ContentType := 'application/json';
  HTTP.Request.UserAgent := 'Mozilla/3.0 (compatible; Indy Library)';
  res := TStringStream.Create('');
  req := TStringStream.Create(js);

  requesturi := 'http://' +host+ ':' +porta+ '/api/createTabelionato';
  Memo1.Lines.Add('request => ' + requesturi);
  http.Post(requesturi, req, res);
  code := http.ResponseCode;

  if (code = 200) then
  begin

    jsRes := TlkJSON.ParseText(res.DataString) as TlkJSONobject;
    Memo1.Lines.Add(res.DataString);
    jsRes := TlkJSON.ParseText(res.datastring);
    for I := 0 to Pred(jsRes.Count) do
    begin
      Items := jsRes.Field['dados'];
      id := VarToStr(Items.Field['_id'].Value);

      FPreferencias.tenantID.Text := id;
      FPreferencias.BitBtn1.Click;
    end;

    BitBtn1.Click;

  end
  else
    estado(false, true, true, false);
end;



procedure TfconfigurarTabelionato.Edit1Exit(Sender: TObject);
begin
  inherited;
  update;
end;

procedure TfconfigurarTabelionato.update;
begin
  if (
      Edit1.Modified or
      Edit2.Modified or
      Edit3.Modified or
      Edit4.Modified or
      Edit5.Modified
     ) then
     estado(False, True, True, False);

end;

end.
