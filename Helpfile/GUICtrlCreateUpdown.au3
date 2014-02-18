#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $input, $msg

	GUICreate("My GUI UpDown", -1, -1, -1, -1, $WS_SIZEBOX)

	$input = GUICtrlCreateInput("2", 10, 10, 50, 20)
	GUICtrlCreateUpdown($input)

	; Attempt to resize input control
	GUICtrlSetPos($input, 10, 10, 100, 40)

	GUISetState(@SW_SHOW)

	; Run the GUI until the dialog is closed
	While 1
		$msg = GUIGetMsg()

		Switch $msg
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	MsgBox($MB_SYSTEMMODAL, "Updown", GUICtrlRead($input))
EndFunc   ;==>Example
