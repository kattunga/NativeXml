unit sdXmlOutputOptionsDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TXmlOutputOptionsDlg = class(TForm)
    GroupBox1: TGroupBox;
    rbStoredEncoding: TRadioButton;
    rbDefaultEncodings: TRadioButton;
    rbCodepage: TRadioButton;
    lbDefaultEncodings: TListBox;
    edCodepage: TEdit;
    btnOK: TButton;
    btnCancel: TButton;
    rgXmlFormat: TRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  XmlOutputOptionsDlg: TXmlOutputOptionsDlg;

implementation

{$R *.dfm}

end.
