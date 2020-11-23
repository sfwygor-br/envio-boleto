unit principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  Tfprincipal = class(TForm)
    btnConfigurarTabelionato: TBitBtn;
    btnConfiguracoesLocais: TBitBtn;
    procedure btnConfigurarTabelionatoClick(Sender: TObject);
    procedure btnConfiguracoesLocaisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fprincipal: Tfprincipal;

implementation

uses configurarTabelionato, UPreferencias;

{$R *.dfm}

procedure Tfprincipal.btnConfiguracoesLocaisClick(Sender: TObject);
begin
  Application.CreateForm(TFPreferencias, FPreferencias);
  FPreferencias.ShowModal;
end;

procedure Tfprincipal.btnConfigurarTabelionatoClick(Sender: TObject);
begin
  //Application.CreateForm(TfconfigurarTabelionato, fconfigurarTabelionato);
  fconfigurarTabelionato.ShowModal;
end;

end.
