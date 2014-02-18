#include <GuiListBox.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $hListBox

	; Create GUI
	GUICreate("List Box Delete String", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)

	GUISetState(@SW_SHOW)

	; Add strings
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($hListBox, StringFormat("%d : List box string", $iI))
	Next
	_GUICtrlListBox_EndUpdate($hListBox)

	; Delete middle string
	_GUICtrlListBox_DeleteString($hListBox, 4)

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
