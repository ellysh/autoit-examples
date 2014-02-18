#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Create a GUI with various controls.
	Local $hGUI = GUICreate("Example", 300, 200)

	; Create a checkbox control.
	Local $iCheckbox = GUICtrlCreateCheckbox("Standard Checkbox", 10, 10, 185, 25)
	Local $iClose = GUICtrlCreateButton("Close", 210, 170, 85, 25)

	; Display the GUI.
	GUISetState(@SW_SHOW, $hGUI)

	; Loop until the user exits.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $iClose
				ExitLoop

			Case $iCheckbox
				If _IsChecked($iCheckbox) Then
					MsgBox($MB_SYSTEMMODAL, "", "The checkbox is checked.", 0, $hGUI)
				Else
					MsgBox($MB_SYSTEMMODAL, "", "The checkbox is not checked.", 0, $hGUI)
				EndIf

		EndSwitch
	WEnd

	; Delete the previous GUI and all controls.
	GUIDelete($hGUI)
EndFunc   ;==>Example

Func _IsChecked($iControlID)
	Return BitAND(GUICtrlRead($iControlID), $GUI_CHECKED) = $GUI_CHECKED
EndFunc   ;==>_IsChecked
