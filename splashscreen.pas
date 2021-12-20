unit splashscreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,MMSystem,
  Vcl.WinXCtrls;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    ActivityIndicator1: TActivityIndicator;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
// sndPlaySound('sound\1.wav',SND_SYNC );
// Timer1.Enabled := false;
// form2.hide;
//main.show;
end;

end.
