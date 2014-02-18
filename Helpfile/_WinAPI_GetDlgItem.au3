#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hwnd, $button
	$hwnd = GUICreate("test")
	$button = GUICtrlCreateButton("button", 0, 0)
	MsgBox($MB_SYSTEMMODAL, "Handle", "Get Dialog Item: " & _WinAPI_GetDlgItem($hwnd, $button))
EndFunc   ;==>Example
