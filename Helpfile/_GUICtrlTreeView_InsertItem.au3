#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Global $hImage, $hStateImage

Example()

Func Example()
	Local $hItem[10], $hChildItem[30], $iYItem = 0, $iRand, $hInsert, $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS)

	GUICreate("TreeView Insert Item", 400, 300)

	$hTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	For $x = 0 To 9
		$hItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] New Item", $x), $hTreeView)
		For $y = 1 To 3
			$hChildItem[$iYItem] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] New Child", $iYItem), $hItem[$x])
			$iYItem += 1
		Next
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)

	$iRand = Random(0, 9, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Inserted after index %d: %s", $iRand, _GUICtrlTreeView_InsertItem($hTreeView, "Inserted Item", 0, $hItem[$iRand])))

	$iRand = Random(0, 29, 1)
	$hInsert = _GUICtrlTreeView_InsertItem($hTreeView, "Inserted Item", _GUICtrlTreeView_GetParentHandle($hTreeView, $hChildItem[$iRand]), $hChildItem[$iRand])
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Inserted after child index %d: %s", $iRand, $hInsert))

	$hInsert = _GUICtrlTreeView_InsertItem($hTreeView, "Inserted first child Item", _GUICtrlTreeView_GetParentHandle($hTreeView, $hChildItem[$iRand]), $TVI_FIRST)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Inserted child index %d firsts: %s", $iRand, $hInsert))
	_GUICtrlTreeView_SelectItem($hTreeView, $hInsert)

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
