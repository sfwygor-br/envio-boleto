unit UPreferencias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, IniFiles
  ;

type
  TFPreferencias = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    hostAPI: TEdit;
    portaAPI: TEdit;
    Label3: TLabel;
    tenantID: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPreferencias: TFPreferencias;

implementation

{$R *.dfm}

procedure TFPreferencias.FormCreate(Sender: TObject);
var     ArquivoIni: TIniFile;
begin
        ArquivoIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'apiclient.ini');
        //configurações do ambiente
        hostAPI.Text := ArquivoIni.ReadString('api', 'host', '');
        portaAPI.Text := ArquivoIni.ReadString('api', 'porta', '');
        tenantID.Text := ArquivoIni.ReadString('api', 'tenantID', 'null');

        ArquivoIni.Free;
end;

procedure TFPreferencias.BitBtn1Click(Sender: TObject);
var     ArquivoIni: TIniFile;
        test:Integer;
begin
        ArquivoIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'apiclient.ini');
        //configurações do ambiente
        ArquivoIni.WriteString('api', 'host', hostAPI.Text);
        ArquivoIni.WriteString('api', 'porta',  portaAPI.Text);
        ArquivoIni.WriteString('api', 'tenantID',  tenantID.Text);
end;

end.
