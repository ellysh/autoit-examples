#include <GUIConstantsEx.au3>
#include <GuiButton.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $rdo, $rdo2, $chk

	GUICreate("Buttons", 400, 400)
	$iMemo = GUICtrlCreateEdit("", 119, 10, 276, 374, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")

	$rdo = GUICtrlCreateRadio("Radio1", 10, 10, 90, 50)
	_GUICtrlButton_SetFocus($rdo)

	$rdo2 = GUICtrlCreateRadio("Radio2", 10, 60, 90, 50)
	_GUICtrlButton_SetCheck($rdo2)

	$chk = GUICtrlCreateCheckbox("Check1", 10, 120, 90, 50, BitOR($BS_AUTO3STATE, $BS_NOTIFY))
	_GUICtrlButton_SetCheck($chk, $BST_INDETERMINATE)

	GUISetState(@SW_SHOW)

	MemoWrite(StringFormat("$rdo focus status.: %s", _GUICtrlButton_GetFocus($rdo)))
	MemoWrite(StringFormat("$rdo2 focus status: %s", _GUICtrlButton_GetFocus($rdo2)))
	MemoWrite(StringFormat("$chk focus status.: %s", _GUICtrlButton_GetFocus($chk)))

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example

; Write a line to the memo control
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
