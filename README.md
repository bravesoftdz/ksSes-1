# code has now been merged into https://github.com/gmurt/ksAws



# ksSes
Delphi interface for the AWS SES e-mail sending service

#### Example use

To return a list of verified senders and populate a listbox...

```
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
  ASes := CreateSes(sesEndpointIreland, C_SES_PUBLIC, C_SES_PRIVATE);
  ASes.GetSenders(lbSenders.Items, True);
end;
 ```
