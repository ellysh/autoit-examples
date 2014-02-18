#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>

Global $iMemo

Example()

Func Example()
	Local $hCombo

	; Create GUI
	GUICreate("ComboBox Set Item Height", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Add files
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Get Item Height (selection field)
	MemoWrite("Item Height (selection field): " & _GUICtrlComboBox_GetItemHeight($hCombo))

	; Get Item Height (list items)
	MemoWrite("Item Height (list items): " & _GUICtrlComboBox_GetItemHeight($hCombo, 0))

	; Set Item Height (selection field)
	_GUICtrlComboBox_SetItemHeight($hCombo, 18)

	; Set Item Height (selection field)
	_GUICtrlComboBox_SetItemHeight($hCombo, 20, 0)

	; Get Item Height (selection field)
	MemoWrite("Item Height (selection field): " & _GUICtrlComboBox_GetItemHeight($hCombo))

	; Get Item Height (list items)
	MemoWrite("Item Height (list items): " & _GUICtrlComboBox_GetItemHeight($hCombo, 0))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Write a line to the memo control
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
