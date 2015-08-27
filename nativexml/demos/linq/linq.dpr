program linq;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  NativeXml in '..\..\NativeXml.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
