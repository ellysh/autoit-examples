#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hwnd
	$hwnd = GUICreate("test")
	MsgBox($MB_SYSTEMMODAL, "Client", "Client Height: " & _WinAPI_GetClientHeight($hwnd))
EndFunc   ;==>Example
