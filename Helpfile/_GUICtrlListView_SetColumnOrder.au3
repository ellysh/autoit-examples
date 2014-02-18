#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $a_order, $hListView

	GUICreate("ListView Set Column Order", 400, 300)
	$hListView = GUICtrlCreateListView("Column 1|Column 2|Column 3|Column 4", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Set column order
	MsgBox($MB_SYSTEMMODAL, "Information", "Changing column order")
	_GUICtrlListView_SetColumnOrder($hListView, "3|2|0|1")

	; Show column order
	$a_order = _GUICtrlListView_GetColumnOrderArray($hListView)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Column order: [%d, %d, %d, %d]", $a_order[1], $a_order[2], $a_order[3], $a_order[4]))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>Example
