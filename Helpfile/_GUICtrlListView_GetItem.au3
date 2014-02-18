#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $aItem, $hListView

	GUICreate("ListView Get Item", 400, 300)

	$hListView = GUICtrlCreateListView("Items", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	GUICtrlCreateListViewItem("Row 1", $hListView)
	GUICtrlCreateListViewItem("Row 2", $hListView)
	GUICtrlCreateListViewItem("Row 3", $hListView)

	; Show item 2 text
	$aItem = _GUICtrlListView_GetItem($hListView, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", "Item 2 Text: " & $aItem[3])

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>Example
