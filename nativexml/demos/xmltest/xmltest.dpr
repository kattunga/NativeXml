{ program xmltest - a simple NativeXml tester
}
program xmltest;

{.$define UsePhilo}

uses
  FastMM,
  Forms,
  xmltestmain in 'xmltestmain.pas' {frmMain},
  CodecUtilsWin32 in '..\..\..\..\extlib\philo.de\sources\CodecUtilsWin32.pas',
  EncodingUtils in '..\..\..\..\extlib\philo.de\sources\EncodingUtils.pas',
  sdStreams in '..\..\..\general\sdStreams.pas',
  sdDebug in '..\..\..\general\sdDebug.pas',
  sdStringTable in '..\..\..\general\sdStringTable.pas',
  NativeXml in '..\..\NativeXml.pas',
  NativeXmlOld in '..\..\NativeXmlOld.pas',
  ElAES in '..\..\..\..\extlib\filters\eldos_aes\ElAES.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
