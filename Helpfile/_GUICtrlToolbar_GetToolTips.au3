#include <GuiToolbar.au3>
#include <GuiToolTip.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Global Enum $id_New = 1000, $id_Open, $id_Save, $id_Help

Example()

Func Example()
	Local $hGUI, $hToolbar, $hToolTip

	; Create GUI
	$hGUI = GUICreate("Toolbar", 400, 300)
	$hToolbar = _GUICtrlToolbar_Create($hGUI)
	GUISetState(@SW_SHOW)

	; Create ToolTip
	$hToolTip = _GUIToolTip_Create($hToolbar)
	_GUICtrlToolbar_SetToolTips($hToolbar, $hToolTip)

	; Add standard system bitmaps
	Switch _GUICtrlToolbar_GetBitmapFlags($hToolbar)
		Case 0
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_SMALL_COLOR)
		Case 2
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_LARGE_COLOR)
	EndSwitch

	; Add buttons
	_GUICtrlToolbar_AddButton($hToolbar, $id_New, $STD_FILENEW)
	_GUICtrlToolbar_AddButton($hToolbar, $id_Open, $STD_FILEOPEN)
	_GUICtrlToolbar_AddButton($hToolbar, $id_Save, $STD_FILESAVE)
	_GUICtrlToolbar_AddButtonSep($hToolbar)
	_GUICtrlToolbar_AddButton($hToolbar, $id_Help, $STD_HELP)

	; Show ToolTip handle
	MsgBox($MB_SYSTEMMODAL, "Information", "ToolTip handle .: 0x" & Hex(_GUICtrlToolbar_GetToolTips($hToolbar)) & @CRLF & _
			"IsPtr = " & IsPtr(_GUICtrlToolbar_GetToolTips($hToolbar)) & " IsHWnd = " & IsHWnd(_GUICtrlToolbar_GetToolTips($hToolbar)))

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Handle WM_NOTIFY messages
Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $iwParam, $ilParam
	Local $tInfo, $iID, $iCode

	$tInfo = DllStructCreate($tagNMTTDISPINFO, $ilParam)
	$iCode = DllStructGetData($tInfo, "Code")
	If $iCode = $TTN_GETDISPINFOW Then
		$iID = DllStructGetData($tInfo, "IDFrom")
		Switch $iID
			Case $id_New
				DllStructSetData($tInfo, "aText", "New")
			Case $id_Open
				DllStructSetData($tInfo, "aText", "Open")
			Case $id_Save
				DllStructSetData($tInfo, "aText", "Save")
			Case $id_Help
				DllStructSetData($tInfo, "aText", "Help")
		EndSwitch
	EndIf
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY
