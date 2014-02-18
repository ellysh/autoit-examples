#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iX, $iY, $hListView

	GUICreate("ListView Get Item Spacing X", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Add columns
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; Add items
	_GUICtrlListView_AddItem($hListView, "Item 1")
	_GUICtrlListView_AddItem($hListView, "Item 2")
	_GUICtrlListView_AddItem($hListView, "Item 3")

	; Show item spacing
	$iX = _GUICtrlListView_GetItemSpacingX($hListView)
	$iY = _GUICtrlListView_GetItemSpacingY($hListView)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Item Spacing: X=%d, Y=%d", $iX, $iY))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
