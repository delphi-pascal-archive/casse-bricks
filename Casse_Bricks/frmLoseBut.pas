unit frmLoseBut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;
  
type
  TfrmLoseWin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    private
    { Private declarations }
    public
    { Public declarations }
  end;
  
var
  frmLoseWin: TfrmLoseWin;
  
implementation

uses Unit1;
  
{$R *.dfm}

procedure TfrmLoseWin.FormCreate(Sender: TObject);
begin
  Label3.Caption := 'Votre position dans les dix premiers scores table c''est ' + IntToStr(TopScoPos) + '!';
end;

procedure TfrmLoseWin.SpeedButton1Click(Sender: TObject);
begin
  TopScoName := Edit1.Text;
  ModalResult := mrOk;
end;

procedure TfrmLoseWin.FormShow(Sender: TObject);
begin
  MessageBeep(MB_ICONEXCLAMATION);
end;

procedure TfrmLoseWin.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
  if Key = VK_RETURN then SpeedButton1.Click;
end;

end.
