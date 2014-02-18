#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $cursor, $text
	$cursor = _WinAPI_GetCursorInfo()
	$text = "Was the operation sucessful? " & $cursor[0] & @CRLF
	$text &= "Is the cursor showing? " & $cursor[1] & @CRLF & @CRLF
	$text &= "Cursor Handle: " & $cursor[2] & @CRLF
	$text &= "X Coordinate: " & $cursor[3] & @CRLF
	$text &= "Y Coordinate: " & $cursor[4]
	MsgBox($MB_SYSTEMMODAL, "_WinAPI_GetCursorInfo Example", $text)
EndFunc   ;==>Example
