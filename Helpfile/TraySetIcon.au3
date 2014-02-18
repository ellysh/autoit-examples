#NoTrayIcon

Opt("TrayMenuMode", 3) ; The default tray menu items will not be shown and items are not checked when selected. These are options 1 and 2 for TrayMenuMode.

Example()

Func Example()
	Local $iExit = TrayCreateItem("Exit")

	TraySetState(1) ; Show the tray menu.

	Local $hTimer = TimerInit() ; Begin the timer and store the handle in a variable.
	Local $iDiff = 0, $iIndex = 0

	While 1
		$iDiff = TimerDiff($hTimer) ; Find the difference in time from the previous call of TimerInit
		If $iDiff > 1000 Then ; If the difference is greater than 1 second then change the tray menu icon.

			$iIndex = -Random(0, 100, 1) ; Use a negative number for ordinal numbering.
			TraySetToolTip("Currently using the icon shell32.dll, " & $iIndex & ".") ; Set the tray menu tooltip with information about the icon index.
			TraySetIcon("shell32.dll", $iIndex) ; Set the tray menu icon using the shell32.dll and the random index number.
			$hTimer = TimerInit() ; Reset the timer.

		EndIf

		Switch TrayGetMsg()
			Case $iExit ; Exit the loop.
				ExitLoop
		EndSwitch
	WEnd
EndFunc   ;==>Example
