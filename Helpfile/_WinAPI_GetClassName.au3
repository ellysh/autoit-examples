#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hwnd
	$hwnd = GUICreate("test")
	MsgBox($MB_SYSTEMMODAL, "Get ClassName", "ClassName of " & $hwnd & ": " & _WinAPI_GetClassName($hwnd))
EndFunc   ;==>Example
