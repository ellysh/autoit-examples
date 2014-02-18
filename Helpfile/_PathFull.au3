#include <File.au3>
#include <MsgBoxConstants.au3>

Local $TestPath = _PathFull(@ScriptDir & "..\..\test")
MsgBox($MB_SYSTEMMODAL, "demo _PathFull", @ScriptDir & @CRLF & $TestPath)
