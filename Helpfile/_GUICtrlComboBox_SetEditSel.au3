#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>

Global $iMemo

Example()

Func Example()
	Local $aSel, $hCombo

	; Create GUI
	GUICreate("ComboBox Set Edit Sel", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Add files
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Select Item
	_GUICtrlComboBox_SetCurSel($hCombo, 2)

	; Set Edit Sel
	_GUICtrlComboBox_SetEditSel($hCombo, 0, 4)

	; Get Edit Sel
	$aSel = _GUICtrlComboBox_GetEditSel($hCombo)
	MemoWrite(StringFormat("Edit Sel: %d - %d", $aSel[0], $aSel[1]))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Write a line to the memo control
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
