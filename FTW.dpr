program FTW;

{$R 'Fatwa.res' 'Fatwa.rc'}

uses
  Vcl.Forms,
  SPLASHSCREEN in 'SPLASHSCREEN.pas' {Form1},
  datamodule in 'datamodule.pas' {DM: TDataModule},
  Unit1 in 'Unit1.pas' {main},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Sapphire Kamri');
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tmain, main);
  Application.Run;
end.
