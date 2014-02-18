#include <GUIConstantsEx.au3>

Example()

Func Example()
	; Create a GUI with various controls.
	Local $hGUI = GUICreate("Example", 300, 200)

	; Create an animation control.
	Local $iAnimation = GUICtrlCreateAvi(@SystemDir & "\shell32.dll", 165, 15, 0, 300)
	Local $iStart = GUICtrlCreateButton("Start", 60, 150, 85, 25)
	Local $iStop = GUICtrlCreateButton("Stop", 160, 150, 85, 25)

	; Display the GUI.
	GUISetState(@SW_SHOW, $hGUI)

	; Loop until the user exits.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

			Case $iStart ; Start the animation.
				GUICtrlSetState($iAnimation, $GUI_AVISTART)

			Case $iStop ; Stop the animation.
				GUICtrlSetState($iAnimation, $GUI_AVISTOP)

		EndSwitch
	WEnd

	; Delete the previous GUI and all controls.
	GUIDelete($hGUI)
EndFunc   ;==>Example
