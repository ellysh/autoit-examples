#include <GuiRichEdit.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Global $hRichEdit

Example()

Func Example()
	Local $hGui, $iMsg
	$hGui = GUICreate("Example (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "This is a test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	GUISetState(@SW_SHOW)

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")
	_GUICtrlRichEdit_SetEventMask($hRichEdit, $ENM_LINK)

	_GUICtrlRichEdit_AutoDetectURL($hRichEdit, True)
	_GUICtrlRichEdit_AppendText($hRichEdit, @CRLF & "http://www.autoitscript.com")
	While True
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				_GUICtrlRichEdit_Destroy($hRichEdit) ; needed unless script crashes
				; GUIDelete() 	; is OK too
				Exit
		EndSelect
	WEnd
EndFunc   ;==>Example

Func WM_NOTIFY($hWnd, $iMsg, $iWparam, $iLparam)
	#forceref $hWnd, $iMsg, $iWparam
	Local $hWndFrom, $iCode, $tNMHDR, $tEnLink, $cpMin, $cpMax, $tMsgFilter
	$tNMHDR = DllStructCreate($tagNMHDR, $iLparam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hRichEdit
			Select
				Case $iCode = $EN_LINK
					$tMsgFilter = DllStructCreate($tagMSGFILTER, $iLparam)
					If DllStructGetData($tMsgFilter, "msg") = $WM_LBUTTONUP Then
						$tEnLink = DllStructCreate($tagENLINK, $iLparam)
						$cpMin = DllStructGetData($tEnLink, "cpMin")
						$cpMax = DllStructGetData($tEnLink, "cpMax")
						MsgBox($MB_SYSTEMMODAL, "", "Invoke your web browser here and point it to " & _
								_GUICtrlRichEdit_GetTextInRange($hRichEdit, $cpMin, $cpMax))
					EndIf
			EndSelect
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY
