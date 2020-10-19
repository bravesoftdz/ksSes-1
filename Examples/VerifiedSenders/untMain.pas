unit untMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm10 = class(TForm)
    lbSenders: TListBox;
    btnGetVerifiedSenders: TButton;
    procedure btnGetVerifiedSendersClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

uses ksSes;

const
  // replace the following with your SES SMTP credentials which you can
  // create in the SES->SMTP Settings section of the AWS Console.

  C_SES_PUBLIC = '********************';
  C_SES_PRIVATE = '****************************************';

{$R *.dfm}

procedure TForm10.btnGetVerifiedSendersClick(Sender: TObject);
var
  ASes: IksSES;
begin
  if Pos('*', C_SES_PUBLIC) > 0 then
  begin
    ShowMessage('Please replace the C_SES_PUBLIC and C_SES_PRIVATE const in untMain.pas with your SES SMTP credentials.');
    Exit;
  end;
  ASes := CreateSes(sesEndpointIreland, C_SES_PUBLIC, C_SES_PRIVATE);
  ASes.GetSenders(lbSenders.Items, True);
end;


end.
