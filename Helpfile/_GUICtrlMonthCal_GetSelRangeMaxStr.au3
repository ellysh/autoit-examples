#include <GUIConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $hMonthCal

	; Create GUI
	GUICreate("Month Calendar Get Sel Range Max String", 400, 300)
	$hMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, BitOR($WS_BORDER, $MCS_MULTISELECT), 0x00000000)

	; Create memo control
	$iMemo = GUICtrlCreateEdit("", 4, 168, 392, 128, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Get/Set selection
	_GUICtrlMonthCal_SetSelRange($hMonthCal, @YEAR, @MON, 1, @YEAR, @MON, 7)
	MemoWrite("Start date: " & _GUICtrlMonthCal_GetSelRangeMinStr($hMonthCal))
	MemoWrite("End date .: " & _GUICtrlMonthCal_GetSelRangeMaxStr($hMonthCal))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Write message to memo
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
