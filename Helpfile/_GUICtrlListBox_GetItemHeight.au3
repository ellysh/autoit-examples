#include <GuiListBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hListBox

	; Create GUI
	GUICreate("List Box Get Item Height", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Add strings
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($hListBox, StringFormat("%03d : Random string", Random(1, 100, 1)))
	Next
	_GUICtrlListBox_EndUpdate($hListBox)

	; Show item height
	MsgBox($MB_SYSTEMMODAL, "Information", "Item height: " & _GUICtrlListBox_GetItemHeight($hListBox))

	; Set item height
	_GUICtrlListBox_SetItemHeight($hListBox, 26)

	; Show item height
	MsgBox($MB_SYSTEMMODAL, "Information", "Item height: " & _GUICtrlListBox_GetItemHeight($hListBox))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
