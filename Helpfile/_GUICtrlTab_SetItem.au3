#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $aItem, $hTab

	; Create GUI
	GUICreate("Tab Control Set Item", 400, 300)
	$hTab = GUICtrlCreateTab(2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Add tabs
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")

	; Get/Set tab 1 parameter
	_GUICtrlTab_SetItem($hTab, 0, -1, -1, -1, 1234)
	$aItem = _GUICtrlTab_GetItem($hTab, 0)
	MsgBox($MB_SYSTEMMODAL, "Information", "Tab 1 parameter: " & $aItem[3])

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
