unit frmWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;
  
type
  TfrmWinner = class(TForm)
    SpeedButtonOk: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButtonOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    private
    { Private declarations }
    public
    { Public declarations }
  end;
  
var
  frmWinner: TfrmWinner;
  
implementation

uses Unit1;
  
{$R *.dfm}

procedure TfrmWinner.FormCreate(Sender: TObject);
begin
  Label3.Caption := 'Votre position dans les dix premiers scores table c''est ' + IntToStr(TopScoPos) + '!';
end;

procedure TfrmWinner.SpeedButtonOkClick(Sender: TObject);
begin
  TopScoName := Edit1.Text;
  ModalResult := mrOk;
end;

procedure TfrmWinner.FormShow(Sender: TObject);
begin
  MessageBeep(MB_ICONEXCLAMATION);
end;

procedure TfrmWinner.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
  if Key = VK_RETURN then SpeedButtonOk.Click;
end;

end.
