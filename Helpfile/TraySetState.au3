#NoTrayIcon
#include <MsgBoxConstants.au3>

Opt("TrayMenuMode", 3) ; The default tray menu items will not be shown and items are not checked when selected. These are options 1 and 2 for TrayMenuMode.

Example()

Func Example()
	Local $iFlash = TrayCreateItem("Flash Icon")
	TrayCreateItem("") ; Create a separator line.

	Local $iAbout = TrayCreateItem("About")
	TrayCreateItem("") ; Create a separator line.

	Local $iExit = TrayCreateItem("Exit")

	TraySetState(1) ; Show the tray menu.

	While 1
		Switch TrayGetMsg()
			Case $iAbout ; Display a message box about the AutoIt version and installation path of the AutoIt executable.
				MsgBox($MB_SYSTEMMODAL, "", "AutoIt tray menu example." & @CRLF & @CRLF & _
						"Version: " & @AutoItVersion & @CRLF & _
						"Install Path: " & StringLeft(@AutoItExe, StringInStr(@AutoItExe, "\", 0, -1) - 1)) ; Find the folder of a full path.

			Case $iFlash
				; Start flashing the tray icon.
				TraySetState(4)
				Sleep(5000) ; Wait for 5 seconds.
				; Stop flashing the tray icon.
				TraySetState(8)

			Case $iExit ; Exit the loop.
				ExitLoop
		EndSwitch
	WEnd
EndFunc   ;==>Example
