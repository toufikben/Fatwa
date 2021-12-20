program FATWA;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {main},
  splashscreen in 'splashscreen.pas' {Form2},
  datamodule in 'datamodule.pas' {DM: TDataModule},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Glossy');
  Application.CreateForm(Tmain, main);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
