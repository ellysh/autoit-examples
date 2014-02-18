#include <GuiListBox.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $hListBox

	; Create GUI
	GUICreate("List Box Click Item_GUICtrlListBox_ClickItem", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Add strings
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($hListBox, StringFormat("%03d : Random string", Random(1, 100, 1)))
	Next
	_GUICtrlListBox_EndUpdate($hListBox)

	; Click an item
	_GUICtrlListBox_ClickItem($hListBox, 4, "left", True)

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
