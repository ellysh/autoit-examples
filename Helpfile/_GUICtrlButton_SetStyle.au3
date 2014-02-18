#include <GUIConstantsEx.au3>
#include <GuiButton.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $btn, $btn2

	GUICreate("Buttons", 400, 400)
	GUISetState(@SW_SHOW)

	$btn = GUICtrlCreateButton("Button1", 10, 10, 90, 50)

	$btn2 = GUICtrlCreateButton("Button2", 10, 70, 90, 50)

	MsgBox($MB_SYSTEMMODAL, "Information", "Setting Button Style")
	_GUICtrlButton_SetStyle($btn, $BS_AUTORADIOBUTTON)
	_GUICtrlButton_SetStyle($btn2, $BS_AUTOCHECKBOX)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example
