program escribaAPIClient;

uses
  Forms,
  principal in 'principal.pas' {fprincipal},
  processo_base in 'processo_base.pas' {Form1},
  configurarTabelionato in 'configurarTabelionato.pas' {fconfigurarTabelionato},
  uLkJSON in 'uLkJSON.pas';

{$R *.res}


begin
  Application.Initialize;
  Application.CreateForm(Tfprincipal, fprincipal);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfconfigurarTabelionato, fconfigurarTabelionato);
  Application.Run;
end.
