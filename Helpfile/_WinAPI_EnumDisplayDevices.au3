#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $aDevice, $i = 0, $text
	While 1
		$aDevice = _WinAPI_EnumDisplayDevices("", $i)
		If Not $aDevice[0] Then ExitLoop
		$text = "Successful? " & $aDevice[0] & @CRLF
		$text &= "Device (Adapter or Monitor): " & $aDevice[1] & @CRLF
		$text &= "Description (Adapter or Monitor): " & $aDevice[2] & @CRLF
		$text &= "Device State Flag: " & $aDevice[3] & @CRLF
		If BitAND($aDevice[3], 32) Then $text &= @TAB & "- The device has more display modes than its output devices support" & @CRLF

		If BitAND($aDevice[3], 16) Then $text &= @TAB & "- The device is removable; it cannot be the primary display" & @CRLF
		If BitAND($aDevice[3], 8) Then $text &= @TAB & "- The device is VGA compatible" & @CRLF
		If BitAND($aDevice[3], 4) Then $text &= @TAB & "- Represents a pseudo device used to mirror application drawing for remoting" & @CRLF
		If BitAND($aDevice[3], 2) Then $text &= @TAB & "- The primary desktop is on the device" & @CRLF
		If BitAND($aDevice[3], 1) Then $text &= @TAB & "- The device is part of the desktop" & @CRLF

		$text &= "Plug and Play identifier string: " & $aDevice[4] & @CRLF
		MsgBox($MB_SYSTEMMODAL, "", $text)
		$i += 1
	WEnd
EndFunc   ;==>Example
