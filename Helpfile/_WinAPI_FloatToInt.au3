#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $float, $text, $INT
	$float = 10.55
	$INT = _WinAPI_FloatToInt($float)
	$text = "The float " & $float & " is converted to the Integer " & $INT & " (Hex = " & Hex($INT) & ")"
	MsgBox($MB_SYSTEMMODAL, "_WinAPI_FloatToInt Example Results", $text)
EndFunc   ;==>Example
