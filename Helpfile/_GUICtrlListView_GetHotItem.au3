#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>

Global $hListView, $hStatus

Example()

Func Example()
	Local $hGUI

	$hGUI = GUICreate("ListView Get Hot Item", 392, 322)

	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	$hListView = GUICtrlGetHandle($hListView)
	_GUICtrlListView_SetExtendedListViewStyle($hListView, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_TRACKSELECT))
	$hStatus = _GUICtrlStatusBar_Create($hGUI)
	_GUICtrlStatusBar_SetSimple($hStatus, True)
	GUISetState(@SW_SHOW)

	; Add columns
	_GUICtrlListView_AddColumn($hListView, "Column 1", 100)
	_GUICtrlListView_AddColumn($hListView, "Column 2", 100)
	_GUICtrlListView_AddColumn($hListView, "Column 3", 100)

	; Add items
	_GUICtrlListView_AddItem($hListView, "Row 1: Col 1")
	_GUICtrlListView_AddSubItem($hListView, 0, "Row 1: Col 2", 1)
	_GUICtrlListView_AddSubItem($hListView, 0, "Row 1: Col 3", 2)
	_GUICtrlListView_AddItem($hListView, "Row 2: Col 1")
	_GUICtrlListView_AddSubItem($hListView, 1, "Row 2: Col 2", 1)
	_GUICtrlListView_AddItem($hListView, "Row 3: Col 1")

	;Register WM_NOTIFY  events
	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func ListView_HOTTRACK($iSubItem)
	Local $HotItem = _GUICtrlListView_GetHotItem($hListView)
	If $HotItem <> -1 Then _GUICtrlStatusBar_SetText($hStatus, "Hot Item: " & $HotItem & " SubItem: " & $iSubItem)
