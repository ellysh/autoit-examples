#include <MsgBoxConstants.au3>

Local $fBoolean = True
If IsBool($fBoolean) Then
	MsgBox($MB_SYSTEMMODAL, "", "The variable is boolean")
Else
	MsgBox($MB_SYSTEMMODAL, "", "The variable is not boolean")
EndIf
