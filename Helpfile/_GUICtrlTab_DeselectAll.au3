#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hTab

	; Create GUI
	GUICreate("Tab Control Deselect All", 400, 300)
	$hTab = GUICtrlCreateTab(2, 2, 396, 296, $TCS_BUTTONS)
	GUISetState(@SW_SHOW)

	; Add tabs
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")

	; Select 2nd Tab Item
	_GUICtrlTab_SetCurSel($hTab, 1)

	; Reset tab selection
	MsgBox($MB_SYSTEMMODAL, "Information", "Resetting tab selection")
	_GUICtrlTab_DeselectAll($hTab, False)

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
