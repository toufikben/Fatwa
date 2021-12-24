unit datamodule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Data.DbxSqlite,
  Data.SqlExpr, Data.FMTBcd, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,Vcl.Dialogs,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,vcl.Forms,
  FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    Fconn: TFDConnection;
    FDQuery1: TFDQuery;
    FDQuery1ID_fatwa: TFDAutoIncField;
    FDQuery1Mufti_name: TWideStringField;
    FDQuery1Fatwa_Title: TWideStringField;
    FDQuery1Fatwa_description: TWideStringField;
    FDQuery1Fatwa_audio_loction: TWideStringField;
    FDQuery1start_audio: TWideStringField;
    FDQuery1end_audio: TWideStringField;
    procedure FconnAfterConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure FDQuery1AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Unit1;

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  try
Fconn.Connected := False;
Fconn.Params.Clear;
Fconn.LoginPrompt := false;
Fconn.Params.DriverID := 'SQLite';
Fconn.Params.Add('Database'+'='+ExtractFilePath (application.ExeName)+'FATWA.s3db');
//Fconn.Params.Values['Encrypt'] := 'aes-256'; //encrepty database
//Fconn.Params.Password := 'Fatwa@!alHoda';   //password database
  except
    on E: EDatabaseError do
      ShowMessage('ÕœÀ Œÿ√ «À‰«¡ «·« ’«· »ﬁ«⁄œ… «·»Ì«‰« ' + E.Message);
  end;
end;

procedure TDM.FconnAfterConnect(Sender: TObject);
begin
//creat table
//Fconn.ExecSQL ('CREATE TABLE IF NOT EXISTS Fatwa (ID_fatwa INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,Mufti_name TEXT(300),Fatwa_Title TEXT(250),Fatwa_description TEXT(1000),Fatwa_audio_loction TEXT(500)); ');
//Fconn.ExecSQL ('CREATE TABLE IF NOT EXISTS fatwa_audio (id_audio INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,start_audio TEXT(10) ,end_audio TEXT (10),ID_fatwa  INTEGER NOT NULL,FOREIGN KEY (ID_fatwa)REFERENCES Fatwa (ID_fatwa) )');
//Fconn.ExecSQL ('CREATE TABLE IF NOT EXISTS lang (ID_lang INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,lang TEXT(10))');
Fconn.ExecSQL ('CREATE TABLE IF NOT EXISTS fatwa_audio (ID_Mufti INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,Mufti_name TEXT(150))');   //  FOREIGN KEY (id_mofti)    REFERENCES Mufti(id_mofti)
Fconn.ExecSQL ('CREATE TABLE IF NOT EXISTS Fatwa (ID_fatwa INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,Mufti_name TEXT(300),Fatwa_Title TEXT(250),Fatwa_description TEXT(1000),Fatwa_audio_loction TEXT(500) ,start_audio TEXT(10) ,end_audio TEXT (10))');
Fconn.ExecSQL ('CREATE TABLE IF NOT EXISTS lang (ID_lang INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,lang TEXT(10))');      //,FOREIGN KEY(id_mofti) REFERENCES Mufti(id_mofti)


end;


procedure TDM.FDQuery1AfterScroll(DataSet: TDataSet);
begin
main.LoadImage;

end;

end.
