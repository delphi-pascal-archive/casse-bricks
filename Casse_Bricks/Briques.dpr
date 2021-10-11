program Briques;

uses
  Forms,
  SysUtils,
  Windows,
  Dialogs,
  Unit1 in 'Unit1.pas' {frmMain},
  frmDificulty in 'frmDificulty.pas' {FormDif},
  frmResults in 'frmResults.pas' {frmRes},
  frmLoseBut in 'frmLoseBut.pas' {frmLoseWin},
  frmWin in 'frmWin.pas' {frmWinner},
  frmInfo in 'frmInfo.pas' {formInfo};

 {$R *.res}

var
MuteX:THandle;

begin
//---------------------- Créer Une Exclusion Mutuelle ------------------------//
MuteX:=OpenMutex(MUTEX_MODIFY_STATE, False,
                  PChar(ExtractFileName(Application.ExeName)));
if (MuteX <> 0) then
  begin
    CloseHandle(MuteX);
    MessageBeep(MB_OK);
    ShowMessage('Vous êtes déjà en cours d''exécution du "Casse Briques"!');
    Exit;
  end;

  MuteX:=CreateMutex(nil, False, PChar(ExtractFileName(Application.ExeName)));
  WaitForSingleObject(MuteX, INFINITE);
//------------------------------------------------------------------------------
  Application.Initialize;
  Application.Title := 'Casse Briques';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
//--------------------- FIN DE l'exclusion Mutuelle --------------------------//
  ReleaseMutex(MuteX);
//------------------------------------------------------------------------------
end.
