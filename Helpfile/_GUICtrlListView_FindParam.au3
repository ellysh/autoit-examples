#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

; Warning should not use SetItemParam on items created with GUICtrlCreateListViewItem
; Param is the controlId of the item

Example()

Func Example()
	Global $GUI, $iI, $hListView

	; Create GUI
	$GUI = GUICreate("(UDF Created) ListView Find Param", 400, 300)
	$hListView = _GUICtrlListView_Create($GUI, "", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Add columns
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; Add items
	_GUICtrlListView_BeginUpdate($hListView)
	For $iI = 1 To 100
		_GUICtrlListView_AddItem($hListView, "Item " & $iI)
	Next
	_GUICtrlListView_EndUpdate($hListView)

	; Set item 50 parameter value
	_GUICtrlListView_SetItemParam($hListView, 49, 1234)

	; Search for target item
	$iI = _GUICtrlListView_FindParam($hListView, 1234)
	MsgBox($MB_SYSTEMMODAL, "Information", "Target Item Index: " & $iI)
	_GUICtrlListView_EnsureVisible($hListView, $iI)

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
