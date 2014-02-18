#include <GuiEdit.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $hEdit

	; Create GUI
	GUICreate("Edit Append Text", 400, 300)
	$hEdit = GUICtrlCreateEdit("This is a test" & @CRLF & "Another Line", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	_GUICtrlEdit_AppendText($hEdit, @CRLF & "Append to the end?")

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
