unit frmResults;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Registry;
  
type
  TfrmRes = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    Label124: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    Label129: TLabel;
    Label130: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    private
    { Private declarations }
    procedure AssigningLabelsToArrays;
    procedure ShowScores;
    public
    { Public declarations }
  end;
  
var
  frmRes: TfrmRes;
  R:TRegistry;
  NName, NBL, NTime, NPos : Array [1..10] of TLabel;
  HName, HBL, HTime, HPos : Array [1..10] of TLabel;
  VHName, VHBL, VHTime, VHPos : Array [1..10] of TLabel;
  
implementation

{$R *.dfm}

procedure TfrmRes.SpeedButton1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmRes.FormCreate(Sender: TObject);
begin
  //l'attribution des Labels sur les tableaux pour faciliter la manutention (économise beaucoup de temps et de dactylographie)
  AssigningLabelsToArrays;
  
  R := TRegistry.Create;
  try
    
    //==================== Registre d'entrée de difficulté =======================//
    
    R.RootKey:=HKEY_LOCAL_MACHINE;
    
    R.OpenKey('Software\Briques\Dificulte', True);
    
    if (R.ReadString('Dificulte') = 'Normal') then
      
    PageControl1.ActivePage := TabSheet1
    
    else if (R.ReadString('Dificulte') = 'Difficile') then
      
    PageControl1.ActivePage := TabSheet2
    
    else
      
    PageControl1.ActivePage := TabSheet3;
    
    R.CloseKey;
    //============================================================================//
  finally
    R.Free;
  end;
  ShowScores;
end;

procedure TfrmRes.AssigningLabelsToArrays;
begin
  //normal - Nom
  NName[1] := Label15;
  NName[2] := Label16;
  NName[3] := Label17;
  NName[4] := Label18;
  NName[5] := Label19;
  NName[6] := Label20;
  NName[7] := Label21;
  NName[8] := Label22;
  NName[9] := Label23;
  NName[10] := Label24;
  
  //normal - Briques/Res
  NBL[1] := Label25;
  NBL[2] := Label26;
  NBL[3] := Label27;
  NBL[4] := Label28;
  NBL[5] := Label29;
  NBL[6] := Label30;
  NBL[7] := Label31;
  NBL[8] := Label32;
  NBL[9] := Label33;
  NBL[10] := Label34;
  
  // normal - Temps
  NTime[1] := Label35;
  NTime[2] := Label36;
  NTime[3] := Label37;
  NTime[4] := Label38;
  NTime[5] := Label39;
  NTime[6] := Label40;
  NTime[7] := Label41;
  NTime[8] := Label42;
  NTime[9] := Label43;
  NTime[10] := Label44;
  
  // normal - Position
  NPos[1] := Label4;
  NPos[2] := Label5;
  NPos[3] := Label6;
  NPos[4] := Label7;
  NPos[5] := Label8;
  NPos[6] := Label9;
  NPos[7] := Label10;
  NPos[8] := Label11;
  NPos[9] := Label12;
  NPos[10] := Label13;
  
  // Difficile - Nom
  HName[1] := Label68;
  HName[2] := Label67;
  HName[3] := Label66;
  HName[4] := Label65;
  HName[5] := Label64;
  HName[6] := Label63;
  HName[7] := Label62;
  HName[8] := Label61;
  HName[9] := Label60;
  HName[10] := Label59;
  
  // Difficile - Briques/Res
  HBL[1] := Label69;
  HBL[2] := Label70;
  HBL[3] := Label71;
  HBL[4] := Label72;
  HBL[5] := Label73;
  HBL[6] := Label74;
  HBL[7] := Label75;
  HBL[8] := Label76;
  HBL[9] := Label77;
  HBL[10] := Label78;
  
  // Difficile - Temps
  HTime[1] := Label88;
  HTime[2] := Label87;
  HTime[3] := Label86;
  HTime[4] := Label85;
  HTime[5] := Label84;
  HTime[6] := Label83;
  HTime[7] := Label82;
  HTime[8] := Label81;
  HTime[9] := Label80;
  HTime[10] := Label79;
  
  // Difficile - Position
  HPos[1] := Label49;
  HPos[2] := Label50;
  HPos[3] := Label51;
  HPos[4] := Label52;
  HPos[5] := Label53;
  HPos[6] := Label54;
  HPos[7] := Label55;
  HPos[8] := Label56;
  HPos[9] := Label57;
  HPos[10] := Label58;
  
  // Trés Difficile - Nom
  VHName[1] := Label112;
  VHName[2] := Label111;
  VHName[3] := Label110;
  VHName[4] := Label109;
  VHName[5] := Label108;
  VHName[6] := Label107;
  VHName[7] := Label106;
  VHName[8] := Label105;
  VHName[9] := Label104;
  VHName[10] := Label103;
  
  //very hard - Bricks Left
  VHBL[1] := Label113;
  VHBL[2] := Label114;
  VHBL[3] := Label115;
  VHBL[4] := Label116;
  VHBL[5] := Label117;
  VHBL[6] := Label118;
  VHBL[7] := Label119;
  VHBL[8] := Label120;
  VHBL[9] := Label121;
  VHBL[10] := Label122;
  
  //very hard - Time
  VHTime[1] := Label132;
  VHTime[2] := Label131;
  VHTime[3] := Label130;
  VHTime[4] := Label129;
  VHTime[5] := Label128;
  VHTime[6] := Label127;
  VHTime[7] := Label126;
  VHTime[8] := Label125;
  VHTime[9] := Label124;
  VHTime[10] := Label123;
  
  //very hard - Position
  VHPos[1] := Label93;
  VHPos[2] := Label94;
  VHPos[3] := Label95;
  VHPos[4] := Label96;
  VHPos[5] := Label97;
  VHPos[6] := Label98;
  VHPos[7] := Label99;
  VHPos[8] := Label100;
  VHPos[9] := Label101;
  VHPos[10] := Label102;
