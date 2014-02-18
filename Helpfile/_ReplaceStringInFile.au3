#include <File.au3>
#include <MsgBoxConstants.au3>

Local $find = "BEFORE"
Local $replace = "AFTER"

Local $filename = "C:\_ReplaceStringInFile.test"

Local $msg = "Hello Test " & $find & " Hello Test" & @CRLF
$msg &= "Hello Test" & @CRLF
$msg &= @CRLF
$msg &= $find

FileWrite($filename, $msg)

MsgBox($MB_SYSTEMMODAL, "BEFORE", $msg)

Local $retval = _ReplaceStringInFile($filename, $find, $replace)
If $retval = -1 Then
	MsgBox($MB_SYSTEMMODAL, "ERROR", "The pattern could not be replaced in file: " & $filename & " Error: " & @error)
	Exit
Else
	MsgBox($MB_SYSTEMMODAL, "INFO", "Found " & $retval & " occurances of the pattern: " & $find & " in the file: " & $filename)
EndIf

$msg = FileRead($filename, 1000)
MsgBox($MB_SYSTEMMODAL, "AFTER", $msg)
FileDelete($filename)
