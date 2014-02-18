#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hwnd = GUICreate("Example", 200, 200)
	Local $tpoint = DllStructCreate("int X;int Y")
	DllStructSetData($tpoint, "X", 641)
	DllStructSetData($tpoint, "Y", 459)
	GUISetState(@SW_SHOW)
	Sleep(1000)
	_WinAPI_ScreenToClient($hwnd, $tpoint)
	MsgBox($MB_SYSTEMMODAL, "_WinAPI_ClientToScreen Example", "Screen Cordinates of 641,459 is x,y position of client: " & @CRLF & _
			"X: " & DllStructGetData($tpoint, "X") & @CRLF & _
			"Y: " & DllStructGetData($tpoint, "Y") & @CRLF)
EndFunc   ;==>Example
