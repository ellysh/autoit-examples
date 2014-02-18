; right click on gui to bring up context Menu.
; right click on the "ok" button to bring up a controll specific context menu.

#include <GUIConstantsEx.au3>
#include <ButtonConstants.au3>
#include <MsgBoxConstants.au3>


Example()

Func Example()
	GUICreate("My GUI Context Menu", 300, 200)

	Local $contextmenu = GUICtrlCreateContextMenu()

	Local $newsubmenu = GUICtrlCreateMenu("new", $contextmenu)
	GUICtrlCreateMenuItem("text", $newsubmenu)

	Local $button = GUICtrlCreateButton("OK", 100, 100, 70, 20)
	Local $buttoncontext = GUICtrlCreateContextMenu($button)
	Local $MenuAbout = GUICtrlCreateMenuItem("About button", $buttoncontext)

	Local $MenuOpen = GUICtrlCreateMenuItem("Open", $contextmenu)
	Local $MenuSave = GUICtrlCreateMenuItem("Save", $contextmenu)
	GUICtrlCreateMenuItem("", $contextmenu) ; separator

	Local $MenuInfo = GUICtrlCreateMenuItem("Info", $contextmenu)

	GUISetState(@SW_SHOW)

	; Run the GUI until the dialog is closed
	Local $iMsg = 0
	While 1
		$iMsg = GUIGetMsg()

		If $iMsg = $GUI_EVENT_CLOSE Then ExitLoop
		If $iMsg = $MenuAbout Then MsgBox($MB_SYSTEMMODAL, "Menu Selected", 'About')
		If $iMsg = $MenuOpen Then MsgBox($MB_SYSTEMMODAL, "Menu Selected", 'Open')
		If $iMsg = $MenuSave Then MsgBox($MB_SYSTEMMODAL, "Menu Selected", 'Save')
		If $iMsg = $MenuInfo Then MsgBox($MB_SYSTEMMODAL, "Menu Selected", 'Info')
	WEnd
	GUIDelete()
EndFunc   ;==>Example
