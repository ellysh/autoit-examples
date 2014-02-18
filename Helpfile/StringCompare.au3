#include <StringConstants.au3>
#include <MsgBoxConstants.au3>

Local $Str1 = "Tiësto"
Local $Str2 = "TIËSTO"

; Compare two strings without using case sensitivity.
Local $iCmp = StringCompare($Str1, $Str2)
MsgBox($MB_SYSTEMMODAL, "", _
		"Comparing '" & $Str1 & "' To '" & $Str2 & "'" & @CRLF & _
		"StringCompare Result (mode 0): " & $iCmp)

; Compare two strings with using case sensitivity.
$iCmp = StringCompare($Str1, $Str2, $STR_CASESENSE)
MsgBox($MB_SYSTEMMODAL, "", _
		"Comparing '" & $Str1 & "' To '" & $Str2 & "'" & @CRLF & _
		"StringCompare Result (mode 1): " & $iCmp)

; Compare two strings without using case sensitivity.
$iCmp = StringCompare($Str1, $Str2, $STR_NOCASESENSEBASIC)
MsgBox($MB_SYSTEMMODAL, "", _
		"Comparing '" & $Str1 & "' To '" & $Str2 & "'" & @CRLF & _
		"StringCompare Result (mode 2): " & $iCmp)
