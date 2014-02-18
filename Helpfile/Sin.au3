#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Assign a Local constant variable the approximate PI number.
	Local Const $PI = 3.141592653589793

	; Assign a Local variable the sine of PI / 4 (equals to Sqrt(2) / 2).
	Local $iSin1 = Sin($PI / 4)

	; Display the result.
	MsgBox($MB_SYSTEMMODAL, "", $iSin1)

	; Assign a Local variable the formula to switch from radian to degree (equals to one degree in radian).
	Local $iDegToRad = $PI / 180

	; Assign a Local variable the sine of 90 degrees (firstly converted to radians).
	Local $iSin2 = Sin(90 * $iDegToRad)

	; Display the result.
	MsgBox($MB_SYSTEMMODAL, "", $iSin2)
EndFunc   ;==>Example
