#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $win = _WinAPI_GetDesktopWindow()
	MsgBox($MB_SYSTEMMODAL, "", WinGetTitle($win))
	MsgBox($MB_SYSTEMMODAL, "", $win)
EndFunc   ;==>Example
