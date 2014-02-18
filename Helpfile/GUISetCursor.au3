#include <GUIConstantsEx.au3>

Global $iIDC = -1, $iNewIDC = 0

Example()

Func Example()
	HotKeySet("{ESC}", "Increment")

	GUICreate("Press ESC to Increment", 400, 400, 0, 0)

	GUISetState(@SW_SHOW)

	While GUIGetMsg() <> $GUI_EVENT_CLOSE
		If $iNewIDC <> $iIDC Then
			$iIDC = $iNewIDC
			GUISetCursor($iIDC)
		EndIf
		ToolTip("GUI Cursor #" & $iIDC)
	WEnd

	GUIDelete()
EndFunc   ;==>Example

Func Increment()
	$iNewIDC = $iIDC + 1
	If $iNewIDC > 15 Then $iNewIDC = 0
EndFunc   ;==>Increment
