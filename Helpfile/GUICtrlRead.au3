#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $menu1, $n1, $n2, $msg, $menustate, $menutext

	GUICreate("My GUICtrlRead") ; will create a dialog box that when displayed is centered

	$menu1 = GUICtrlCreateMenu("File")

	$n1 = GUICtrlCreateList("", 10, 10, -1, 100)
	GUICtrlSetData(-1, "item1|item2|item3", "item2")

	$n2 = GUICtrlCreateButton("Read", 10, 110, 50)
	GUICtrlSetState(-1, $GUI_FOCUS) ; the focus is on this button

	GUISetState(@SW_SHOW) ; will display an empty dialog box

	; Loop until the user exits.
	Do
		$msg = GUIGetMsg()
		If $msg = $n2 Then
			MsgBox($MB_SYSTEMMODAL, "Selected listbox entry", GUICtrlRead($n1)) ; display the selected listbox entry
			$menustate = GUICtrlRead($menu1) ; return the state of the menu item
			$menutext = GUICtrlRead($menu1, 1) ; return the text of the menu item
			MsgBox($MB_SYSTEMMODAL, "State and text of the menuitem", "state:" & $menustate & @CRLF & "text:" & $menutext)
		EndIf
	Until $msg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
