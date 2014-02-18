#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hListView

	GUICreate("ListView Ensure Visible", 400, 300)
	$hListView = GUICtrlCreateListView("Items", 2, 2, 394, 268)
	_GUICtrlListView_SetColumnWidth($hListView, 0, 100)
	_GUICtrlListView_SetExtendedListViewStyle($hListView, BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT))
	GUISetState(@SW_SHOW)

	_GUICtrlListView_BeginUpdate($hListView)
	For $i = 1 To 100
		GUICtrlCreateListViewItem("Item " & $i, $hListView)
	Next
	_GUICtrlListView_EndUpdate($hListView)

	MsgBox($MB_SYSTEMMODAL, "Information", "Making item 50 visible")
	_GUICtrlListView_EnsureVisible($hListView, 49)

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
