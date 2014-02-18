#include <GuiListBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

; Warning this should not be used on items created using built-in functions
; Item data is the ControlID for each string

Example()

Func Example()
	Local $hListBox

	; Create GUI
	GUICreate("List Box Set Item Data", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Add strings
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($hListBox, StringFormat("%03d : Random string", Random(1, 100, 1)))
	Next
	_GUICtrlListBox_EndUpdate($hListBox)

	; Set item data
	_GUICtrlListBox_SetItemData($hListBox, 4, 1234)

	; Get item data
	MsgBox($MB_SYSTEMMODAL, "Information", "Item 5 Data: " & _GUICtrlListBox_GetItemData($hListBox, 4))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
