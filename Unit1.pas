unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,MMSystem, Vcl.TitleBarCtrls,
  Vcl.NumberBox, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.MPlayer, Vcl.Buttons,system.UITypes,
  Vcl.Imaging.pngimage,Winapi.ShellAPI, Vcl.WinXPickers,DateUtils,System.IOUtils,Vcl.Themes,Vcl.Styles,
  system.Types, Vcl.OleCtrls, WMPLib_TLB;

type
  Tmain = class(TForm)
    PageControl1: TPageControl;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    SearchBox1: TSearchBox;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    Label1: TLabel;
    MediaPlayer1: TMediaPlayer;
    TrackBar1: TTrackBar;
    Timer1: TTimer;
    Panel2: TPanel;
    Panel3: TPanel;
    SearchBox2: TSearchBox;
    rg2: TRadioGroup;
    sw2: TToggleSwitch;
    Panel4: TPanel;
    lblFilename: TLabel;
    Label2: TLabel;
    edt1: TEdit;
    BitBtn1: TBitBtn;
    btn2: TBitBtn;
    btn3: TBitBtn;
    btn4: TBitBtn;
    btn5: TBitBtn;
    BitBtn3: TBitBtn;
    Panel5: TPanel;
    DBGrid2: TDBGrid;
    Rg1: TRadioGroup;
    Label7: TLabel;
    Label8: TLabel;
    btn7: TBitBtn;
    btn8: TBitBtn;
    img1: TImage;
    Label10: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    tm1: TTimePicker;
    Label5: TLabel;
    tm2: TTimePicker;
    Label4: TLabel;
    cb1: TComboBox;
    Label6: TLabel;
    Memo1: TMemo;
    la: TLabel;
    TabSheet1: TTabSheet;
    cbb1: TComboBox;
    img2: TImage;
    lbl1: TLabel;
    Timer2: TTimer;
    cbb2: TComboBox;
    btn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    ProgressBar1: TProgressBar;
    OpenDialog2: TOpenDialog;
    BitBtn5: TBitBtn;
    btn6: TBitBtn;
    tmr1: TTimer;
    WindowsMediaPlayer1: TWindowsMediaPlayer;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure SearchBox1Change(Sender: TObject);
    procedure SearchBox2Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
  private
  procedure StylesListRefresh;
    { Private declarations }
  public
    procedure LoadImage();
    { Public declarations }
  end;

var
  main: Tmain;

implementation

{$R *.dfm}

uses datamodule, SPLASHSCREEN;

procedure Tmain.StylesListRefresh;
var
  stylename: string;

begin
  cbb2.Clear;
    for stylename in TStyleManager.StyleNames do
  begin
    cbb2.Items.Add(stylename);
  end;
end;

procedure Obtenir_la_duree(time:integer; var heure,Minute,Seconde:integer);
  var SecondeTotal:integer;
  begin
  SecondeTotal := time div 1000;  // transformation de milliseconde en seconde
  Heure:=SecondeTotal div 3600;
  SecondeTotal:=SecondeTotal-(Heure * 3600);
  Minute := (SecondeTotal div 60);  // en divise les seconde par 60 = minutes
  Seconde := (SecondeTotal mod 60);
  end;

procedure get_duration(time:integer; var duration:string; separateur:string);
  var Heure,Minute,Seconde:integer;
  begin
  Obtenir_la_duree(time,heure,Minute,Seconde);
  if heure<>0 then
    duration:=inttostr(heure)//  +' heure '
  else
    duration:='';
  duration:=duration+inttostr(Minute);
  if length(inttostr(Seconde))=1 then
    duration:=duration+separateur+'0'+inttostr(Seconde)
  else
    duration:=duration+separateur+inttostr(Seconde);
 end; {get_duration}

  procedure Tmain.BitBtn4Click(Sender: TObject);
var
path,pathexe,aFile: string;
  dirFiles : TStringDynArray;
