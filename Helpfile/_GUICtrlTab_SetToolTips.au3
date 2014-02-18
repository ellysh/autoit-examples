#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <GuiToolTip.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hTool, $hTab

	; Create GUI
	GUICreate("Tab Control Set Tool Tips", 400, 300)
	$hTab = GUICtrlCreateTab(2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Add tabs
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")

	; Get/Set tooltip
	$hTool = _GUIToolTip_Create(GUICtrlGetHandle($hTab))
	_GUICtrlTab_SetToolTips($hTab, $hTool)
	MsgBox($MB_SYSTEMMODAL, "Information", "ToolTip handle: 0x" & _GUICtrlTab_GetToolTips($hTab))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
