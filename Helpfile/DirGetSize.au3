#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $vSize = DirGetSize(@HomeDrive)
	MsgBox($MB_SYSTEMMODAL, "", "Size(MegaBytes): " & Round($vSize / 1024 / 1024))

	$vSize = DirGetSize(@WindowsDir, 2)
	MsgBox($MB_SYSTEMMODAL, "", "Size(MegaBytes): " & Round($vSize / 1024 / 1024))

	Local $hTimer = TimerInit()

	$vSize = DirGetSize("\\10.0.0.1\h$", 1)

	Local $iDiff = Round(TimerDiff($hTimer) / 1000) ; time in seconds

	If IsArray($vSize) = 1 Then
		MsgBox($MB_SYSTEMMODAL, "", "Size(Bytes): " & $vSize[0] & @CRLF _
				 & "Files: " & $vSize[1] & @CRLF & "Dirs: " & $vSize[2] & @CRLF _
				 & "TimeDiff(Sec): " & $iDiff)
	EndIf
EndFunc   ;==>Example
