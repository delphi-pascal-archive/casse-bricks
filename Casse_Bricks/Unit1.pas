unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Menus, StdCtrls, Buttons, frmDificulty, Registry, frmResults,
  ExtCtrls, frmLoseBut, frmWin, frmInfo, Jpeg, AppEvnts, XPMan;
  
type
  TfrmMain = class(TForm)
    SpeedButtonNewGame: TSpeedButton;
    SpeedButtonDificulty: TSpeedButton;
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButtonTopResults: TSpeedButton;
    SpeedButtonPause: TSpeedButton;
    SpeedButtonInfo: TSpeedButton;
    Image1: TImage;
    DrawGrid: TDrawGrid;
    XPManifest1: TXPManifest;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure DrawGridDrawCell(Sender: TObject; ACol, ARow: Integer;
    Rect: TRect; State: TGridDrawState);
    procedure DrawGridSelectCell(Sender: TObject; ACol, ARow: Integer;
    var CanSelect: Boolean);
      procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
      procedure SpeedButtonNewGameMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
      procedure DrawGridMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
      procedure SpeedButtonNewGameClick(Sender: TObject);
      procedure SpeedButtonDificultyMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
      procedure SpeedButtonDificultyClick(Sender: TObject);
      procedure Timer1Timer(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
      procedure SpeedButtonTopResultsMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
      procedure SpeedButtonTopResultsClick(Sender: TObject);
      procedure SpeedButtonPauseMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
      procedure SpeedButtonInfoMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
      procedure SpeedButtonPauseClick(Sender: TObject);
      procedure SpeedButtonInfoClick(Sender: TObject);
      procedure DrawGridMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
      procedure DrawGridMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
      procedure BitBtn1Click(Sender: TObject);
      private
      { Private declarations }
      procedure AssignBrickColors;
      procedure RedrawCells;
      procedure RemoveBricks (cl : TColor; ACol, ARow : Integer);
      function IsBrickAlone(ACol, ARow : Integer) : Boolean;
      procedure SlideBricksDown;
      procedure SlideBricksSide;
      procedure CheckForWin;
      function BricksLeftCounter : Integer;
      procedure CheckTopScores (bricks, value : Integer);
      procedure AnswerToCheckTopScores(SK : String; bricks, value : Integer);
      function GetResStreamJPG(const ResName:String):TJPEGImage;
      procedure HighlightScore(sk : String; topscore : Integer);
      public
      { Public declarations }
    end;
    
const
  MAX_COLORS = 3;
  MAX_COLORS_HARD = 4;
  MAX_COLORS_VERY_HARD = 5;
  PossibleColors : Array [0..MAX_COLORS-1] of TColor = (clRed, clBlue, clYellow);
  PossibleColorsHard : Array [0..MAX_COLORS_HARD-1] of TColor = (clRed, clBlue, clYellow, clGreen);
  PossibleColorsVeryHard : Array [0..MAX_COLORS_VERY_HARD-1] of TColor = (clRed, clBlue, clYellow, clGreen, clFuchsia);
  MAX_COLUMNS = 20;
  MAX_ROWS = 20;
  WALL_COLOR : TColor = clSilver;
  
var
  frmMain: TfrmMain;
  ColorOfBrick : Array [0..MAX_COLUMNS-1, 0..MAX_ROWS-1] of TColor;
  leftside, pausestate : Boolean;
  Reg:TRegistry;
  state, statemin, statehrs : Integer;
  GameValue, BricksLeft, TopScoPos : Integer;
  TopScoName : String;
  G : TJPEGImage;
  finished : Boolean;
  
implementation

{$R *.dfm}
{$R Main_RES.RES}

{ TForm1 }

procedure TfrmMain.AssignBrickColors;
var
  i, j : Integer;
begin
  Reg:=TRegistry.Create;
  try
    //===================== Registre d'entrée de difficulté ======================//
    
    Reg.RootKey:=HKEY_LOCAL_MACHINE;
    Reg.OpenKey('Software\Briques\Dificulte', True);
    
    if (Reg.ReadString('Dificulte') = '') then
      
    begin
      Reg.WriteString('Dificulte', 'Normal');
      
      for i := 0 to frmMain.DrawGrid.ColCount-1 do
        for j := 0 to frmMain.DrawGrid.RowCount-1 do
        ColorOfBrick[i][j] := PossibleColors[Random(MAX_COLORS)];
    end
    
    else if (Reg.ReadString('Dificulte') = 'Normal') then
      
    for i := 0 to frmMain.DrawGrid.ColCount-1 do
      for j := 0 to frmMain.DrawGrid.RowCount-1 do
      ColorOfBrick[i][j] := PossibleColors[Random(MAX_COLORS)]
    
    else if (Reg.ReadString('Dificulte') = 'Difficile') then
      
    for i := 0 to frmMain.DrawGrid.ColCount-1 do
      for j := 0 to frmMain.DrawGrid.RowCount-1 do
      ColorOfBrick[i][j] := PossibleColorsHard[Random(MAX_COLORS_HARD)]
    
    else
      
    for i := 0 to frmMain.DrawGrid.ColCount-1 do
      for j := 0 to frmMain.DrawGrid.RowCount-1 do
      ColorOfBrick[i][j] := PossibleColorsVeryHard[Random(MAX_COLORS_VERY_HARD)];
    
    Reg.CloseKey;
    //==============================================================================
  finally
    Reg.Free;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  i : Integer;
begin
  G:=TJPEGImage.Create;
  Reg:=TRegistry.Create;
  try
    //===================== Entrée de Registre pour les meilleurs scores =========//
    
    Reg.RootKey:=HKEY_LOCAL_MACHINE;
    
    for i:= 1 to 10 do
      
    begin
      Reg.OpenKey('Software\Briques\Top Scores\Normal' + '\' + IntToStr(i), True);
      
      if Reg.ReadString('Temps') = '' then
      begin
        Reg.WriteInteger('Value', 90060);
        Reg.WriteInteger('Briques/Res', 400);
        Reg.WriteString('Temps', '');
        Reg.WriteString('Nom', '');
      end;
      
      Reg.CloseKey;
    end;
    
    for i:= 1 to 10 do
      
    begin
      Reg.OpenKey('Software\Briques\Top Scores\Difficile' + '\' + IntToStr(i), True);
      
      if Reg.ReadString('Temps') = '' then
      begin
        Reg.WriteInteger('Value', 90060);
        Reg.WriteInteger('Briques/Res', 400);
        Reg.WriteString('Temps', '');
        Reg.WriteString('Nom', '');
      end;
      
      Reg.CloseKey;
    end;
    
    for i:= 1 to 10 do
      
    begin
      Reg.OpenKey('Software\Briques\Top Scores\TresDifficile' + '\' + IntToStr(i), True);
      
      if Reg.ReadString('Temps') = '' then
      begin
        Reg.WriteInteger('Value', 90060);
        Reg.WriteInteger('Briques/Res', 400);
        Reg.WriteString('Temps', '');
        Reg.WriteString('Nom', '');
      end;
      
      Reg.CloseKey;
    end;
    
    //==============================================================================
    
    G:=GetResStreamJPG('Garden');
    Image1.Picture.Graphic:=G;
  finally
    G.Free;
    Reg.Free;
  end;
  finished := True;
  frmMain.KeyPreview := True;
  frmMain.Position := poScreenCenter;
  Label1.Caption := '';
  Label1.Hide;
  Label2.Caption := '';
  Label2.Hide;
  Label3.Left := 210;
  Label3.Caption := ' 0 sec';
  Timer1.Interval := 1000;
  Timer1.Enabled := False;
  state := 0;
  statemin := 0;
  statehrs := 0;
  leftside := True;
  Randomize;
  SpeedButtonNewGame.Click;
end;

procedure TfrmMain.DrawGridDrawCell(Sender: TObject; ACol, ARow: Integer;
Rect: TRect; State: TGridDrawState);
begin
  DrawGrid.Canvas.Brush.Color := ColorOfBrick[ACol][ARow];
  DrawGrid.Canvas.FillRect(Rect);
end;

procedure TfrmMain.RedrawCells;
var
  i, j : Integer;
begin
  for i := 0 to frmMain.DrawGrid.ColCount-1 do
    for j := 0 to frmMain.DrawGrid.RowCount-1 do
    frmMain.DrawGridDrawCell(frmMain, i, j, frmMain.DrawGrid.CellRect(i,j), []);
end;

procedure TfrmMain.RemoveBricks(cl: TColor; ACol, ARow: Integer);
begin
  // Si la couleur donnée ne correspond pas avec la couleur de la brique
  // Quitter sans rien faire
  
  if ColorOfBrick[ACol, ARow] <> cl then
    exit;
  
  // Suppression de la brique, en rendant sa couleur
  // avec la même que la couleur du mur
  
  ColorOfBrick[ACol, ARow] := WALL_COLOR;
  
  // Maintenant, l'appliquer à ses voisins, récursivement
  // Mais n'oubliez pas que cette cellule peut être une cellule de la frontière,
  // de sorte qu'il mai ont pas de la gauche, à droite, en haut ou en bas des voisins
  
  // voisin de gauche
  
  if ACol > 0 then
    RemoveBricks(cl, ACol-1, ARow);
  
  // Voisin de Droit
  
  if ACol < frmMain.DrawGrid.ColCount-1 then
    RemoveBricks(cl, ACol+1, ARow);
  
  // Voisin de Haut
  
  if ARow > 0 then
    RemoveBricks(cl, ACol, ARow-1);
  
  // Voisin de Bas
  
  if ARow < frmMain.DrawGrid.RowCount-1 then
    RemoveBricks(cl, ACol, ARow+1);
end;

function TfrmMain.IsBrickAlone(ACol, ARow: Integer): Boolean;
begin
  // A l'origine du principe qu'il est seul.
  
  Result := True;
  
  // S'il n'ya pas une brique sur la cellule cliquée,
  // quitter sans rien faire. Cela signifie que
  // une cellule vide sur le mur sera interprétée pour être seul.
  
  if ColorOfBrick[ACol, ARow] = WALL_COLOR then
  begin
    exit;
  end;
  
  
  // Maintenant, vérifier l'ensemble de ses voisins, si au moins l'un d'eux
  // a la même couleur. N'oubliez pas de vérifier si les cellules
  // est une cellule de la frontière ou non. Si il est une frontière de cellules, nous pouvons obtenir
  // une mémoire d'erreur de violation lorsque vous essayez de vérifier l'une de ses inexistante
  // voisins.
  
  // Vérifiez le voisin de gauche
  
  if ACol > 0 then
    if ColorOfBrick[ACol-1, ARow] = ColorOfBrick[ACol, ARow] then
    Result := False;
  
  // Vérifier le voisin droit
  
  if ACol < frmMain.DrawGrid.ColCount-1 then
    if ColorOfBrick[ACol+1, ARow] = ColorOfBrick[ACol, ARow] then
    Result := False;
  
  // Vérifiez le voisin supérieure
  
  if ARow > 0 then
    if ColorOfBrick[ACol, ARow-1] = ColorOfBrick[ACol, ARow] then
    Result := False;
  
  // Vérifier le voisin de Bas
  
  if ARow < frmMain.DrawGrid.RowCount-1 then
    if ColorOfBrick[ACol, ARow+1] = ColorOfBrick[ACol, ARow] then
    Result := False;
end;

procedure TfrmMain.DrawGridSelectCell(Sender: TObject; ACol, ARow: Integer;
var CanSelect: Boolean);
begin
  // Vérifier si la cellule est à elle seule ou non. Si c'est le cas, nous ne ferons rien
  // selon la règle de jeu, mais s'il n'est pas le seul, il faut supprimer
  // cette zone de la paroi. Nous le faisons par le biais de notre procédure récursive
  // supprimer les briques
  
  // Si elle n'est pas seule, éliminer le bloc
  
  if not IsBrickAlone(ACol, ARow) then
  begin
    RemoveBricks(ColorOfBrick[ACol, ARow], ACol, ARow);
    SlideBricksDown;
    SlideBricksSide;
    
    // Redessiner les cellules
    RedrawCells;
  end;
  CheckForWin;
end;

// coulissant briques à combler le vide créé

procedure TfrmMain.SlideBricksDown;
var
  i, j, islider, jbottom, jup, k : Integer;
begin
  for j := 0 to frmMain.DrawGrid.RowCount-1 do
    for i := 0 to frmMain.DrawGrid.ColCount-1 do
    
  if ColorOfBrick[MAX_COLUMNS - 1 - i, MAX_ROWS - 1 - j] = WALL_COLOR then
  begin
    islider:= MAX_COLUMNS - 1 - i; jbottom:= MAX_ROWS - 1 - j;
    jup:= -1; k:=jbottom -1;
    
    while ((jup = -1) and (k > -1)) do
    begin
      
      if ColorOfBrick[islider, k] <> WALL_COLOR then jup:= k;
      
      k:=k - 1;
    end;
    if jup <> -1 then
      while (jup > -1) do
    begin
      ColorOfBrick[islider, jbottom] := ColorOfBrick[islider, jup];
      ColorOfBrick[islider, jup] := WALL_COLOR;
      jbottom := jbottom - 1; jup := jup - 1;
    end;
  end;
end;

// glisser les briques à l'une ou l'autre partie (en nombre de colonnes) pour combler le vide créé colonnes

procedure TfrmMain.SlideBricksSide;
var
  i, j, k, istart, ifinish : Integer;
begin
  
  if leftside = True then
    
  begin
    i:=0;
    
    while (i <= MAX_COLUMNS - 1) do
    begin
      
      if ColorOfBrick[i, MAX_ROWS - 1] = WALL_COLOR then
        while ((i <= MAX_COLUMNS - 1) and (ColorOfBrick[i, MAX_ROWS - 1] = WALL_COLOR)) do i := i + 1;
      
      if i = MAX_COLUMNS then  Exit;
      
      while ((i <= MAX_COLUMNS - 1) and (ColorOfBrick[i, MAX_ROWS - 1] <> WALL_COLOR)) do i := i + 1;
      
      if i = MAX_COLUMNS then  Exit;
      
      istart := i - 1;
      
      while ((i <= MAX_COLUMNS - 1) and (ColorOfBrick[i, MAX_ROWS - 1] = WALL_COLOR)) do i := i + 1;
      
      if i = MAX_COLUMNS then  Exit;
      
      ifinish := i - 1;
      
      // Enfin, le déplacement ...
      
      for j := 0 to MAX_ROWS - 1 do
        for k := 0 to istart do
      begin
        ColorOfBrick[ifinish - k, j] := ColorOfBrick[istart - k, j];
        ColorOfBrick[istart - k, j] := WALL_COLOR;
        Application.ProcessMessages;
      end;
      
      leftside := False;
      
    end;
  end
  
  else
    
  begin
    i:=MAX_COLUMNS - 1;
    
    while (i >= 0) do
    begin
      
      if ColorOfBrick[i, MAX_ROWS - 1] = WALL_COLOR then
        while ((i >= 0) and (ColorOfBrick[i, MAX_ROWS - 1] = WALL_COLOR)) do i := i - 1;
      
      if i = -1 then  Exit;
      
      while ((i >= 0) and (ColorOfBrick[i, MAX_ROWS - 1] <> WALL_COLOR)) do i := i - 1;
      
      if i = -1 then  Exit;
      
      istart := i + 1;
      
      while ((i >= 0) and (ColorOfBrick[i, MAX_ROWS - 1] = WALL_COLOR)) do i := i - 1;
      
      if i = -1 then  Exit;
      
      ifinish := i + 1;
      
      // Enfin, le déplacement ...
      
      for j := 0 to MAX_ROWS - 1 do
        for k := 0 to MAX_COLUMNS - 1 - istart do
      begin
        ColorOfBrick[ifinish + k, j] := ColorOfBrick[istart + k, j];
        ColorOfBrick[istart + k, j] := WALL_COLOR;
        Application.ProcessMessages;
      end;
      
      leftside :=  True;
      
    end;
  end;
end;

//gagner :-) ... ou ... perdre :-(

procedure TfrmMain.CheckForWin;
var
  m, n : Integer;
  checkstate : Boolean;
begin
  
  checkstate := True;
  
  for m := 0 to frmMain.DrawGrid.ColCount-1 do
    if ColorOfBrick[m, MAX_ROWS - 1] <> WALL_COLOR then checkstate := False;
  // a gagné ...
  if checkstate = True then
  begin
    Timer1.Enabled := False;
    // vérifier si il va y avoir les meilleurs scores de la nouvelle entrée ...
    BricksLeft := BricksLeftCounter;
    GameValue := state + statemin*60 + statehrs*3600;
    CheckTopScores(BricksLeft, GameValue);
    
    SpeedButtonNewGame.Click;
    Exit;
  end;
  
  for n := 0 to frmMain.DrawGrid.RowCount-1 do
    for m := 0 to frmMain.DrawGrid.ColCount-1 do
    
  if IsBrickAlone(m, n) = False then Exit;
  
  Application.ProcessMessages;
  // perdu ...
  Timer1.Enabled := False;
  // vérifier si il va y avoir les meilleurs scores de la nouvelle entrée ..
  BricksLeft := BricksLeftCounter;
  GameValue := state + statemin*60 + statehrs*3600;
  CheckTopScores(BricksLeft, GameValue);
  
  SpeedButtonNewGame.Click;
end;

procedure TfrmMain.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
Y: Integer);
begin
  SpeedButtonNewGame.Font.Color := clWindowText;
  SpeedButtonDificulty.Font.Color := clWindowText;
  SpeedButtonTopResults.Font.Color := clWindowText;
  SpeedButtonPause.Font.Color := clWindowText;
  SpeedButtonInfo.Font.Color := clWindowText;
end;

procedure TfrmMain.SpeedButtonNewGameMouseMove(Sender: TObject;
Shift: TShiftState; X, Y: Integer);
begin
  SpeedButtonNewGame.Font.Color := clRed;
end;

procedure TfrmMain.DrawGridMouseMove(Sender: TObject; Shift: TShiftState;
X, Y: Integer);
begin
  SpeedButtonNewGame.Font.Color := clWindowText;
  SpeedButtonDificulty.Font.Color := clWindowText;
  SpeedButtonTopResults.Font.Color := clWindowText;
  SpeedButtonPause.Font.Color := clWindowText;
  SpeedButtonInfo.Font.Color := clWindowText;
end;

procedure TfrmMain.SpeedButtonNewGameClick(Sender: TObject);
begin
  SpeedButtonNewGame.Font.Color := clWindowText;
  
  if finished = False then
  begin
    
    Beep;
    if MessageDlg('Êtes-vous sure de faire un nouveau jeux?',mtConfirmation, [mbYes, mbNo], 0) = mrYes    then
    begin
      
      Timer1.Enabled := False;
      AssignBrickColors;
      RedrawCells;
      state := 0;
      statemin := 0;
      statehrs := 0;
      GameValue := 0;
      BricksLeft := 0;
      Label3.Caption := ' 0 sec';
      Label1.Hide; Label2.Hide;
      Label1.Caption := '';
      Label2.Caption := '';
      Label3.Left := 210;
      Timer1.Enabled := True;
      
    end;
  end
  else
  begin
    Timer1.Enabled := False;
    AssignBrickColors;
    RedrawCells;
    state := 0;
    statemin := 0;
    statehrs := 0;
    GameValue := 0;
    BricksLeft := 0;
    Label3.Caption := ' 0 sec';
    Label1.Hide; Label2.Hide;
    Label1.Caption := '';
    Label2.Caption := '';
    Label3.Left := 210;
    Timer1.Enabled := True;
  end;
  finished := False;
end;

procedure TfrmMain.SpeedButtonDificultyMouseMove(Sender: TObject;
Shift: TShiftState; X, Y: Integer);
begin
  SpeedButtonDificulty.Font.Color := clRed;
end;

procedure TfrmMain.SpeedButtonDificultyClick(Sender: TObject);
var
  fDif : TFormDif;
begin
  fDif := TFormDif.Create(nil);
  try
    SpeedButtonDificulty.Font.Color := clWindowText;
    
    if (fDif.ShowModal = mrOk) then
      
    begin
      Timer1.Enabled := False;
      AssignBrickColors;
      RedrawCells;
      state := 0;
      statemin := 0;
      statehrs := 0;
      GameValue := 0;
      BricksLeft := 0;
      Label3.Caption := ' 0 sec';
      Label1.Hide; Label2.Hide;
      Label1.Caption := '';
      Label2.Caption := '';
      Label3.Left := 210;
      Timer1.Enabled := True;
      finished := False;
    end;
    
  finally
    fDif.Release;
  end;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
  state := state + 1;
  if state = 60 then
  begin
    state := 0; statemin := statemin + 1;
  end;
  if statemin = 60 then
  begin
    statemin := 0; statehrs := statehrs + 1;
  end;
  if statehrs = 24 then
  begin
    statehrs := 0;
    Label1.Hide; Label2.Hide; Label3.Left := 210;
  end;
  
  Label3.Caption := ' ' + IntToStr(state) + ' sec';
  
  if statemin > 0 then
  begin
    Label3.Left := 231;
    Label2.Left :=189;
    Label2.Show;
    Label2.Caption := ' ' + IntToStr(statemin) + ' min';
  end;
  
  if statehrs > 0 then
  begin
    Label3.Left := 252;
    Label2.Left := 210;
    Label1.Left := 189;
    Label1.Show;
    Label1.Caption := IntToStr(statehrs) + ' hrs';
  end;
end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
  if Key = VK_SPACE then
    if Timer1.Enabled = True then
  begin
    Timer1.Enabled := False;
    DrawGrid.Enabled := False;
    DrawGrid.Hide;
    SpeedButtonNewGame.Enabled := False;
    SpeedButtonDificulty.Enabled := False;
    SpeedButtonPause.Caption := 'Continuer';
    pausestate := True;
  end
  else
  begin
    Timer1.Enabled := True;
    DrawGrid.Enabled := True;
    DrawGrid.Show;
    SpeedButtonNewGame.Enabled := True;
    SpeedButtonDificulty.Enabled := True;
    SpeedButtonPause.Caption := 'Pause';
    pausestate := False;
  end;
  
  if Timer1.Enabled = True then
  begin
    if Key = Ord('N') then SpeedButtonNewGame.Click;
    if Key = Ord('D') then SpeedButtonDificulty.Click;
    if Key = Ord('T') then SpeedButtonTopResults.Click;
    if Key = Ord('I') then SpeedButtonInfo.Click;
  end
  
  else
    
  begin
    if Key = Ord('T') then SpeedButtonTopResults.Click;
    if Key = Ord('I') then SpeedButtonInfo.Click;
  end;
end;

procedure TfrmMain.SpeedButtonTopResultsMouseMove(Sender: TObject;
Shift: TShiftState; X, Y: Integer);
begin
  SpeedButtonTopResults.Font.Color := clRed;
end;

procedure TfrmMain.SpeedButtonTopResultsClick(Sender: TObject);
var
  fRes : TfrmRes;
begin
  fRes := TfrmRes.Create(nil);
  try
    SpeedButtonTopResults.Font.Color := clWindowText;
    fRes.ShowModal;
  finally
    fRes.Release;
  end;
end;

function TfrmMain.BricksLeftCounter: Integer;
var
  m, n, counter : Integer;
begin
  counter := 0;
  
  for n := 0 to frmMain.DrawGrid.RowCount-1 do
    for m := 0 to frmMain.DrawGrid.ColCount-1 do
    
  if ColorOfBrick[m, n] <> WALL_COLOR then counter := counter + 1;
  
  Result := counter;
end;

procedure TfrmMain.CheckTopScores(bricks, value: Integer);
var
  SKey : String;
begin
  Reg:=TRegistry.Create;
  try
    //====================== Registre d'entrée de difficulté =====================//
    Reg.RootKey:=HKEY_LOCAL_MACHINE;
    
    Reg.OpenKey('Software\Briques\Dificulte', True);
    
    SKey := Reg.ReadString('Dificulte');
    
    Reg.CloseKey;
    //============================================================================//
    
  finally
    Reg.Free;
  end;
  AnswerToCheckTopScores(SKey, bricks, value);
end;

procedure TfrmMain.AnswerToCheckTopScores(SK: String; bricks, value : Integer);
var
  i, j, bl, v : Integer;
  W : TfrmWinner;
  LW : TfrmLoseWin;
  n, t, te : String;
  fR : TfrmRes;
begin
  Reg:=TRegistry.Create;
  try
    //===================== Entrée de Registre pour les meilleurs scores =========//
    Reg.RootKey:=HKEY_LOCAL_MACHINE;
    
    for i:= 1 to 10 do
      
    begin
      Reg.OpenKey('Software\Briques\Top Scores\' + SK + '\' + IntToStr(i), True);
      
      if Reg.ReadInteger('Briques/Res') = bricks then
      begin
        if Reg.ReadInteger('Value') >= value then
        begin
          Reg.CloseKey;
          TopScoPos := i;
          // message approprié ...
          if bricks = 0 then begin
          W := TfrmWinner.Create(nil);
          try
            W.ShowModal;
          finally
            W.Release;
          end;
        end
        else begin
        LW := TfrmLoseWin.Create(nil);
        try
          LW.ShowModal;
        finally
          LW.Release;
        end;
      end;
      
      if Label2.Caption <> '' then
        if Label1.Caption <> '' then te := Label1.Caption + Label2.Caption + Label3.Caption
      else te := '    ' + Label2.Caption + Label3.Caption
      else te := '        ' + Label3.Caption;
      
      if TopScoPos = 10 then begin
      Reg.OpenKey('Software\Briques\Top Scores\' + SK + '\10' , True);
      
      Reg.WriteInteger('Briques/Res', bricks);
      Reg.WriteString('Nom', TopScoName);
      Reg.WriteString('Temps', te);
      Reg.WriteInteger('Value', value);
      
      Reg.CloseKey;
    end
    
    else
    begin
      for j := 9 downto TopScoPos do
      begin
        Reg.OpenKey('Software\Briques\Top Scores\' + SK + '\' + IntToStr(j), True);
        
        bl := Reg.ReadInteger('Briques/Res');
        n := Reg.ReadString('Nom');
        t := Reg.ReadString('Temps');
        v := Reg.ReadInteger('Value');
        
        Reg.CloseKey;
        
        Reg.OpenKey('Software\Briques\Top Scores\' + SK + '\' + IntToStr(j+1), True);
        
        Reg.WriteInteger('Briques/Res', bl);
        Reg.WriteString('Nom', n);
        Reg.WriteString('Temps', t);
        Reg.WriteInteger('Value', v);
        
        Reg.CloseKey;
      end;
      
      Reg.OpenKey('Software\Briques\Top Scores\' + SK + '\' + IntToStr(TopScoPos), True);
      
      Reg.WriteInteger('Briques/Res', bricks);
      Reg.WriteString('Nom', TopScoName);
      Reg.WriteString('Temps', te);
      Reg.WriteInteger('Value', value);
      
      Reg.CloseKey;
      
    end;
    
    //Afficher les meilleurs scores
    fR := TfrmRes.Create(nil);
    try
      HighlightScore(SK, TopScoPos);
      fR.ShowModal;
    finally
      fR.Release;
    end;
    
    finished := True;
    
    Exit;
  end;
end
else if Reg.ReadInteger('Briques/Res') > bricks then
begin
  Reg.CloseKey;
  TopScoPos := i;
  //message approprié ...
  if bricks = 0 then begin
  W := TfrmWinner.Create(nil);
  try
    W.ShowModal;
  finally
    W.Release;
  end;
end
else begin
LW := TfrmLoseWin.Create(nil);
try
  LW.ShowModal;
finally
  LW.Release;
end;
end;

if Label2.Caption <> '' then
  if Label1.Caption <> '' then te := Label1.Caption + Label2.Caption + Label3.Caption
else te := '    ' + Label2.Caption + Label3.Caption
else te := '        ' + Label3.Caption;

if TopScoPos = 10 then begin
Reg.OpenKey('Software\Briques\Top Scores\' + SK + '\10' , True);

Reg.WriteInteger('Briques/Res', bricks);
Reg.WriteString('Nom', TopScoName);
Reg.WriteString('Temps', te);
Reg.WriteInteger('Value', value);

Reg.CloseKey;
end

else
begin
  for j := 9 downto TopScoPos do
  begin
    Reg.OpenKey('Software\Briques\Top Scores\' + SK + '\' + IntToStr(j), True);
    
    bl := Reg.ReadInteger('Briques/Res');
    n := Reg.ReadString('Nom');
    t := Reg.ReadString('Temps');
    v := Reg.ReadInteger('Value');
    
    Reg.CloseKey;
    
    Reg.OpenKey('Software\Briques\Top Scores\' + SK + '\' + IntToStr(j+1), True);
    
    Reg.WriteInteger('Briques/Res', bl);
    Reg.WriteString('Nom', n);
    Reg.WriteString('Temps', t);
    Reg.WriteInteger('Value', v);
    
    Reg.CloseKey;
  end;
  
  Reg.OpenKey('Software\Briques\Top Scores\' + SK + '\' + IntToStr(TopScoPos), True);
  
  Reg.WriteInteger('Briques/Res', bricks);
  Reg.WriteString('Nom', TopScoName);
  Reg.WriteString('Temps', te);
  Reg.WriteInteger('Value', value);
  
  Reg.CloseKey;
  
end;

//Afficher les meilleurs scores
fR := TfrmRes.Create(nil);
try
  HighlightScore(SK, TopScoPos);
  fR.ShowModal;
finally
  fR.Release;
end;

finished := True;

Exit;
end;
Reg.CloseKey;
end;
if bricks = 0 then begin
MessageBeep(MB_ICONEXCLAMATION);
ShowMessage('Félicitations! Vous avez gagné!' + #13 + 'Mais le temps n''est pas assez bon pour les dix premiers.');
end
else begin       Beep;
ShowMessage('Désolé, vous avez perdu.' + ' Mais, bon ... ne pas abandonner!' + ' Essayez à nouveau!');

end;

finished := True;
//==============================================================================
finally
  Reg.Free;
end;
end;

procedure TfrmMain.SpeedButtonPauseMouseMove(Sender: TObject;
Shift: TShiftState; X, Y: Integer);
begin
  SpeedButtonPause.Font.Color := clRed;
end;

procedure TfrmMain.SpeedButtonInfoMouseMove(Sender: TObject;
Shift: TShiftState; X, Y: Integer);
begin
  SpeedButtonInfo.Font.Color := clRed;
end;

procedure TfrmMain.SpeedButtonPauseClick(Sender: TObject);
begin
  if pausestate = False then
  begin
    Timer1.Enabled := False;
    DrawGrid.Enabled := False;
    DrawGrid.Hide;
    SpeedButtonNewGame.Enabled := False;
    SpeedButtonDificulty.Enabled := False;
    SpeedButtonPause.Caption := '   Continuer           ';
    pausestate := True;
  end
  else
  begin
    Timer1.Enabled := True;
    DrawGrid.Enabled := True;
    DrawGrid.Show;
    SpeedButtonNewGame.Enabled := True;
    SpeedButtonDificulty.Enabled := True;
    SpeedButtonPause.Caption := '   Pause                  ';
    pausestate := False;
  end;
end;

procedure TfrmMain.SpeedButtonInfoClick(Sender: TObject);
var
  fInf : TformInfo;
begin
  fInf := TformInfo.Create(nil);
  try
    SpeedButtonInfo.Font.Color := clWindowText;
    fInf.ShowModal;
  finally
    fInf.Release;
  end;
end;

function TfrmMain.GetResStreamJPG(const ResName: String): TJPEGImage;
var
  Stream:TResourceStream;
begin
  Stream:=TResourceStream.Create(HInstance, ResName, PChar('JPG'));
  Result:=TJPEGImage.Create;
  try
    Result.LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TfrmMain.HighlightScore(sk: String; topscore: Integer);
begin
  if sk = 'Normal' then
    
  begin
    NName[topscore].Font.Color := clRed;
    NBL[topscore].Font.Color := clRed;
    NTime[topscore].Font.Color := clRed;
    NPos[topscore].Font.Color := clRed;
  end
  
  else if sk = 'Difficile' then
    
  begin
    HName[topscore].Font.Color := clRed;
    HBL[topscore].Font.Color := clRed;
    HTime[topscore].Font.Color := clRed;
    HPos[topscore].Font.Color := clRed;
  end
  
  else
  begin
    VHName[topscore].Font.Color := clRed;
    VHBL[topscore].Font.Color := clRed;
    VHTime[topscore].Font.Color := clRed;
    VHPos[topscore].Font.Color := clRed;
  end;
end;

//cette procédure ne fait pas de briques sont enlevés
//lorsque vous faites défiler votre souris vers le bas
procedure TfrmMain.DrawGridMouseWheelDown(Sender: TObject;
Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  Handled := True;
end;

//cette procédure ne fait pas de briques sont enlevés
//lorsque vous faites défiler la molette de la souris
procedure TfrmMain.DrawGridMouseWheelUp(Sender: TObject;
Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  Handled := True;
end;

procedure TfrmMain.BitBtn1Click(Sender: TObject);
begin
 Close;
end;

end.
