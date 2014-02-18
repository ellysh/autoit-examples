#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iIsFloat1 = IsFloat(3.14159) ; Returns 1
	Local $iIsFloat2 = IsFloat(3.000) ; Returns 0 as the value is an integer i.e. 3
	Local $iIsFloat3 = IsFloat(1 / 2 - 5) ; Returns 1
	Local $iIsFloat4 = IsFloat(1.5e3) ; Returns 0 as 1.5e3 is equal to 1500.
	Local $iIsFloat5 = IsFloat("12.345") ; Returns 0 as the value is a string.

	MsgBox($MB_SYSTEMMODAL, "", "IsFloat: " & @CRLF & _
			$iIsFloat1 & @CRLF & $iIsFloat2 & @CRLF & $iIsFloat3 & @CRLF & $iIsFloat4 & @CRLF & $iIsFloat5)
EndFunc   ;==>Example
