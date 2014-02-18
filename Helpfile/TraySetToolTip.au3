#NoTrayIcon

Example()

Func Example()
	TraySetState(1) ; Show the tray menu.
	TraySetToolTip("An example of a tray menu tooltip.") ; The tray menu icon must be shown before we can set some text.

	While 1
		Sleep(100) ; An idle loop.
	WEnd
EndFunc   ;==>Example
