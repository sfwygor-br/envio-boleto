unit principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  Tfprincipal = class(TForm)
    btnConfigurarTabelionato: TBitBtn;
    procedure btnConfigurarTabelionatoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fprincipal: Tfprincipal;

implementation

uses configurarTabelionato;

{$R *.dfm}

procedure Tfprincipal.btnConfigurarTabelionatoClick(Sender: TObject);
begin
  Application.CreateForm(TfconfigurarTabelionato, fconfigurarTabelionato);
  fconfigurarTabelionato.ShowModal;
end;

end.
