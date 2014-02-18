#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hCombo

	; Create GUI
	GUICreate("ComboBox Get Min Visible", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Add files
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Get Min Visible
	MsgBox($MB_SYSTEMMODAL, "Information", "Min Visible:" & @TAB & _GUICtrlComboBox_GetMinVisible($hCombo), 3)

	; show drop down
	_GUICtrlComboBox_ShowDropDown($hCombo, True)

	Sleep(500)

	; Set Min Visible
	_GUICtrlComboBox_SetMinVisible($hCombo, 50)

	; show drop down
	_GUICtrlComboBox_ShowDropDown($hCombo)

	Sleep(500)

	_GUICtrlComboBox_ShowDropDown($hCombo, True)

	Sleep(500)

	; Get Min Visible
	MsgBox($MB_SYSTEMMODAL, "Information", "Min Visible:" & @TAB & _GUICtrlComboBox_GetMinVisible($hCombo), 3)

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
