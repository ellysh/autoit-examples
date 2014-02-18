#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $n, $msg

	GUICreate("My GUI picture", 350, 300, -1, -1, $WS_SIZEBOX + $WS_SYSMENU) ; will create a dialog box that when displayed is centered

	GUISetBkColor(0xE0FFFF)
	$n = GUICtrlCreatePic("..\GUI\mslogo.jpg", 50, 50, 200, 50)

	GUISetState(@SW_SHOW)

	; Loop until the user exits.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd

	; resize the control
	$n = GUICtrlSetPos($n, 50, 50, 200, 100)
	; Loop until the user exits.
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd

	GUIDelete()
EndFunc   ;==>Example
