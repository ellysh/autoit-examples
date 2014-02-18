#include <GUIConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Global $iMemo

Example()

Func Example()
	; Create GUI
	GUICreate("Month Calendar Get Color", 400, 300)
	Local $hMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, $WS_BORDER, 0x00000000)

	; Create memo control
	$iMemo = GUICtrlCreateEdit("", 4, 188, 392, 108, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Get/Set calendar color
	MemoWrite("Background: 0x" & Hex(_GUICtrlMonthCal_GetColor($hMonthCal, $MCSC_MONTHBK), 6))
	; _GUICtrlMonthCal_SetColor($hMonthCal, $MCSC_MONTHBK, $CLR_MONEYGREEN)
	_GUICtrlMonthCal_SetColor($hMonthCal, $MCSC_TEXT, 0xB02B00)
	_GUICtrlMonthCal_SetColor($hMonthCal, $MCSC_TITLEBK, 0x5EFFFE)
	_GUICtrlMonthCal_SetColor($hMonthCal, $MCSC_TITLETEXT, 0x0000FF)
	_GUICtrlMonthCal_SetColor($hMonthCal, $MCSC_MONTHBK, 0x87C4FF)
	_GUICtrlMonthCal_SetColor($hMonthCal, $MCSC_TRAILINGTEXT, 0x997777)
	MemoWrite("Background: 0x" & Hex(_GUICtrlMonthCal_GetColor($hMonthCal, $MCSC_MONTHBK), 6))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Write message to memo
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
