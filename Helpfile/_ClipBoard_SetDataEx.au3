#include <GUIConstantsEx.au3>
#include <Clipboard.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $btn_SetData, $btn_GetData, $hMemory, $hLock, $tData, $sData, $iSize

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
				; Open clipboard
				If _ClipBoard_Open(0) Then

					; Empty clipboard
					If _ClipBoard_Empty() Then

						; Create global memory buffer (show why using _ClipBoard_SetData is MUCH easier!)
						$sData = "Hello from AutoIt"
						$iSize = StringLen($sData) + 1
						$hMemory = _MemGlobalAlloc($iSize, $GHND)
						If $hMemory <> 0 Then
							$hLock = _MemGlobalLock($hMemory)
							If $hLock = 0 Then _WinAPI_ShowError("_Mem_GlobalLock failed")
							$tData = DllStructCreate("char Text[" & $iSize & "]", $hLock)
							DllStructSetData($tData, "Text", $sData)
							_MemGlobalUnlock($hMemory)

							; Write clipboard text
							If Not _ClipBoard_SetDataEx($hMemory, $CF_TEXT) Then _WinAPI_ShowError("_ClipBoard_SetDataEx failed")
						Else
							_WinAPI_ShowError("_Mem_GlobalAlloc failed")
						EndIf

						; Close clipboard
						_ClipBoard_Close()
					Else
						; Close clipboard
						_ClipBoard_Close()
						_WinAPI_ShowError("_ClipBoard_Empty failed")
					EndIf
				Else
					_WinAPI_ShowError("_ClipBoard_Open failed")
				EndIf

			Case $btn_GetData
				MemoWrite(_ClipBoard_GetData())
		EndSwitch
	WEnd
EndFunc   ;==>Example

; Write message to memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
