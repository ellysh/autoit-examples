#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $bFormat, $hTab

	; Create GUI
	GUICreate("Tab Control Set Unicode Format", 400, 300)
	$hTab = GUICtrlCreateTab(2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Add tabs
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")

	; Get/Set Unicode format
	$bFormat = _GUICtrlTab_GetUnicodeFormat($hTab)
	MsgBox($MB_SYSTEMMODAL, "Information", "Unicode format: " & $bFormat)
	_GUICtrlTab_SetUnicodeFormat($hTab, Not $bFormat)
	MsgBox($MB_SYSTEMMODAL, "Information", "Unicode format: " & _GUICtrlTab_GetUnicodeFormat($hTab))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
