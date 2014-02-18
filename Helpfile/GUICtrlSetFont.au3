#include <GUIConstantsEx.au3>

Example()

Func Example()
	; Font type to be used for setting the font of the controls.
	Local Const $sFont = "Comic Sans Ms"

	; Create a GUI with various controls.
	Local $hGUI = GUICreate("Example", 300, 200)

	; Create label controls.
	GUICtrlCreateLabel("A string of text underlined", 10, 10, 185, 17)
	GUICtrlSetFont(-1, 9, 400, 4, $sFont) ; Set the font of the previous control.

	Local $iLabel2 = GUICtrlCreateLabel("A string of italic text", 10, 30, 185, 17)
	GUICtrlSetFont($iLabel2, 9, 400, 2, $sFont) ; Set the font of the controlid stored in $iLabel2.

	Local $iLabel3 = GUICtrlCreateLabel("A string of text with a strike through", 10, 50, 290, 17)
	GUICtrlSetFont($iLabel3, 9, 400, 8, $sFont) ; Set the font of the controlid stored in $iLabel3.

	Local $iClose = GUICtrlCreateButton("Close", 210, 170, 85, 25)

	; Display the GUI.
	GUISetState(@SW_SHOW, $hGUI)

	; Loop until the user exits.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $iClose
				ExitLoop

		EndSwitch
	WEnd

	; Delete the previous GUI and all controls.
	GUIDelete($hGUI)
EndFunc   ;==>Example
