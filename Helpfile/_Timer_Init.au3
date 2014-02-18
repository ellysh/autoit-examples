#include <Timers.au3>

Example()

Func Example()
	HotKeySet("{ESC}", "_Quit")

	Local $starttime = _Timer_Init()
	While 1
		ToolTip(_Timer_Diff($starttime))
	WEnd
EndFunc   ;==>Example

Func _Quit()
	Exit
EndFunc   ;==>_Quit
