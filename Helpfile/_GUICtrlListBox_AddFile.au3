#include <GuiListBox.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $hListBox

	; Create GUI
	GUICreate("List Box Add File", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Add file
	_GUICtrlListBox_AddFile($hListBox, @WindowsDir & "\notepad.exe")

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
