#include <GUIConstantsEx.au3>
#include <GuiListView.au3>

Example()

Func Example()
	Local $hListView

	GUICreate("ListView Set Item Count", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Add columns
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; Add items
	_GUICtrlListView_SetItemCount($hListView, 100)
	_GUICtrlListView_BeginUpdate($hListView)
	For $x = 1 To 100
		GUICtrlCreateListViewItem("Item " & $x, $hListView)
	Next
	_GUICtrlListView_EndUpdate($hListView)

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
