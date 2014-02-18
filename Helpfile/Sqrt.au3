#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Assign a Local variable the square-root of 2.
	Local $iSqrt1 = Sqrt(2)

	; Display the result.
	MsgBox($MB_SYSTEMMODAL, "", $iSqrt1)

	; Assign a Local variable the square-root of 9.
	Local $iSqrt2 = Sqrt(9)

	; Display the result.
	MsgBox($MB_SYSTEMMODAL, "", $iSqrt2)
EndFunc   ;==>Example
