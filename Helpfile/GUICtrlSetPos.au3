#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $iLabel, $msg, $bToggle = False

	GUICreate("My GUI position") ; will create a dialog box that when displayed is centered

	GUISetFont(16)
	$iLabel = GUICtrlCreateLabel("my moving label", 10, 20)

	GUISetState(@SW_SHOW)

	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then Exit
		$bToggle = Not $bToggle
		If $bToggle Then
			GUICtrlSetPos($iLabel, 20, 20)
		Else
			GUICtrlSetPos($iLabel, 20, 30)
		EndIf
		Sleep(60)
	WEnd
EndFunc   ;==>Example
