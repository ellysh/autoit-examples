#NoTrayIcon
#include <MsgBoxConstants.au3>

Opt("TrayMenuMode", 3) ; The default tray menu items will not be shown and items are not checked when selected. These are options 1 and 2 for TrayMenuMode.

Global Const $MIM_APPLYTOSUBMENUS = 0x80000000, $MIM_BACKGROUND = 0x00000002 ; Constants required for SetMenuColor

Example()

Func Example()
	Local $iSettings = TrayCreateMenu("Settings") ; Create a tray menu sub menu with two sub items.
	Local $iDisplay = TrayCreateItem("Display", $iSettings)
	Local $iPrinter = TrayCreateItem("Printer", $iSettings)
	TrayCreateItem("") ; Create a separator line.

	Local $iAbout = TrayCreateItem("About")
	TrayCreateItem("") ; Create a separator line.

	Local $iExit = TrayCreateItem("Exit")

	TraySetState(1) ; Show the tray menu.

	SetMenuColor(0, 0xEEBB99) ; BGR color value, '0' refers to the tray menu itself.
	SetMenuColor($iSettings, 0x66BB99); BGR color value for the 'Settings' menu.

	While 1
		Switch TrayGetMsg()
			Case $iAbout ; Display a message box about the AutoIt version and installation path of the AutoIt executable.
				MsgBox($MB_SYSTEMMODAL, "", "AutoIt tray menu example." & @CRLF & @CRLF & _
						"Version: " & @AutoItVersion & @CRLF & _
						"Install Path: " & StringLeft(@AutoItExe, StringInStr(@AutoItExe, "\", 0, -1) - 1)) ; Find the folder of a full path.

			Case $iDisplay, $iPrinter
				MsgBox($MB_SYSTEMMODAL, "", "A sub menu item was selected from the tray menu.")

			Case $iExit ; Exit the loop.
				ExitLoop
		EndSwitch
	WEnd
EndFunc   ;==>Example

Func SetMenuColor($iMenuID, $iColor)
	Local $hMenu = TrayItemGetHandle($iMenuID) ; Get the internal menu handle

	Local $hBrush = DllCall("gdi32.dll", "hwnd", "CreateSolidBrush", "int", $iColor)
	$hBrush = $hBrush[0]

	Local $tMenuInfo = DllStructCreate("dword;dword;dword;uint;ptr;dword;ptr")
	DllStructSetData($tMenuInfo, 1, DllStructGetSize($tMenuInfo))
	DllStructSetData($tMenuInfo, 2, BitOR($MIM_APPLYTOSUBMENUS, $MIM_BACKGROUND))
	DllStructSetData($tMenuInfo, 5, $hBrush)

	DllCall("user32.dll", "int", "SetMenuInfo", "hwnd", $hMenu, "ptr", DllStructGetPtr($tMenuInfo))
EndFunc   ;==>SetMenuColor
