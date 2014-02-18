#include <GuiEdit.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hEdit

	; Create GUI
	GUICreate("Edit Get First Visible Line", 400, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	For $x = 0 To 20
		_GUICtrlEdit_AppendText($hEdit, StringFormat("[%02d] Append to the end?", $x) & @CRLF)
	Next

	MsgBox($MB_SYSTEMMODAL, "Information", "First Visible Line: " & _GUICtrlEdit_GetFirstVisibleLine($hEdit))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
