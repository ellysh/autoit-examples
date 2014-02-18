#include <GuiEdit.au3>
#include <GuiStatusBar.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $hStatusBar, $hEdit, $hGUI
	Local $sWow64 = ""
	If @AutoItX64 Then $sWow64 = "\Wow6432Node"
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $sWow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\include\_ReadMe_.txt"

	; Create GUI
	$hGUI = GUICreate("Edit Get Line Count", 400, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 394, 268)
	$hStatusBar = _GUICtrlStatusBar_Create($hGUI, -1)
	GUISetState(@SW_SHOW)

	_GUICtrlEdit_SetText($hEdit, FileRead($sFile))
	_GUICtrlStatusBar_SetIcon($hStatusBar, 0, 97, "shell32.dll")
	_GUICtrlStatusBar_SetText($hStatusBar, @TAB & "Lines: " & _GUICtrlEdit_GetLineCount($hEdit))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