begin

  if MessageDlg('?? ???? ??? ??????? ????? ????????  ?...',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin

if OpenDialog2.Execute then
if OpenDialog2.FileName <>'' then
begin
path :=ExtractFilePath (OpenDialog2.FileName);
pathexe := ExtractFilePath (application.ExeName);
try
   dirFiles := TDirectory.GetFiles( pathexe+'backup\');

   ProgressBar1.Max := Length(dirFiles);
  ProgressBar1.Position := 0;
  for aFile in dirFiles do
  begin

    if TPath.MatchesPattern(ExtractFileName(aFile),'*.s3db',false) then
    begin
  dm.Fconn.Connected := false;
  DeleteFile (pathexe+ '\FATWA.s3db');
  CopyFile(PChar (ExtractFileName(OpenDialog2.FileName)), PChar(pathexe+'\'+'FATWA.s3db'), true)  ;
  showmessage('??? ?? ??????? ????? ???????? ????? ..?? ?????? ????? ???????? ?? ????');
      end;
     ProgressBar1.Position := 1 + ProgressBar1.Position;
//   if MessageDlg('?? ???? ??? ??????? ????? ????????  ?', mtInformation , [mbok], 0, mbOk)=mrOk  then
//ShellExecute(Handle, nil, PChar(Application.ExeName), nil, nil, SW_SHOWNORMAL);
//Application.Terminate;// or halt
halt;
    // dm.Fconn.Connected := true;
    // dm.FDQuery1.Active := true;

  end;

except
showmessage('?? ??? ??????? ????? ????????');
end;
end;
end;

end;




  procedure Tmain.BitBtn5Click(Sender: TObject);
begin
ShellExecute(Handle,'open', PChar('"' +(ExtractFilePath (application.ExeName))+'backup'+'"'),nil,nil, SW_SHOWNORMAL);
end;

procedure Tmain.BitBtn7Click(Sender: TObject);
begin
tmr1.Enabled :=False;
Timer1.Enabled :=False;
Timer2.Enabled :=False;
 WindowsMediaPlayer1.controls.stop;
if  MediaPlayer1.Mode = mpPlaying then
MediaPlayer1.Stop;

end;

procedure Tmain.BitBtn8Click(Sender: TObject);
begin
  dm.FDQuery1.Next;
    Button1Click(Sender);
  end;

procedure Tmain.BitBtn9Click(Sender: TObject);
begin
 dm.FDQuery1.Prior;
    Button1Click(Sender);
end;

procedure Tmain.LoadImage();
begin
  if ( dm.FDQuery1.IsEmpty = true )  then
    exit;
//   edt1.Text := TStringField( dm.FDQuery1.FieldByName('Fatwa_Title') ).AsString;
//   memo1.Text := TStringField( dm.FDQuery1.FieldByName('Fatwa_description') ).AsString;
//   cb1.Text := TStringField( dm.FDQuery1.FieldByName('Mufti_name') ).AsString;
//    // tm1.Time := DataSrc.DataSet.FieldByName('start_audio').asDateTime;
   la.caption :=TStringField( dm.FDQuery1.FieldByName('id_fatwa') ).AsString+':'+'ID';
//   tm1.Time :=  TStringField(dm.FDQuery1.FieldByName('start_audio')).asdatetime;
//   tm2.Time := TStringField( dm.FDQuery1.FieldByName('end_audio') ).asdatetime;
  end;


procedure Tmain.SearchBox1Change(Sender: TObject);
begin
tmr1.Enabled :=False;
Timer1.Enabled :=False;
Timer2.Enabled :=False;
WindowsMediaPlayer1.controls.Stop;
if MediaPlayer1.Mode = mpPlaying then
 MediaPlayer1.Stop;

if rg1.ItemIndex = 0  then
begin
dm.FDQuery1.SQL.Text:= 'SELECT * FROM fatwa WHERE Fatwa_Title like '+ QuotedStr(SearchBox1.text+'%')  ;
dm.FDQuery1.Active:=true ;

end
else
if rg1.ItemIndex =1 then
begin
dm.FDQuery1.SQL.Text:= 'SELECT * FROM fatwa WHERE Fatwa_description like '+ QuotedStr(SearchBox1.text+'%')  ;
dm.FDQuery1.Active:=true;
end;
end;

procedure Tmain.SearchBox2Change(Sender: TObject);
begin
tmr1.Enabled :=False;
Timer1.Enabled :=False;
Timer2.Enabled :=False;
WindowsMediaPlayer1.controls.Stop;
if MediaPlayer1.Mode = mpPlaying then
 MediaPlayer1.Stop;

if rg2.ItemIndex = 0  then
begin
dm.FDQuery1.SQL.Text:= 'SELECT * FROM fatwa WHERE Fatwa_Title like '+ QuotedStr('%'+SearchBox2.text+'%')  ;
dm.FDQuery1.Active:=true ;

end
else
if rg2.ItemIndex =1 then
begin
dm.FDQuery1.SQL.Text:= 'SELECT * FROM fatwa WHERE Fatwa_description like '+ QuotedStr('%'+SearchBox2.text+'%')  ;
dm.FDQuery1.Active:=true;
end;
end;

procedure Tmain.BitBtn1Click(Sender: TObject);
begin
 ShellExecute(Handle, 'OPEN', pchar('explorer.exe'), pchar('/select, "' +(ExtractFilePath (application.ExeName))+ dm.FDQuery1.FieldByName('Fatwa_audio_loction').Asstring+ '"'),   nil,  SW_NORMAL);
end;

procedure Tmain.BitBtn2Click(Sender: TObject);
var
  dirFiles : TStringDynArray;
  aFile : string;
begin
if not DirectoryExists(ExtractFilePath (application.ExeName)+'\backup') then
 MkDir(ExtractFilePath (application.ExeName)+'backup');

if not FileExists(ExtractFilePath (application.ExeName)+'\FATWA.s3db')  then
begin
showmessage('?? ??? ????? ????? ????????  ???? ?????...');
  end
  else
begin

  dirFiles := TDirectory.GetFiles(ExtractFilePath (application.ExeName));
   ProgressBar1.Max := Length(dirFiles);
  ProgressBar1.Position := 0;
  for aFile in dirFiles do
  begin
    if TPath.MatchesPattern(ExtractFileName(aFile),'*.s3db',false) then
    begin
    CopyFile(PChar (ExtractFilePath (application.ExeName)+'\FATWA.s3db'), PChar(ExtractFilePath (application.ExeName)+'\backup\'+FormatDateTime('dd-mm-yyyy-hh-mm-ss', Now)+'.s3db'), false);
    showmessage('??? ?? ??? ???? ???????? ?????');
      end;
         ProgressBar1.Position := 1 + ProgressBar1.Position;

  end;
end;
end;

procedure Tmain.BitBtn3Click(Sender: TObject);
var
  path : string;
 begin
    path := ExtractFilePath (application.ExeName);
 if dm.FDQuery1.FieldByName('Fatwa_audio_loction').IsNull or  not FileExists(path+ dm.FDQuery1.FieldByName('Fatwa_audio_loction').asString) then
 begin
 ShowMessage('??? ?? ????? ????? ?????? ???? ?? ????? ?????? ??????')
 end else
begin
 Timer2.Enabled:=False;
 Timer1.Enabled:=False;
 MediaPlayer1.FileName:=(path+dm.FDQuery1.FieldByName('Fatwa_audio_loction').Asstring);
 MediaPlayer1.Open;

 MediaPlayer1.StartPos := ( TStringField( dm.FDQuery1.FieldByName('start_audio') ).AsInteger)* 1000;
 MediaPlayer1.endPos :=   ( TStringField( dm.FDQuery1.FieldByName('end_audio') ).AsInteger)* 1000;
 if (MediaPlayer1.StartPos >= MediaPlayer1.TrackLength[1] )  or (MediaPlayer1.endPos >= MediaPlayer1.TrackLength[1] )  then
  begin
 ShowMessage('??? ????? ?? ????? ?????? ?????? ?????? ??? ?????? ??????')
  end else

 TrackBar1.Max:=MediaPlayer1.TrackLength[1];
 Timer2.Enabled:=True;
 MediaPlayer1.Play;
end;
end;

procedure Tmain.btn1Click(Sender: TObject);
begin
TStyleManager.SetStyle(cbb2.Items[cbb2.ItemIndex]);
SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0,
                     SWP_NoMove or SWP_NoSize);
end;

procedure Tmain.btn3Click(Sender: TObject);
var
 AppDir,path: string;
begin
if (edt1.text  = '') or (cb1.text='') or (Memo1.Text='') then
begin
showmessage('!...?? ???? ???? ???? ????????')
end
else
if (dm.FDQuery1.Locate('Fatwa_Title;Fatwa_description',VarArrayOf([edt1.text,memo1.text]),[])) then
begin                                                         // loCaseInsensitive,loPartialKey
ShowMessage('????? ????? ??????. ?????? ????? ????????');
end
else
begin
//  AppDir := 'Fatwa_audio_loction'+'\';
    if cb1.ItemIndex = 0 then
  begin
  AppDir := 'Fatwa_audio_loction'+'\Al_Albani'+'\';
  end;
  if cb1.ItemIndex = 1 then
  begin
    AppDir := 'Fatwa_audio_loction'+'\ibn_uthaymeen'+'\';
  end;
  if cb1.ItemIndex = 2 then
  begin
  AppDir := 'Fatwa_audio_loction'+'\ibn_baaz'+'\';
  end;
  path := ExtractFilePath (application.ExeName);
  if OpenDialog1.Execute then
  if OpenDialog1.FileName <>'' then
  begin
    dm.FDQuery1.edit;
    dm.FDQuery1.fieldvalues['Fatwa_Title'] := edt1.text;
    dm.FDQuery1.fieldvalues['Fatwa_description'] :=memo1.text;
    dm.FDQuery1.fieldvalues['Mufti_name'] := cb1.text;

 dm.FDQuery1.fieldvalues['start_audio'] := (SecondOfTheDay(StrToTime(FormatDateTime('HH:MM:SS',(tm1.Time))))).ToString;
    dm.FDQuery1.fieldvalues['end_audio'] := (SecondOfTheDay(StrToTime(FormatDateTime('HH:MM:SS',(tm2.Time))))).ToString;
     TStringField( dm.FDQuery1.FieldByName('Fatwa_audio_loction') ).AsString :=  AppDir+ExtractFileName(OpenDialog1.FileName);
    dm.FDQuery1.Post;
    dm.FDQuery1.Refresh;

   If  FileExists(path+AppDir+ExtractFileName(OpenDialog1.FileName)) Then
   Begin
   ShowMessage('?????? ?????? ?????  ?????..???? ????? ????? ')
   End else

  Begin
    Try
      If  CopyFile(PChar (OpenDialog1.FileName), PChar(path+AppDir+ExtractFileName(OpenDialog1.FileName)), true) Then
        ShowMessage('?? ??? ????? ?????')
      Else
        ShowMessage(' ??? ??? ?????  ??? ????? ');
    Except
      On E: Exception Do
        ShowMessage(E.ClassName + ' ???  ??? ?? ??? ????? ???? ????  ???????? ??? ???? ' + E.Message);
    End;
  End;
  //   LoadImage();
  end;
   end;
end;

procedure Tmain.btn4Click(Sender: TObject);
 var
   AppDir,path: string;
begin
if (edt1.text  = '') or (cb1.text='') or (Memo1.Text='') then
begin
showmessage('!...?? ???? ???? ???? ????????')
end
else
if (dm.FDQuery1.Locate('Fatwa_Title;Fatwa_description',VarArrayOf([edt1.text,memo1.text]),[])) then
begin                                                         // loCaseInsensitive,loPartialKey
ShowMessage('????? ????? ??????. ?????? ????? ????????');
end
else
begin
//  AppDir := ExtractFileDir(Application.ExeName)+'\Fatwa_audio_loction\';
  if cb1.ItemIndex = 0 then
  begin
  AppDir := 'Fatwa_audio_loction'+'\Al_Albani'+'\';
  end;
  if cb1.ItemIndex = 1 then
  begin
    AppDir := 'Fatwa_audio_loction'+'\ibn_uthaymeen'+'\';
  end;
  if cb1.ItemIndex = 2 then
  begin
  AppDir := 'Fatwa_audio_loction'+'\ibn_baaz'+'\';
  end;

  path := ExtractFilePath (application.ExeName);
  if OpenDialog1.Execute then
  if OpenDialog1.FileName <>'' then
  begin
    dm.FDQuery1.Append;
    dm.FDQuery1.fieldvalues['Fatwa_Title'] := edt1.text;
    dm.FDQuery1.fieldvalues['Fatwa_description'] :=memo1.text;
    dm.FDQuery1.fieldvalues['Mufti_name'] := cb1.text;

 //    la.Caption:=(SecondOfTheDay(StrToTime(FormatDateTime('HH:MM:SS',(tm1.Time))))).ToString;  //DateUtils uses

    dm.FDQuery1.fieldvalues['start_audio'] := (SecondOfTheDay(StrToTime(FormatDateTime('HH:MM:SS',(tm1.Time))))).ToString;
    dm.FDQuery1.fieldvalues['end_audio'] := (SecondOfTheDay(StrToTime(FormatDateTime('HH:MM:SS',(tm2.Time))))).ToString;
 //   dm.FDQuery1.fieldvalues['start_audio'] := FormatDateTime('HH:MM:SS',(tm1.Time));
 //   dm.FDQuery1.fieldvalues['end_audio'] :=FormatDateTime('HH:MM:SS',(tm2.Time)) ;
     TStringField( dm.FDQuery1.FieldByName('Fatwa_audio_loction') ).AsString :=  AppDir+ExtractFileName(OpenDialog1.FileName);
    dm.FDQuery1.Post;
    dm.FDQuery1.Refresh;

//    renameFile(ExtractFileName(OpenDialog1.FileName),AppDir+ExtractFileExt(OpenDialog1.FileName)) ;//renameFile(ExtractFileName(OpenDialog1.FileName),AppDir+edt1.Text+ExtractFileExt(OpenDialog1.FileName)) ;
 //  SearchBox2.Text :=path+AppDir+ExtractFileName(OpenDialog1.FileName);

   If  FileExists(path+AppDir+ExtractFileName(OpenDialog1.FileName)) Then
   Begin
   ShowMessage('?????? ?????? ?????  ?????..???? ????? ????? ')
   End else

  Begin
    Try
      If  CopyFile(PChar (OpenDialog1.FileName), PChar(path+AppDir+ExtractFileName(OpenDialog1.FileName)), true) Then
        ShowMessage('?? ??? ????? ?????')
      Else
        ShowMessage(' ??? ??? ?????  ??? ????? ');
    Except
      On E: Exception Do
        ShowMessage(E.ClassName + ' ???  ??? ?? ??? ????? ???? ????  ???????? ??? ???? ' + E.Message);
    End;
  End;
                                                                                                                                                     //AppDir+edt1.Text+ExtractFileExt(OpenDialog1.FileName);

//   LoadImage();
  end;
   end;
end;



procedure Tmain.btn5Click(Sender: TObject);
begin
  if MessageDlg('!....???? ??? ????? ???? ',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
   begin



 if not dm.FDQuery1.IsEmpty then
 begin
    try
//    dm.FDQuery1.SQL.Text:= 'delete from Fatwa where id_fatwa = (:id_fatwa) ';
//    dm.FDQuery1.ParamByName('id_fatwa').Value := la.caption;
//    dm.FDQuery1.ExecSQL();
    dm.FDQuery1.Delete;
//   dm.FDQuery1.Active:= false;
//   dm.FDQuery1.SQL.Clear;
//   dm.FDQuery1.SQL.add('select * from fatwa');
//   dm.FDQuery1.Active := true;
  except
    on e: Exception do
    begin
      SHowMessage(e.Message);
    end;
    end; end;
   end;
end;

procedure Tmain.btn6Click(Sender: TObject);
begin
 Timer1.Enabled := False;
 edt1.text  := '';
 memo1.text  := '';
 cb1.ItemIndex :=-1;
 TM1.Time := 0;
 TM2.Time := 0;
 SearchBox2.Text :='';
end;

procedure Tmain.btn7Click(Sender: TObject);
begin
ShellExecute(Handle, 'open','https://www.facebook.com/Yamada.Fakir1',nil,nil, SW_SHOWNORMAL) ;
end;

procedure Tmain.btn8Click(Sender: TObject);
begin
MessageDlg('???'+'www.yamada15@gmail.com'+'???', mtInformation, [mbOK], 0) ;
end;

procedure Tmain.Button1Click(Sender: TObject);
var
  path : string;
 begin

//if MediaPlayer1.FileName='' then
//   ShowMessage('?? ??? ?????? ??? ???? ?? ?????? ??? ???? ????');    MediaPlayer1.Close
    path := ExtractFilePath (application.ExeName);
  if (dm.FDQuery1.FieldByName('Fatwa_audio_loction').Text.IsEmpty  =true ) or  not FileExists(path+ dm.FDQuery1.FieldByName('Fatwa_audio_loction').asString) then
  begin

 ShowMessage('??? ?? ????? ????? ?????? ???? ?? ????? ?????? ??????')
   end else   begin
 Timer1.Enabled:=False;
 Timer2.Enabled:=False;
 tmr1.Enabled:=False;
 if sw2.State =tsson  then
  begin
 MediaPlayer1.FileName:=(path+ dm.FDQuery1.FieldByName('Fatwa_audio_loction').Asstring);
 MediaPlayer1.Open;

 MediaPlayer1.StartPos := ( TStringField( dm.FDQuery1.FieldByName('start_audio') ).AsInteger)* 1000;
 MediaPlayer1.endPos :=   ( TStringField( dm.FDQuery1.FieldByName('end_audio') ).AsInteger)* 1000;
 if (MediaPlayer1.StartPos >= MediaPlayer1.TrackLength[1] )  or (MediaPlayer1.endPos >= MediaPlayer1.TrackLength[1] )  then
  begin
 ShowMessage('??? ????? ?? ????? ?????? ?????? ?????? ??? ?????? ??????')
  end else

 TrackBar1.Max:=MediaPlayer1.TrackLength[1];
 Timer1.Enabled:=True;
 MediaPlayer1.Play;
   end else
   begin
  if sw2.State =tssOff then
  WindowsMediaPlayer1.URL :=(path+ dm.FDQuery1.FieldByName('Fatwa_audio_loction').Asstring);
  WindowsMediaPlayer1.controls.play;
  windowsMediaPlayer1.controls.currentPosition:= (TStringField( dm.FDQuery1.FieldByName('start_audio') ).AsInteger);
  tmr1.Enabled:=True;
//   edt1.text:=inttostr((TStringField( dm.FDQuery1.FieldByName('start_audio') ).AsInteger));
////  SearchBox1.Text := MediaPlayer1.TrackLength[1].ToString;

 //Obtenir_la_duree(MediaPlayer1.TrackLength[1],heure,Minute,Seconde);la.Caption :=  heure.ToString+Minute.ToString+Seconde.ToString  ;
// get_duration(MediaPlayer1.TrackLength[1],duration,':');la.Caption :=  duration  ;
   //     chaine_de_ficelle:=chaine_de_ficelle+utile.CRLF;
   end;
   end;
end;

procedure Tmain.FormActivate(Sender: TObject);
begin
 TM1.Time := 0;
 TM2.Time := 0;
 dm.Fconn.Connected := true;
dm.FDQuery1.Active := True;
 if not DirectoryExists(ExtractFilePath (application.ExeName)+'Fatwa_audio_loction') then
 begin
 CreateDir(ExtractFilePath (application.ExeName)+'Fatwa_audio_loction');
end;

 if not DirectoryExists(ExtractFilePath (application.ExeName)+'Fatwa_audio_loction'+'\Al_Albani') then
 begin
 CreateDir(ExtractFilePath (application.ExeName)+'Fatwa_audio_loction'+'\Al_Albani');
end;

 if not DirectoryExists(ExtractFilePath (application.ExeName)+'Fatwa_audio_loction'+'\ibn_uthaymeen') then
 begin
 CreateDir(ExtractFilePath (application.ExeName)+'Fatwa_audio_loction'+'\ibn_uthaymeen');
end;

 if not DirectoryExists(ExtractFilePath (application.ExeName)+'Fatwa_audio_loction'+'\ibn_baaz') then
 begin
 CreateDir(ExtractFilePath (application.ExeName)+'Fatwa_audio_loction'+'\ibn_baaz');
end;
end;

procedure Tmain.FormClose(Sender: TObject; var Action: TCloseAction);var
vExeFile: string;
  RS: TResourceStream;
begin
WindowsMediaPlayer1.controls.stop;
  if FileExists(ExtractFilePath (application.ExeName)+'sound\bhamdala.wav')   then
 begin  sndPlaySound('sound\bhamdala.wav',SND_SYNC );

 end
  else
  begin
   RS := TResourceStream.Create(HInstance,'bhamdala', RT_RCDATA);

  try
    // setting up the temporary file name
    vExeFile := ExtractFilePath(ParamStr(0)) +'sound\'+'bhamdala.wav';
      RS.SaveToFile(vExeFile);
      sndPlaySound('sound\bhamdala.wav',SND_SYNC );

   finally
    RS.Free;
  end;
   end;
  form1.Close;
  Application.Terminate;
// application.Destroy;
//MMSystem
 //  sndPlaySound('help\1.wav',SND_ASYNC );
   // SND_SYNC  =0 = Start playing, and wait for the sound to finish
    //SND_ASYNC =1 = Start playing, and don't wait to return
   // SND_LOOP  =8 = Keep looping the sound until another sound is played  }
end;
procedure Tmain.FormCreate(Sender: TObject);
begin
 Application.MainFormOnTaskbar := False; //show icon on taskbar

// TStyleManager.SetStyle(cbb2.Items[cbb2.ItemIndex]);
//if cbb2.Items.Count = 0 then
StylesListRefresh;
end;

procedure Tmain.Timer1Timer(Sender: TObject);
var  heure,Minute,Seconde:integer;
begin
TrackBar1.Max := MediaPlayer1.Length;
heure := (MediaPlayer1.Position Div 3600000);
 // Minute := MediaPlayer1.Position Div 60000;
 Minute := (MediaPlayer1.Position Mod 3600000) Div 60000;
  Seconde := (MediaPlayer1.Position Mod 60000 )Div 1000 ;
//
  lbl1.Caption := Format('%d:%2.2d:%2.2d ', [heure,Minute,Seconde]);
// lbl1.Caption := Format('%d:%2.2d:%2.2d', [(MediaPlayer1.Position div 3600000),(MediaPlayer1.Position div 60000),
//                        (MediaPlayer1.Position mod 60000 div 1000)]);
//if TrackBar1.Max <> 0 then
//  TrackBar1.Position := MediaPlayer1.Position;
TrackBar1.Position:=MediaPlayer1.Position;
Label1.Caption:=FormatFloat('0#.##',(TrackBar1.Position/Trackbar1.Max)*100)+' %';
if MediaPlayer1.Position=TrackBar1.Max then MediaPlayer1.Stop;
end;

procedure Tmain.Timer2Timer(Sender: TObject);
var  heure,Minute,Seconde:integer;
begin
    TrackBar1.Max := MediaPlayer1.Length;
    heure := (MediaPlayer1.Position Div 3600000);
    Minute := (MediaPlayer1.Position Mod 3600000) Div 60000;
    Seconde := (MediaPlayer1.Position Mod 60000 )Div 1000  ;
    lbl1.Caption := Format('%d:%2.2d:%2.2d ', [heure,Minute,Seconde]);
    TrackBar1.Position:=MediaPlayer1.Position;
    Label1.Caption:=FormatFloat('0#.##',(TrackBar1.Position/Trackbar1.Max)*100)+' %';
   // if MediaPlayer1.Position=TrackBar1.Max then begin dm.FDQuery1.Next ;BitBtn3Click(Sender );
  if  MediaPlayer1.Mode = mpStopped  then
   begin
    dm.FDQuery1.Next;
    BitBtn3Click(Sender );
  end;
end;

procedure Tmain.tmr1Timer(Sender: TObject);
begin
 if WindowsMediaPlayer1.controls.currentPosition >= (TStringField( dm.FDQuery1.FieldByName('end_audio') ).AsInteger) then
 WindowsMediaPlayer1.controls.stop;
end;

procedure Tmain.TrackBar1Change(Sender: TObject);
begin
// if WindowsMediaPlayer1.controls.currentPosition >= ( TStringField( dm.FDQuery1.FieldByName('end_audio') ).AsInteger)* 1000 then
// WindowsMediaPlayer1.controls.stop;

end;
//MediaPlayer1.Start := TrackBar1.Position;
//MediaPlayer1.Play;
end.
