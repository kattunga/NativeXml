program XmlEditor;

uses
  Forms,
  XmlEditorMain in 'XmlEditorMain.pas' {frmMain},
  sdXmlOutputOptionsDlg in 'sdXmlOutputOptionsDlg.pas' {XmlOutputOptionsDlg},
  NativeXml in '..\..\NativeXml.pas',
  sdStringTable in '..\..\..\general\sdStringTable.pas',
  sdDebug in '..\..\..\general\sdDebug.pas',
  sdStreams in '..\..\..\general\sdStreams.pas',
  sdBufferParser in '..\..\..\general\sdBufferParser.pas',
  sdStringEncoding in '..\..\..\general\sdStringEncoding.pas',
  NativeXmlObjectStorage in '..\..\NativeXmlObjectStorage.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TXmlOutputOptionsDlg, XmlOutputOptionsDlg);
  Application.Run;
end.
