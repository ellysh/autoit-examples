#include <GUIConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $hMonthCal

	; Create GUI
	GUICreate("Month Calendar Set Unicode Format", 400, 300)
	$hMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, $WS_BORDER, 0x00000000)

	; Create memo control
	$iMemo = GUICtrlCreateEdit("", 4, 168, 392, 128, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Get/Set Unicode setting
	_GUICtrlMonthCal_SetUnicodeFormat($hMonthCal, False)
	MemoWrite("Unicode: " & _GUICtrlMonthCal_GetUnicodeFormat($hMonthCal))
	_GUICtrlMonthCal_SetUnicodeFormat($hMonthCal, True)
	MemoWrite("Unicode: " & _GUICtrlMonthCal_GetUnicodeFormat($hMonthCal))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Write message to memo
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
