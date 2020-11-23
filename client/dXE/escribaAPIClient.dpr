program escribaAPIClient;

uses
  Forms,
  principal in 'principal.pas' {fprincipal},
  processo_base in 'processo_base.pas' {FprocessoBase},
  configurarTabelionato in 'configurarTabelionato.pas' {fconfigurarTabelionato},
  uLkJSON in 'uLkJSON.pas',
  UPreferencias in 'UPreferencias.pas' {FPreferencias};

{$R *.res}


begin
  Application.Initialize;
  Application.CreateForm(Tfprincipal, fprincipal);
  Application.CreateForm(TfconfigurarTabelionato, fconfigurarTabelionato);
  Application.CreateForm(TFPreferencias, FPreferencias);
  Application.CreateForm(TFprocessoBase, FprocessoBase);
  Application.Run;
end.
