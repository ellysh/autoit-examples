#include <GUIConstantsEx.au3>
#include <GuiButton.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $hGUI, $btn, $rdo, $chk

	$hGUI = GUICreate("Buttons", 400, 400)
	$iMemo = GUICtrlCreateEdit("", 119, 10, 276, 374, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")

	$btn = _GUICtrlButton_Create($hGUI, "Button1", 10, 10, 90, 50)

	$rdo = _GUICtrlButton_Create($hGUI, "Radio1", 10, 60, 90, 50, BitOR($BS_AUTORADIOBUTTON, $BS_NOTIFY))

	$chk = _GUICtrlButton_Create($hGUI, "Check1", 10, 120, 90, 50, BitOR($BS_AUTO3STATE, $BS_NOTIFY))

	GUISetState(@SW_SHOW)

	MemoWrite("$btn handle: " & $btn)
	MemoWrite("$rdo handle: " & $rdo)
	MemoWrite("$chk handle: " & $chk & @CRLF)

	MsgBox($MB_SYSTEMMODAL, "Information", "About to Destroy Buttons")

	Send("^{END}")

	MemoWrite("Destroyed $btn: " & _GUICtrlButton_Destroy($btn))
	MemoWrite("Destroyed $rdo: " & _GUICtrlButton_Destroy($rdo))
	MemoWrite("Destroyed $chk: " & _GUICtrlButton_Destroy($chk) & @CRLF)

	MemoWrite("$btn handle: " & $btn)
	MemoWrite("$rdo handle: " & $rdo)
	MemoWrite("$chk handle: " & $chk & @CRLF)

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
