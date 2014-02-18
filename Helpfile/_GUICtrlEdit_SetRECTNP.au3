#include <GuiEdit.au3>
#include <GuiStatusBar.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hStatusBar, $hEdit, $hGUI
	Local $sWow64 = ""
	If @AutoItX64 Then $sWow64 = "\Wow6432Node"
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $sWow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\include\_ReadMe_.txt"
	Local $aPartRightSide[6] = [50, 130, 210, 290, 378, -1], $aRect

	; Create GUI
	$hGUI = GUICreate("Edit Set RECTNP", 400, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 394, 268, BitOR($ES_WANTRETURN, $WS_VSCROLL))
	$hStatusBar = _GUICtrlStatusBar_Create($hGUI, $aPartRightSide)
	_GUICtrlStatusBar_SetIcon($hStatusBar, 5, 97, "shell32.dll")
	_GUICtrlStatusBar_SetText($hStatusBar, "Rect")
	GUISetState(@SW_SHOW)

	; Get Rect
	$aRect = _GUICtrlEdit_GetRECT($hEdit)
	$aRect[0] += 10
	$aRect[1] += 10
	$aRect[2] -= 10
	$aRect[3] -= 10

	; Add Text
	_GUICtrlEdit_AppendText($hEdit, FileRead($sFile))
	_GUICtrlEdit_LineScroll($hEdit, 0, _GUICtrlEdit_GetLineCount($hEdit) * -1)

	; Set Rect
	_GUICtrlEdit_SetRECTNP($hEdit, $aRect)

	; Get Rect
	$aRect = _GUICtrlEdit_GetRECT($hEdit)
	_GUICtrlStatusBar_SetText($hStatusBar, "Left: " & $aRect[0], 1)
	_GUICtrlStatusBar_SetText($hStatusBar, "Topt: " & $aRect[1], 2)
	_GUICtrlStatusBar_SetText($hStatusBar, "Right: " & $aRect[2], 3)
	_GUICtrlStatusBar_SetText($hStatusBar, "Bottom: " & $aRect[3], 4)

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
