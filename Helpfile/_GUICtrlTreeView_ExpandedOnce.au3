#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hItem[5], $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)

	GUICreate("TreeView Expanded Once", 400, 300)

	$hTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	For $x = 0 To 4
		$hItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] New Item", $x), $hTreeView)
		For $y = 0 To 2
			GUICtrlCreateTreeViewItem(StringFormat("[%02d] New Item", $y), $hItem[$x])
		Next
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)

	MsgBox($MB_SYSTEMMODAL, "Information", "Expand item 0")
	_GUICtrlTreeView_Expand($hTreeView, $hItem[0])

	MsgBox($MB_SYSTEMMODAL, "Information", "Collapse item 0")
	_GUICtrlTreeView_Expand($hTreeView, $hItem[0], False)

	MsgBox($MB_SYSTEMMODAL, "Information", "Item 0 expanded at least once? " & _GUICtrlTreeView_ExpandedOnce($hTreeView, $hItem[0]))
	MsgBox($MB_SYSTEMMODAL, "Information", "Item 1 expanded at least once? " & _GUICtrlTreeView_ExpandedOnce($hTreeView, $hItem[1]))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
