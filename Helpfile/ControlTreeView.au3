#include <GUIConstantsEx.au3>
#include <TreeViewConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("ControlTreeView Example", 212, 212)
	Local $iTreeView_1 = GUICtrlCreateTreeView(6, 6, 200, 160, BitOR($TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_CHECKBOXES), $WS_EX_CLIENTEDGE)
	Local $hTreeView_1 = ControlGetHandle($hGUI, "", $iTreeView_1)

	Local $iRoot = GUICtrlCreateTreeViewItem("Root", $iTreeView_1)
	GUICtrlCreateTreeViewItem("Item 1", $iRoot)
	GUICtrlCreateTreeViewItem("Item 2", $iRoot)
	GUICtrlCreateTreeViewItem("Item 3", $iRoot)
	Local $iItem_4 = GUICtrlCreateTreeViewItem("Item 4", $iRoot)
	GUICtrlCreateTreeViewItem("Item 4.1", $iItem_4)
	GUICtrlCreateTreeViewItem("Item 4.2", $iItem_4)
	GUICtrlCreateTreeViewItem("Item 5", $iRoot)

	GUISetState(@SW_SHOW, $hGUI)

	ControlTreeView($hGUI, "", $hTreeView_1, "Expand", "Root")

	ControlTreeView($hGUI, "", $hTreeView_1, "Exists", "Root|Item 4")
	ControlTreeView($hGUI, "", $hTreeView_1, "Check", "Root|Item 4")
	ControlTreeView($hGUI, "", $hTreeView_1, "Select", "Root|Item 4")
	ControlTreeView($hGUI, "", $hTreeView_1, "Expand", "Root|Item 4")

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	GUIDelete($hGUI)
EndFunc   ;==>Example
