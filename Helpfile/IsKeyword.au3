#include <MsgBoxConstants.au3>

Local $sDefault = Default
If IsKeyword($sDefault) Then
	MsgBox($MB_SYSTEMMODAL, "", "The variable is a keyword")
Else
	MsgBox($MB_SYSTEMMODAL, "", "The variable is not a keyword")
EndIf
