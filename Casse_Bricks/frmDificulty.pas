unit frmDificulty;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Registry;
  
type
  TFormDif = class(TForm)
    SpeedButtonOk: TSpeedButton;
    SpeedButtonCancel: TSpeedButton;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    procedure SpeedButtonOkClick(Sender: TObject);
    procedure SpeedButtonCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    private
    { Private declarations }
    public
    { Public declarations }
  end;
  
var
  FormDif: TFormDif;
  RegK:TRegistry;
  
implementation

{$R *.dfm}

procedure TFormDif.SpeedButtonOkClick(Sender: TObject);
begin
  RegK:=TRegistry.Create;
  try
    //=======================Registry Entry For Dificulty=========================//
    RegK.RootKey:=HKEY_LOCAL_MACHINE;
    RegK.OpenKey('Software\Briques\Dificulte', True);
    
    if RadioButton1.Checked = True then
      
    RegK.WriteString('Dificulte', 'Normal')
    
    else if RadioButton2.Checked = True then
      
    RegK.WriteString('Dificulte', 'Difficile')
    
    else
      
    RegK.WriteString('Dificulte', 'TresDifficile');
    
    RegK.CloseKey;
    //==============================================================================
  finally
    RegK.Free;
  end;
  
  ModalResult := mrOk;
end;

procedure TFormDif.SpeedButtonCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFormDif.FormCreate(Sender: TObject);
begin
  RadioButton1.Checked := False;
  RadioButton2.Checked := False;
  RadioButton3.Checked := False;
  
  RegK:=TRegistry.Create;
  try
    //=======================Registry Entry For Dificulty=========================//
    RegK.RootKey:=HKEY_LOCAL_MACHINE;
    RegK.OpenKey('Software\Briques\Dificulte', True);
    
    if (RegK.ReadString('Dificulte') = '') then
      
    begin
      RegK.WriteString('Dificulte', 'Normal');
      RadioButton1.Checked := True;
    end
    
    else if (RegK.ReadString('Dificulte') = 'Normal') then
      
    RadioButton1.Checked := True
    
    else if (RegK.ReadString('Dificulte') = 'Difficile') then
      
    RadioButton2.Checked := True
    
    else
      
    RadioButton3.Checked := True;
    
    RegK.CloseKey;
    //==============================================================================
  finally
    RegK.Free;
  end;
end;

procedure TFormDif.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
  if Key = VK_RETURN then SpeedButtonOk.Click;
end;

end.
