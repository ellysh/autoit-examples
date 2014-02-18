#include <GuiListBox.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $iIndex, $hListBox

	; Create GUI
	GUICreate("List Box Get Caret Index", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)

	GUISetState(@SW_SHOW)

	; Add strings
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($hListBox, StringFormat("%03d : Random string", Random(1, 100, 1)))
	Next
	_GUICtrlListBox_EndUpdate($hListBox)

	; Set caret index
	_GUICtrlListBox_SetCaretIndex($hListBox, 2)

	; Read caret index
	$iIndex = _GUICtrlListBox_GetCaretIndex($hListBox)
	_GUICtrlListBox_SetCurSel($hListBox, $iIndex)

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
