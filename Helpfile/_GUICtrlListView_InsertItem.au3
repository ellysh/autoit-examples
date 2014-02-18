#include <GUIConstantsEx.au3>
#include <GuiListView.au3>

Example()

Func Example()
	Local $hListView

	GUICreate("ListView Insert Item", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Insert columns
	_GUICtrlListView_InsertColumn($hListView, 0, "Column 1", 100)

	; Add items
	_GUICtrlListView_InsertItem($hListView, "Item 1", 0)
	_GUICtrlListView_InsertItem($hListView, "Item 2", 1)
	_GUICtrlListView_InsertItem($hListView, "Item 3", 1)

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
