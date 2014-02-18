#include <GUIConstantsEx.au3>
#include <TreeViewConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("GUI with more treeviews", 340, 200, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_MAXIMIZEBOX, $WS_GROUP, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU))

	Local $iTreeView = GUICtrlCreateTreeView(10, 10, 120, 150)
	Local $iAboutItem = GUICtrlCreateTreeViewItem("About", $iTreeView)
	Local $iGeneralItem = GUICtrlCreateTreeViewItem("General", $iTreeView)
	Local $iToolsItem = GUICtrlCreateTreeViewItem("Tools", $iTreeView)
	Local $iEffectItem = GUICtrlCreateTreeViewItem("Effects", $iGeneralItem)
	Local $iStyleItem = GUICtrlCreateTreeViewItem("Styles", $iGeneralItem)
	GUICtrlCreateTreeViewItem("Commandline", $iToolsItem)
	GUICtrlCreateTreeViewItem("Misc", $iToolsItem)

	Local $iDescriptionGroup = GUICtrlCreateGroup("Description", 140, 105, 180, 55)
	GUICtrlSetState(-1, $GUI_HIDE)

	Local $iEffectsGroup = GUICtrlCreateGroup("Effects", 140, 5, 180, 95)
	GUICtrlSetState(-1, $GUI_HIDE)
	Local $iEffectsTreeView = GUICtrlCreateTreeView(150, 20, 160, 70, BitOR($TVS_CHECKBOXES, $TVS_DISABLEDRAGDROP), $WS_EX_CLIENTEDGE)
	GUICtrlSetState(-1, $GUI_HIDE)
	Local $iEffect1 = GUICtrlCreateTreeViewItem("Effect 1", $iEffectsTreeView)
	GUICtrlCreateTreeViewItem("Effect 2", $iEffectsTreeView)
	Local $iEffect3 = GUICtrlCreateTreeViewItem("Effect 3", $iEffectsTreeView)
	GUICtrlCreateTreeViewItem("Effect 4", $iEffectsTreeView)
	GUICtrlCreateTreeViewItem("Effect 5", $iEffectsTreeView)

	Local $iStylesGroup = GUICtrlCreateGroup("Styles", 140, 5, 180, 95)
	GUICtrlSetState(-1, $GUI_HIDE)
	Local $iStylesTreeView = GUICtrlCreateTreeView(150, 20, 160, 70, BitOR($TVS_CHECKBOXES, $TVS_DISABLEDRAGDROP), $WS_EX_CLIENTEDGE)
	GUICtrlSetState(-1, $GUI_HIDE)
	GUICtrlCreateTreeViewItem("Style 1", $iStylesTreeView)
	GUICtrlCreateTreeViewItem("Style 2", $iStylesTreeView)
	GUICtrlCreateTreeViewItem("Style 3", $iStylesTreeView)
	Local $iStyle4 = GUICtrlCreateTreeViewItem("Style 4", $iStylesTreeView)
	Local $iStyle5 = GUICtrlCreateTreeViewItem("Style 5", $iStylesTreeView)

	Local $iAboutLabel = GUICtrlCreateLabel("This is only a treeview demo.", 160, 80, 160, 20)

	Local $iCancelButton = GUICtrlCreateButton("Cancel", 130, 170, 85, 25)
	GUISetState(@SW_SHOW, $hGUI)

	GUICtrlSetState($iEffect1, $GUI_CHECKED)
	GUICtrlSetState($iEffect3, $GUI_CHECKED)
	GUICtrlSetState($iStyle4, $GUI_CHECKED)
	GUICtrlSetState($iStyle5, $GUI_CHECKED)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $iCancelButton
				ExitLoop

			Case $iAboutItem
				GUICtrlSetState($iDescriptionGroup, $GUI_HIDE)
				GUICtrlSetState($iEffectsTreeView, $GUI_HIDE)
				GUICtrlSetState($iEffectsGroup, $GUI_HIDE)
				GUICtrlSetState($iStylesTreeView, $GUI_HIDE)
				GUICtrlSetState($iStylesGroup, $GUI_HIDE)
				GUICtrlSetState($iAboutLabel, $GUI_SHOW)

			Case $iEffectItem
				GUICtrlSetState($iStylesTreeView, $GUI_HIDE)
				GUICtrlSetState($iStylesGroup, $GUI_HIDE)
				GUICtrlSetState($iAboutLabel, $GUI_HIDE)
				GUICtrlSetState($iEffectsGroup, $GUI_SHOW)
				GUICtrlSetState($iDescriptionGroup, $GUI_SHOW)
				GUICtrlSetState($iEffectsTreeView, $GUI_SHOW)
				GUICtrlSetBkColor($iEffectsTreeView, 0xD0F0F0)

			Case $iStyleItem
				GUICtrlSetState($iEffectsTreeView, $GUI_HIDE)
				GUICtrlSetState($iEffectsGroup, $GUI_HIDE)
				GUICtrlSetState($iAboutLabel, $GUI_HIDE)
				GUICtrlSetState($iStylesGroup, $GUI_SHOW)
				GUICtrlSetState($iDescriptionGroup, $GUI_SHOW)
				GUICtrlSetState($iStylesTreeView, $GUI_SHOW)
				GUICtrlSetColor($iStylesTreeView, 0xD00000)
				GUICtrlSetBkColor($iStylesTreeView, 0xD0FFD0)

		EndSwitch
	WEnd
	GUIDelete($hGUI)
	Exit
EndFunc   ;==>Example
