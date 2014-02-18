#include <GuiEdit.au3>
#include <GuiStatusBar.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $StatusBar, $hEdit, $hGUI
	Local $aPartRightSide[3] = [190, 378, -1], $aTabStops[3] = [10, 30, 50]

	; Create GUI
	$hGUI = GUICreate("Edit Set Tab Stops", 400, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 394, 268, BitOR($ES_WANTRETURN, $WS_VSCROLL))
	$StatusBar = _GUICtrlStatusBar_Create($hGUI, $aPartRightSide)
	_GUICtrlStatusBar_SetIcon($StatusBar, 2, 97, "shell32.dll")
	GUISetState(@SW_SHOW)

	; Set Margins
	_GUICtrlEdit_SetMargins($hEdit, BitOR($EC_LEFTMARGIN, $EC_RIGHTMARGIN), 10, 10)

	; Set Text
	_GUICtrlEdit_SetText($hEdit, @TAB & "1st" & @TAB & "2nd" & @TAB & "3rd")

	MsgBox($MB_SYSTEMMODAL, "Information", "Set Tab Stops")
	; Set Tab Stops
	_GUICtrlEdit_SetTabStops($hEdit, $aTabStops)

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
