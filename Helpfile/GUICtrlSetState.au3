#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	; Create a GUI with various controls.
	Local $hGUI = GUICreate("Example", 420, 200, -1, -1, -1, $WS_EX_ACCEPTFILES)

	; Create a label and set the state as drop accepted.
	Local $iLabel = GUICtrlCreateLabel("Drop a file on this label.", 10, 10, 400, 40, $WS_BORDER)
	GUICtrlSetState($iLabel, $GUI_DROPACCEPTED)

	; Create an input and set the state as drop accepted.
	Local $iInput = GUICtrlCreateInput("", 10, 60, 400, 22)
	GUICtrlSetState($iInput, $GUI_DROPACCEPTED)

	Local $iOK = GUICtrlCreateButton("OK", 310, 370, 85, 25)

	; Display the GUI.
	GUISetState(@SW_SHOW, $hGUI)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $iOK
				ExitLoop

			Case $GUI_EVENT_DROPPED
				; If the value of @GUI_DropId is $iLabel, then set the label of the dragged file.
				If @GUI_DropId = $iLabel Then GUICtrlSetData($iLabel, @GUI_DragFile)

		EndSwitch
	WEnd

	; Delete the previous GUI and all controls.
	GUIDelete($hGUI)
EndFunc   ;==>Example
