#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hwnd = GUICreate("test")
	Local $tPoint = _WinAPI_GetMousePos()
	Local $tPoint2 = _WinAPI_GetMousePos(True, $hwnd)

	MsgBox($MB_SYSTEMMODAL, "Mouse Pos", _
			"X = " & DllStructGetData($tPoint, "X") & @CRLF & "Y = " & DllStructGetData($tPoint, "Y") & @CRLF & @CRLF & _
			"Client" & @CRLF & "X = " & DllStructGetData($tPoint2, "X") & @CRLF & "Y = " & DllStructGetData($tPoint2, "Y"))
EndFunc   ;==>Example
