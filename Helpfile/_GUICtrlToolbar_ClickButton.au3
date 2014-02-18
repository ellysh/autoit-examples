#include <GuiToolbar.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $hToolbar, $iMemo
Global $iItem ; Command identifier of the button associated with the notification.
Global Enum $id_New = 1000, $id_Open, $id_Save, $id_Help

Example()

Func Example()
	Local $hGUI, $aSize, $aStrings[4]

	; Create GUI
	$hGUI = GUICreate("Toolbar", 600, 400)
	$hToolbar = _GUICtrlToolbar_Create($hGUI)
	$aSize = _GUICtrlToolbar_GetMaxSize($hToolbar)

	$iMemo = GUICtrlCreateEdit("", 2, $aSize[1] + 30, 596, 396 - ($aSize[1] + 30), $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)
	GUIRegisterMsg($WM_NOTIFY, "_WM_NOTIFY")

	; Add standard system bitmaps
	_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_LARGE_COLOR)

	; Add strings
	$aStrings[0] = _GUICtrlToolbar_AddString($hToolbar, "&New")
	$aStrings[1] = _GUICtrlToolbar_AddString($hToolbar, "&Open")
	$aStrings[2] = _GUICtrlToolbar_AddString($hToolbar, "&Save")
	$aStrings[3] = _GUICtrlToolbar_AddString($hToolbar, "&Help")

	; Add buttons
	_GUICtrlToolbar_AddButton($hToolbar, $id_New, $STD_FILENEW, $aStrings[0])
	_GUICtrlToolbar_AddButton($hToolbar, $id_Open, $STD_FILEOPEN, $aStrings[1])
	_GUICtrlToolbar_AddButton($hToolbar, $id_Save, $STD_FILESAVE, $aStrings[2])
	_GUICtrlToolbar_AddButtonSep($hToolbar)
	_GUICtrlToolbar_AddButton($hToolbar, $id_Help, $STD_HELP, $aStrings[3])

	; Click Save button using accelerator
	_GUICtrlToolbar_ClickButton($hToolbar, $id_Save, "left", True)

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Write message to memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

; WM_NOTIFY event handler
Func _WM_NOTIFY($hWndGUI, $MsgID, $wParam, $lParam)
	#forceref $hWndGUI, $MsgID, $wParam
	Local $tNMHDR, $hwndFrom, $code, $i_idNew, $dwFlags, $i_idOld
	Local $tNMTBHOTITEM
	$tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	$hwndFrom = DllStructGetData($tNMHDR, "hWndFrom")
	$code = DllStructGetData($tNMHDR, "Code")
	Switch $hwndFrom
		Case $hToolbar
			Switch $code
				Case $NM_LDOWN
					;----------------------------------------------------------------------------------------------
					MemoWrite("$NM_LDOWN: Clicked Item: " & $iItem & " at index: " & _GUICtrlToolbar_CommandToIndex($hToolbar, $iItem))
					;----------------------------------------------------------------------------------------------
				Case $TBN_HOTITEMCHANGE
					$tNMTBHOTITEM = DllStructCreate($tagNMTBHOTITEM, $lParam)
					$i_idOld = DllStructGetData($tNMTBHOTITEM, "idOld")
					$i_idNew = DllStructGetData($tNMTBHOTITEM, "idNew")
					$iItem = $i_idNew
					$dwFlags = DllStructGetData($tNMTBHOTITEM, "dwFlags")
					If BitAND($dwFlags, $HICF_LEAVING) = $HICF_LEAVING Then
						MemoWrite("$HICF_LEAVING: " & $i_idOld)
					Else
						Switch $i_idNew
							Case $id_New
								;----------------------------------------------------------------------------------------------
								MemoWrite("$TBN_HOTITEMCHANGE: $idNew")
								;----------------------------------------------------------------------------------------------
							Case $id_Open
								;----------------------------------------------------------------------------------------------
								MemoWrite("$TBN_HOTITEMCHANGE: $idOpen")
								;----------------------------------------------------------------------------------------------
							Case $id_Save
								;----------------------------------------------------------------------------------------------
								MemoWrite("$TBN_HOTITEMCHANGE: $idSave")
								;----------------------------------------------------------------------------------------------
							Case $id_Help
								;----------------------------------------------------------------------------------------------
								MemoWrite("$TBN_HOTITEMCHANGE: $idHelp")
								;----------------------------------------------------------------------------------------------
						EndSwitch
					EndIf
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>_WM_NOTIFY