end;

procedure TfrmRes.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
  if Key = VK_RETURN then SpeedButton1.Click;
end;

procedure TfrmRes.SpeedButton2Click(Sender: TObject);
var
  i : Integer;
begin
  MessageBeep(MB_ICONEXCLAMATION);
  
  if MessageDlg('Vous perdrez tous les résultats obtenus jusqu''à présent!'
  + #13 + 'Êtes-vous sûr de vouloir faire les scores à zéro?',
  mtWarning, [mbYes, mbNo], 0) = mrYes
  then
    
  begin
    
    R := TRegistry.Create;
    try
      //================ Entrée de Registre pour les meilleurs scores ==============//
      R.RootKey:=HKEY_LOCAL_MACHINE;
      
      for i:= 1 to 10 do
        
      begin
        R.OpenKey('Software\Briques\Top Scores\Normal' + '\' + IntToStr(i), True);
        
        R.WriteInteger('Value', 90060);
        R.WriteInteger('Briques/Res', 400);
        R.WriteString('Temps', '');
        R.WriteString('Nom', '');
        
        R.CloseKey;
      end;
      //============================================================================//
    finally
      R.Free;
    end;
    ShowScores;
  end;
end;

procedure TfrmRes.ShowScores;
var
  i : Integer;
begin
  R := TRegistry.Create;
  try
    //=============== Entrée de Registre pour les meilleurs scores ===============//
    R.RootKey:=HKEY_LOCAL_MACHINE;
    
    for i:= 1 to 10 do
      
    begin
      R.OpenKey('Software\Briques\Top Scores\Normal' + '\' + IntToStr(i), True);
      
      if R.ReadString('Temps') = '' then
      begin
        NName[i].Caption := '                 --         ';
        NBL[i].Caption := ' -- ';
        NTime[i].Caption := '                --                ';
      end
      else
      begin
        NName[i].Caption := R.ReadString('Nom');
        NBL[i].Caption := IntToStr(R.ReadInteger('Briques/Res'));
        NTime[i].Caption := R.ReadString('Temps');
      end;
      R.CloseKey;
    end;
    
    for i:= 1 to 10 do
      
    begin
      R.OpenKey('Software\Briques\Top Scores\Difficile' + '\' + IntToStr(i), True);
      
      if R.ReadString('Temps') = '' then
      begin
        HName[i].Caption := '                 --         ';
        HBL[i].Caption := ' -- ';
        HTime[i].Caption := '                --                ';
      end
      else
      begin
        HName[i].Caption := R.ReadString('Nom');
        HBL[i].Caption := IntToStr(R.ReadInteger('Briques/Res'));
        HTime[i].Caption := R.ReadString('Temps');
      end;
      R.CloseKey;
    end;
    
    for i:= 1 to 10 do
      
    begin
      R.OpenKey('Software\Briques\Top Scores\TresDifficile' + '\' + IntToStr(i), True);
      
      if R.ReadString('Temps') = '' then
      begin
        VHName[i].Caption := '                 --         ';
        VHBL[i].Caption := ' -- ';
        VHTime[i].Caption := '                --                ';
      end
      else
      begin
        VHName[i].Caption := R.ReadString('Nom');
        VHBL[i].Caption := IntToStr(R.ReadInteger('Briques/Res'));
        VHTime[i].Caption := R.ReadString('Temps');
      end;
      R.CloseKey;
    end;
    //============================================================================//
  finally
    R.Free;
  end;
end;

procedure TfrmRes.SpeedButton5Click(Sender: TObject);
var
  i : Integer;
begin
  MessageBeep(MB_ICONEXCLAMATION);
  
  if MessageDlg('Vous perdrez tous les résultats obtenus jusqu''à présent!'
  + #13 + 'Êtes-vous sûr de vouloir faire les scores à zéro?',
  mtWarning, [mbYes, mbNo], 0) = mrYes
  then
    
  begin
    
    R := TRegistry.Create;
    try
      //============== Entrée de Registre pour les meilleurs scores ================//
      R.RootKey:=HKEY_LOCAL_MACHINE;
      
      for i:= 1 to 10 do
        
      begin
        R.OpenKey('Software\Briques\Top Scores\Difficile' + '\' + IntToStr(i), True);
        
        R.WriteInteger('Value', 90060);
        R.WriteInteger('Briques/Res', 400);
        R.WriteString('Temps', '');
        R.WriteString('Nom', '');
        
        R.CloseKey;
      end;
      //==============================================================================
    finally
      R.Free;
    end;
    ShowScores;
  end;
end;

procedure TfrmRes.SpeedButton8Click(Sender: TObject);
var
  i : Integer;
begin
  MessageBeep(MB_ICONEXCLAMATION);
  
  if MessageDlg('Vous perdrez tous les résultats obtenus jusqu''à présent!'
  + #13 + 'Êtes-vous sûr de vouloir faire les scores à zéro?',
  mtWarning, [mbYes, mbNo], 0) = mrYes
  then
    
  begin
    
    R := TRegistry.Create;
    try
      //============== Entrée de Registre pour les meilleurs scores ================//
      R.RootKey:=HKEY_LOCAL_MACHINE;
      
      for i:= 1 to 10 do
        
      begin
        R.OpenKey('Software\Briques\Top Scores\TresDifficile' + '\' + IntToStr(i), True);
        
        R.WriteInteger('Value', 90060);
        R.WriteInteger('Briques/Res', 400);
        R.WriteString('Temps', '');
        R.WriteString('Nom', '');
        
        R.CloseKey;
      end;
      //==============================================================================
    finally
      R.Free;
    end;
    ShowScores;
  end;
end;

procedure TfrmRes.SpeedButton3Click(Sender: TObject);
var
  i : Integer;
begin
  MessageBeep(MB_ICONEXCLAMATION);
  
  if MessageDlg('Vous perdrez tous les résultats obtenus jusqu''à présent!'
  + #13 + 'Êtes-vous sûr de vouloir faire les scores à zéro?',
  mtWarning, [mbYes, mbNo], 0) = mrYes
  then
    
  begin
    
    R := TRegistry.Create;
    try
      //================= Entrée de Registre pour les meilleurs scores =============//
      R.RootKey:=HKEY_LOCAL_MACHINE;
      
      for i:= 1 to 10 do
        
      begin
        R.OpenKey('Software\Briques\Top Scores\Normal' + '\' + IntToStr(i), True);
        
        R.WriteInteger('Value', 90060);
        R.WriteInteger('Briques/Res', 400);
        R.WriteString('Temps', '');
        R.WriteString('Nom', '');
        
        R.CloseKey;
      end;
      
      for i:= 1 to 10 do
        
      begin
        R.OpenKey('Software\Briques\Top Scores\Difficile' + '\' + IntToStr(i), True);
        
        R.WriteInteger('Value', 90060);
        R.WriteInteger('Briques/Res', 400);
        R.WriteString('Temps', '');
        R.WriteString('Nom', '');
        
        R.CloseKey;
      end;
      
      for i:= 1 to 10 do
        
      begin
        R.OpenKey('Software\Briques\Top Scores\TresDifficile' + '\' + IntToStr(i), True);
        
        R.WriteInteger('Value', 90060);
        R.WriteInteger('Briques/Res', 400);
        R.WriteString('Temps', '');
        R.WriteString('Nom', '');
        
        R.CloseKey;
      end;
      //============================================================================//
    finally
      R.Free;
    end;
    ShowScores;
  end;
end;

end.
