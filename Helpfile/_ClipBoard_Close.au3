#include <GUIConstantsEx.au3>
#include <Clipboard.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $hGUI

	; Create GUI
	$hGUI = GUICreate("Clipboard", 600, 400)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Open the clipboard
	If Not _ClipBoard_Open($hGUI) Then _WinAPI_ShowError("_ClipBoard_Open failed")

	; Show clipboard formats available
	MemoWrite("Clipboard formats ..: " & _ClipBoard_CountFormats())

	; Empty the clipboard
	If Not _ClipBoard_Empty() Then _WinAPI_ShowError("_ClipBoard_Empty failed")

	; Show clipboard formats available
	MemoWrite("Clipboard formats ..: " & _ClipBoard_CountFormats())

	; Close the clipboard
	_ClipBoard_Close()

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Write message to memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
