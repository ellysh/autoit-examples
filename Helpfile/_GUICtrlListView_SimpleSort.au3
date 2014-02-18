#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GUIListView.au3>

Global $cListView, $fSortSense = False ; Set initial ascending sort

Example()

Func Example()
	GUICreate("SimpleSort", 300, 300)
	$cListView = GUICtrlCreateListView("Item", 10, 10, 280, 240)
	_GUICtrlListView_SetColumnWidth($cListView, 0, 260)
	Local $cButton_Add = GUICtrlCreateButton("Add Item", 10, 260, 80, 30)
	Local $cButton_Set = GUICtrlCreateButton("Reset Ascending Sort Order", 110, 260, 180, 30)

	GUISetState(@SW_SHOW)

	GUIRegisterMsg($WM_NOTIFY, "_WM_NOTIFY")

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $cButton_Add
				Local $sData = Chr(Random(65, 90, 1))
				GUICtrlCreateListViewItem($sData, $cListView)
				_GUICtrlListView_SimpleSort($cListView, $fSortSense, 0, False) ; Prevent sort direction toggling for next insertion
			Case $cButton_Set
				$fSortSense = False ; Reset for ascending sort when next sorted
		EndSwitch
	WEnd
EndFunc   ;==>Example

Func _WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam

	Local $hWndListView = $cListView
	If Not IsHWnd($cListView) Then $hWndListView = GUICtrlGetHandle($cListView)
	Local $tNMHDR = DllStructCreate($tagNMLISTVIEW, $lParam)
	Local $hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	Local $iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hWndListView
			Switch $iCode
				Case $LVN_COLUMNCLICK ; A column was clicked
					_GUICtrlListView_SimpleSort($hWndListView, $fSortSense, DllStructGetData($tNMHDR, "SubItem")) ; Sort direction for next sort toggled by default
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>_WM_NOTIFY
