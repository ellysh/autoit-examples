#include <GuiEdit.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hEdit

	; Create GUI
	GUICreate("Edit Get Password Char", 400, 300)
	$hEdit = GUICtrlCreateInput("Test of build-in control", 2, 2, 394, 25, $ES_PASSWORD)
	GUISetState(@SW_SHOW)

	MsgBox($MB_SYSTEMMODAL, "Information", "Password Char: " & _GUICtrlEdit_GetPasswordChar($hEdit))

	_GUICtrlEdit_SetPasswordChar($hEdit, "$") ; change password char to $

	MsgBox($MB_SYSTEMMODAL, "Information", "Password Char: " & _GUICtrlEdit_GetPasswordChar($hEdit))

	_GUICtrlEdit_SetPasswordChar($hEdit) ; display characters typed by the user.

	MsgBox($MB_SYSTEMMODAL, "Information", "Password Char: " & _GUICtrlEdit_GetPasswordChar($hEdit))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
