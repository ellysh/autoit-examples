#include <GuiEdit.au3>
#include <GuiStatusBar.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hStatusBar, $hEdit, $hGUI
	Local $sWow64 = ""
	If @AutoItX64 Then $sWow64 = "\Wow6432Node"
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $sWow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\include\_ReadMe_.txt"
	Local $aPartRightSide[4] = [120, 248, 378, -1]

	; Create GUI
	$hGUI = GUICreate("Edit Set Modify", 400, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 394, 268)
	$hStatusBar = _GUICtrlStatusBar_Create($hGUI, $aPartRightSide)
	_GUICtrlStatusBar_SetIcon($hStatusBar, 3, 97, "shell32.dll")
	GUISetState(@SW_SHOW)

	; Set Margins
	_GUICtrlEdit_SetMargins($hEdit, BitOR($EC_LEFTMARGIN, $EC_RIGHTMARGIN), 10, 10)

	; Add Text
	_GUICtrlEdit_SetText($hEdit, FileRead($sFile))
	_GUICtrlEdit_LineScroll($hEdit, 0, _GUICtrlEdit_GetLineCount($hEdit) * -1)

	; Get Modified Flag
	_GUICtrlStatusBar_SetText($hStatusBar, "Modified: " & _GUICtrlEdit_GetModify($hEdit), 2)

	MsgBox($MB_SYSTEMMODAL, "Information", "Set Modify Flag")
	; Set Modified Flag
	_GUICtrlEdit_SetModify($hEdit, True)

	; Get Modified Flag
	_GUICtrlStatusBar_SetText($hStatusBar, "Modified: " & _GUICtrlEdit_GetModify($hEdit), 2)

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