EndFunc   ;==>ListView_HOTTRACK

Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $iwParam
	Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR, $hWndListView, $tInfo
	$hWndListView = $hListView
	If Not IsHWnd($hListView) Then $hWndListView = GUICtrlGetHandle($hListView)

	$tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hWndListView
			Switch $iCode
				Case $LVN_COLUMNCLICK ; A column was clicked
					$tInfo = DllStructCreate($tagNMLISTVIEW, $ilParam)
					_DebugPrint("$LVN_COLUMNCLICK" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @CRLF & _
							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @CRLF & _
							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @CRLF & _
							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @CRLF & _
							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @CRLF & _
							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @CRLF & _
							"-->Param:" & @TAB & DllStructGetData($tInfo, "Param"))
					; No return value
				Case $LVN_DELETEITEM ; An item is about to be deleted
					$tInfo = DllStructCreate($tagNMLISTVIEW, $ilParam)
					_DebugPrint("$LVN_DELETEITEM" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @CRLF & _
							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @CRLF & _
							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @CRLF & _
							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @CRLF & _
							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @CRLF & _
							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @CRLF & _
							"-->Param:" & @TAB & DllStructGetData($tInfo, "Param"))
					; No return value
				Case $LVN_HOTTRACK ; Sent by a list-view control when the user moves the mouse over an item
					$tInfo = DllStructCreate($tagNMLISTVIEW, $ilParam)
					ListView_HOTTRACK(DllStructGetData($tInfo, "SubItem"))
					; _DebugPrint("$LVN_HOTTRACK" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
					; "-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
					; "-->Code:" & @TAB & $iCode & @CRLF & _
					; "-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @CRLF & _
					; "-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
					; "-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @CRLF & _
					; "-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @CRLF & _
					; "-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @CRLF & _
					; "-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @CRLF & _
					; "-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @CRLF & _
					; "-->Param:" & @TAB & DllStructGetData($tInfo, "Param"))
					Return 0 ; allow the list view to perform its normal track select processing.
					;Return 1 ; the item will not be selected.
				Case $LVN_KEYDOWN ; A key has been pressed
					$tInfo = DllStructCreate($tagNMLVKEYDOWN, $ilParam)
					_DebugPrint("$LVN_KEYDOWN" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->VKey:" & @TAB & DllStructGetData($tInfo, "VKey") & @CRLF & _
							"-->Flags:" & @TAB & DllStructGetData($tInfo, "Flags"))
					; No return value
				Case $NM_CLICK ; Sent by a list-view control when the user clicks an item with the left mouse button
					$tInfo = DllStructCreate($tagNMITEMACTIVATE, $ilParam)
					_DebugPrint("$NM_CLICK" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->Index:" & @TAB & DllStructGetData($tInfo, "Index") & @CRLF & _
							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @CRLF & _
							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @CRLF & _
							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @CRLF & _
							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @CRLF & _
							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @CRLF & _
							"-->lParam:" & @TAB & DllStructGetData($tInfo, "lParam") & @CRLF & _
							"-->KeyFlags:" & @TAB & DllStructGetData($tInfo, "KeyFlags"))
					; No return value
				Case $NM_DBLCLK ; Sent by a list-view control when the user double-clicks an item with the left mouse button
					$tInfo = DllStructCreate($tagNMITEMACTIVATE, $ilParam)
					_DebugPrint("$NM_DBLCLK" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->Index:" & @TAB & DllStructGetData($tInfo, "Index") & @CRLF & _
							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @CRLF & _
							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @CRLF & _
							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @CRLF & _
							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @CRLF & _
							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @CRLF & _
							"-->lParam:" & @TAB & DllStructGetData($tInfo, "lParam") & @CRLF & _
							"-->KeyFlags:" & @TAB & DllStructGetData($tInfo, "KeyFlags"))
					; No return value
				Case $NM_KILLFOCUS ; The control has lost the input focus
					_DebugPrint("$NM_KILLFOCUS" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; No return value
				Case $NM_RCLICK ; Sent by a list-view control when the user clicks an item with the right mouse button
					$tInfo = DllStructCreate($tagNMITEMACTIVATE, $ilParam)
					_DebugPrint("$NM_RCLICK" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->Index:" & @TAB & DllStructGetData($tInfo, "Index") & @CRLF & _
							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @CRLF & _
							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @CRLF & _
							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @CRLF & _
							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @CRLF & _
							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @CRLF & _
							"-->lParam:" & @TAB & DllStructGetData($tInfo, "lParam") & @CRLF & _
							"-->KeyFlags:" & @TAB & DllStructGetData($tInfo, "KeyFlags"))
					;Return 1 ; not to allow the default processing
					Return 0 ; allow the default processing
				Case $NM_RDBLCLK ; Sent by a list-view control when the user double-clicks an item with the right mouse button
					$tInfo = DllStructCreate($tagNMITEMACTIVATE, $ilParam)
					_DebugPrint("$NM_RDBLCLK" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->Index:" & @TAB & DllStructGetData($tInfo, "Index") & @CRLF & _
							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @CRLF & _
							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @CRLF & _
							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @CRLF & _
							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @CRLF & _
							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @CRLF & _
							"-->lParam:" & @TAB & DllStructGetData($tInfo, "lParam") & @CRLF & _
							"-->KeyFlags:" & @TAB & DllStructGetData($tInfo, "KeyFlags"))
					; No return value
				Case $NM_RETURN ; The control has the input focus and that the user has pressed the ENTER key
					_DebugPrint("$NM_RETURN" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; No return value
				Case $NM_SETFOCUS ; The control has received the input focus
					_DebugPrint("$NM_SETFOCUS" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; No return value
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

Func _DebugPrint($s_text, $line = @ScriptLineNumber)
	ConsoleWrite( _
			"!===========================================================" & @CRLF & _
			"+======================================================" & @CRLF & _
			"-->Line(" & StringFormat("%04d", $line) & "):" & @TAB & $s_text & @CRLF & _
			"+======================================================" & @CRLF)
EndFunc   ;==>_DebugPrint
