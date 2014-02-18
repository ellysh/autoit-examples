#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>

Example()

Func Example()
	Local $nEdit, $nOk, $nCancel, $msg

	Opt("GUICoordMode", 2)
	GUICreate("My InputBox", 190, 114, -1, -1, $WS_SIZEBOX + $WS_SYSMENU) ; start the definition

	GUISetFont(8, -1, "Arial")

	GUICtrlCreateLabel("Prompt", 8, 7) ; add prompt info
	GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP)

	$nEdit = GUICtrlCreateInput("Default", -1, 3, 175, 20, $ES_PASSWORD) ; add the input area
	GUICtrlSetState($nEdit, $GUI_FOCUS)
	GUICtrlSetResizing($nEdit, $GUI_DOCKBOTTOM + $GUI_DOCKHEIGHT)

	$nOk = GUICtrlCreateButton("OK", -1, 3, 75, 24) ; add the button that will close the GUI
	GUICtrlSetResizing($nOk, $GUI_DOCKBOTTOM + $GUI_DOCKSIZE + $GUI_DOCKHCENTER)

	$nCancel = GUICtrlCreateButton("Annuler", 25, -1) ; add the button that will close the GUI
	GUICtrlSetResizing($nCancel, $GUI_DOCKBOTTOM + $GUI_DOCKSIZE + $GUI_DOCKHCENTER)

	GUISetState(@SW_SHOW) ; to display the GUI

	; Loop until the user exits.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd
EndFunc   ;==>Example
