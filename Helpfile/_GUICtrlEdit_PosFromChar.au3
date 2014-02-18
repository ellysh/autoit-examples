#include <GuiEdit.au3>
#include <GuiStatusBar.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hStatusBar, $hEdit, $hGUI, $iIndex
	Local $sWow64 = ""
	If @AutoItX64 Then $sWow64 = "\Wow6432Node"
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $sWow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\include\_ReadMe_.txt"
	Local $aPartRightSide[2] = [80, -1], $aPos

	; Create GUI
	$hGUI = GUICreate("Edit Pos From Char", 400, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 394, 268, BitOR($ES_WANTRETURN, $WS_VSCROLL, $ES_NOHIDESEL))
	$hStatusBar = _GUICtrlStatusBar_Create($hGUI, $aPartRightSide)
	GUISetState(@SW_SHOW)

	; Set Margins
	_GUICtrlEdit_SetMargins($hEdit, BitOR($EC_LEFTMARGIN, $EC_RIGHTMARGIN), 10, 10)

	; Set Text
	_GUICtrlEdit_SetText($hEdit, FileRead($sFile))

	; Pos From Char
	$iIndex = 100
	$aPos = _GUICtrlEdit_PosFromChar($hEdit, $iIndex)
	_GUICtrlEdit_SetSel($hEdit, $iIndex, $iIndex + 1)
	_GUICtrlStatusBar_SetText($hStatusBar, "X = " & $aPos[0])
	_GUICtrlStatusBar_SetText($hStatusBar, "Y = " & $aPos[1], 1)

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
