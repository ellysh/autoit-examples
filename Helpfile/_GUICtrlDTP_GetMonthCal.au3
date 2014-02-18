#include <GUIConstantsEx.au3>
#include <GuiDateTimePicker.au3>

Global $iMemo

Example()

Func Example()
	Local $hGui, $hDTP

	; Create GUI
	$hGui = GUICreate("DateTimePick Get Month Calendar Child Handle", 400, 300)
	$hDTP = _GUICtrlDTP_Create($hGui, 2, 6, 190)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Set the display format
	_GUICtrlDTP_SetFormat($hDTP, "ddd MMM dd, yyyy hh:mm ttt")

	; Get month control child handle
	GUICtrlSetData($iMemo, "MonthCal child Handle: " & "0x" & Hex(_GUICtrlDTP_GetMonthCal($hDTP)), 1)
	GUICtrlSetData($iMemo, " IsPtr=" & IsPtr(_GUICtrlDTP_GetMonthCal($hDTP)), 1)
	GUICtrlSetData($iMemo, " IsHWnd=" & IsHWnd(_GUICtrlDTP_GetMonthCal($hDTP)) & @CRLF, 1)

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
