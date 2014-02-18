#include <GuiMenu.au3>

Example()

Func Example()
	Local $hWnd, $hMain, $tRect

	; Open Notepad
	Run("notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($hWnd)

	; Get File menu rectangle
	$tRect = _GUICtrlMenu_GetItemRectEx($hWnd, $hMain, 0)

	Writeln("File X1: " & DllStructGetData($tRect, "Left"))
	Writeln("File Y1: " & DllStructGetData($tRect, "Top"))
	Writeln("File X2: " & DllStructGetData($tRect, "Right"))
	Writeln("File Y2: " & DllStructGetData($tRect, "Bottom"))
EndFunc   ;==>Example

; Write a line of text to Notepad
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CRLF)
EndFunc   ;==>Writeln
