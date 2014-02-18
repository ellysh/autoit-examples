#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $button
	GUICreate("test")
	$button = GUICtrlCreateButton("testing", 0, 0)
	MsgBox($MB_SYSTEMMODAL, "ID", "Dialog Control ID: " & _WinAPI_GetDlgCtrlID(GUICtrlGetHandle($button)))
EndFunc   ;==>Example
