#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $aWindows, $i, $text
	$aWindows = _WinAPI_EnumWindowsTop()
	For $i = 1 To $aWindows[0][0]
		$text = "Window Handle: " & $aWindows[$i][0] & @CRLF
		$text &= "Window Class: " & $aWindows[$i][1] & @CRLF
		$text &= "Window Title: " & WinGetTitle($aWindows[$i][0]) & @CRLF
		$text &= "Window Text: " & WinGetText($aWindows[$i][0]) & @CRLF
		$text &= "Window Process: " & WinGetProcess($aWindows[$i][0])
		MsgBox($MB_SYSTEMMODAL, "Item " & $i & " of " & $aWindows[0][0], $text)
	Next
EndFunc   ;==>Example
