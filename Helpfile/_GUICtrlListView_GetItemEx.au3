#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $tItem, $hListView

	GUICreate("ListView Get ItemEX", 400, 300)

	$hListView = GUICtrlCreateListView("Items", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	GUICtrlCreateListViewItem("Item 1", $hListView)
	GUICtrlCreateListViewItem("Item 2", $hListView)
	GUICtrlCreateListViewItem("Item 3", $hListView)

	; Show item 1 raw state
	$tItem = DllStructCreate($tagLVITEM)
	DllStructSetData($tItem, "Mask", $LVIF_STATE)
	DllStructSetData($tItem, "Item", 1)
	DllStructSetData($tItem, "StateMask", -1)
	_GUICtrlListView_GetItemEx($hListView, $tItem)
	MsgBox($MB_SYSTEMMODAL, "Information", "Item 2 State: " & DllStructGetData($tItem, "State"))

	; Select item 2
	_GUICtrlListView_SetItemSelected($hListView, 1)

	; Show item 1 raw state
	_GUICtrlListView_GetItemEx($hListView, $tItem)
	MsgBox($MB_SYSTEMMODAL, "Information", "Item 2 State: " & DllStructGetData($tItem, "State"))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
