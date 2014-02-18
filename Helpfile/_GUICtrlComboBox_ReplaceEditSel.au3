#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $hCombo

	; Create GUI
	GUICreate("ComboBox Replace Edit Sel", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Set Edit Text
	_GUICtrlComboBox_SetEditText($hCombo, "Old Edit Text")

	; Add files
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	Sleep(500)

	; Set selected text in edit box
	_GUICtrlComboBox_SetEditSel($hCombo, 0, -1)

	Sleep(500)

	; Replace the text in the edit box
	_GUICtrlComboBox_ReplaceEditSel($hCombo, "New Edit Text")

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
