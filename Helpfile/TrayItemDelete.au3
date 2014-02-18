#NoTrayIcon
#include <MsgBoxConstants.au3>

Opt("TrayMenuMode", 3) ; The default tray menu items will not be shown and items are not checked when selected. These are options 1 and 2 for TrayMenuMode.

Example()

Func Example()
	Local $iDelete = TrayCreateItem("Delete")
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

			Case $iDelete
				; Display a message box to ask whether or not to delete the 'Delete' item. If the return value of MsgBox is equal to $IDYES then delete the item.
				If MsgBox(BitOR($MB_YESNO, $MB_SYSTEMMODAL), "", "Do you want to delete the 'Delete' tray menu item?") = $IDYES Then
					TrayItemDelete($iDelete) ; Delete the tray menu item.
				EndIf

			Case $iExit ; Exit the loop.
				ExitLoop
		EndSwitch
	WEnd
EndFunc   ;==>Example
