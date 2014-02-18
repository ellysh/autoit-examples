#include <GuiListBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $sText, $hListBox

	; Create GUI
	GUICreate("List Box Set Top Index", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Add strings
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 100
		$sText = StringFormat("%03d : Random string ", $iI)
		For $iX = 1 To Random(1, 20, 1)
			$sText &= Chr(Random(65, 90, 1))
		Next
		_GUICtrlListBox_AddString($hListBox, $sText)
	Next
	_GUICtrlListBox_EndUpdate($hListBox)

	; Show top index
	MsgBox($MB_SYSTEMMODAL, "Information", "Top Index: " & _GUICtrlListBox_GetTopIndex($hListBox))

	; Set top index
	_GUICtrlListBox_SetTopIndex($hListBox, 50)

	; Show top index
	MsgBox($MB_SYSTEMMODAL, "Information", "Top Index: " & _GUICtrlListBox_GetTopIndex($hListBox))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
