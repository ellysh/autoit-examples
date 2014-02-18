; A simple custom messagebox that uses the MessageLoop mode

#include <GUIConstantsEx.au3>
#include <Constants.au3>

_Main()

Func _Main()
	Local $YesID, $NoID, $ExitID, $msg

	GUICreate("Custom MsgBox", 210, 80)

	GUICtrlCreateLabel("Please click a button!", 10, 10)
	$YesID = GUICtrlCreateButton("Yes", 10, 50, 50, 20)
	$NoID = GUICtrlCreateButton("No", 80, 50, 50, 20)
	$ExitID = GUICtrlCreateButton("Exit", 150, 50, 50, 20)

	GUISetState() ; display the GUI

	Do
		$msg = GUIGetMsg()

		Select
			Case $msg = $YesID
				MsgBox($MB_SYSTEMMODAL, "You clicked on", "Yes")
			Case $msg = $NoID
				MsgBox($MB_SYSTEMMODAL, "You clicked on", "No")
			Case $msg = $ExitID
				MsgBox($MB_SYSTEMMODAL, "You clicked on", "Exit")
			Case $msg = $GUI_EVENT_CLOSE
				MsgBox($MB_SYSTEMMODAL, "You clicked on", "Close")
		EndSelect
	Until $msg = $GUI_EVENT_CLOSE Or $msg = $ExitID
EndFunc   ;==>_Main
