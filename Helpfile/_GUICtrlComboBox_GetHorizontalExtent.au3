#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $hCombo

	; Create GUI
	GUICreate("ComboBox Get Horizontal Extent", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296, BitOR($CBS_SIMPLE, $CBS_DISABLENOSCROLL, $WS_HSCROLL))
	GUISetState(@SW_SHOW)

	; Add files
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Get Horizontal Extent
	MsgBox($MB_SYSTEMMODAL, "Information", "Horizontal Extent: " & _GUICtrlComboBox_GetHorizontalExtent($hCombo))

	; Set Horizontal Extent
	_GUICtrlComboBox_SetHorizontalExtent($hCombo, 500)

	; Get Horizontal Extent
	MsgBox($MB_SYSTEMMODAL, "Information", "Horizontal Extent: " & _GUICtrlComboBox_GetHorizontalExtent($hCombo))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
