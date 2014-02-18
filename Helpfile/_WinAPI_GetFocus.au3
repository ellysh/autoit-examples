#include <WinAPI.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $msg, $btnFocus, $win, $text
	GUICreate("__WinAPI_GetFocus Example", 200, 200)
	$btnFocus = GUICtrlCreateButton("Get Focus", 50, 85, 100, 30)
	GUISetState(@SW_SHOW)
	While 1
		$msg = GUIGetMsg()
		Select
			Case $msg = $GUI_EVENT_CLOSE
				Exit
			Case $msg = $btnFocus
				$win = _WinAPI_GetFocus()
				$text = "Full Title: " & WinGetTitle($win) & @CRLF
				$text &= "Full Text: " & WinGetText($win) & @CRLF
				$text &= "Handle: " & WinGetHandle($win) & @CRLF
				$text &= "Process: " & WinGetProcess($win) & @CRLF
				MsgBox($MB_SYSTEMMODAL, "", $text)
		EndSelect
	WEnd
EndFunc   ;==>Example
