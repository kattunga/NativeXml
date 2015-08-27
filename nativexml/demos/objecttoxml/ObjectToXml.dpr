program ObjectToXml;

uses
  Forms,
  ObjectToXmlMain in 'ObjectToXmlMain.pas' {Form1},
  NativeXmlObjectStorage in '..\..\NativeXmlObjectStorage.pas',
  NativeXml in '..\..\NativeXml.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
