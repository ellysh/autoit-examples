#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iIsInt1 = IsInt(-12345) ; Returns 1
	Local $iIsInt2 = IsInt(3.0000) ; Returns 1
	Local $iIsInt3 = IsInt("5432") ; Returns 0 as the value is a string.
	Local $iIsInt4 = IsInt(7.5 - 4.5) ; Returns 1 since it evaluates to integer 3

	MsgBox($MB_SYSTEMMODAL, "", "IsInt: " & @CRLF & _
			$iIsInt1 & @CRLF & $iIsInt2 & @CRLF & $iIsInt3 & @CRLF & $iIsInt4)
EndFunc   ;==>Example
