#include <GUIConstantsEx.au3>
#include <Clipboard.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $btn_SetData, $btn_GetData

	; Create GUI
	GUICreate("Clipboard", 600, 450)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	$btn_SetData = GUICtrlCreateButton("Set ClipBoard Data", 150, 410, 120, 30)
	$btn_GetData = GUICtrlCreateButton("Get ClipBoard Data", 300, 410, 120, 30)
	GUISetState(@SW_SHOW)

	; Loop until the user exits.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $btn_SetData
				_ClipBoard_SetData("ClipBoard Library")
			Case $btn_GetData
				MemoWrite(_ClipBoard_GetData())
		EndSwitch
	WEnd
EndFunc   ;==>Example

; Write message to memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
