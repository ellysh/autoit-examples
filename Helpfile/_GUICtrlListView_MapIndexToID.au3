#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iID, $hListView

	GUICreate("ListView Map Index  To ID", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Add column
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; Add items
	_GUICtrlListView_AddItem($hListView, "Item 1")
	_GUICtrlListView_AddItem($hListView, "Item 2")
	_GUICtrlListView_AddItem($hListView, "Item 3")

	; Show ID for item 2
	$iID = _GUICtrlListView_MapIndexToID($hListView, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", "Index to ID: " & $iID)
	MsgBox($MB_SYSTEMMODAL, "Information", "ID to Index: " & _GUICtrlListView_MapIDToIndex($hListView, $iID))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
