#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hwnd, $tRect
	$hwnd = GUICreate("test")
	$tRect = _WinAPI_GetClientRect($hwnd)
	MsgBox($MB_SYSTEMMODAL, "Rect", _
			"Left..: " & DllStructGetData($tRect, "Left") & @CRLF & _
			"Right.: " & DllStructGetData($tRect, "Right") & @CRLF & _
			"Top...: " & DllStructGetData($tRect, "Top") & @CRLF & _
			"Bottom: " & DllStructGetData($tRect, "Bottom"))
EndFunc   ;==>Example
