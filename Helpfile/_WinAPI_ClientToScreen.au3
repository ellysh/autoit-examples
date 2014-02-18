#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hwnd = GUICreate("Example", 200, 200)
	Local $tpoint = DllStructCreate("int X;int Y")
	DllStructSetData($tpoint, "X", 100)
	DllStructSetData($tpoint, "Y", 160)
	GUISetState(@SW_SHOW)
	Sleep(1000)
	_WinAPI_ClientToScreen($hwnd, $tpoint)
	MsgBox($MB_SYSTEMMODAL, "_WinAPI_ClientToScreen Example", "Screen Cordinates of client's x,y position: 100,160 is: " & @CRLF & _
			"X: " & DllStructGetData($tpoint, "X") & @CRLF & _
			"Y: " & DllStructGetData($tpoint, "Y") & @CRLF)
EndFunc   ;==>Example
