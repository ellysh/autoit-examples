#include <Array.au3>
#include <Inet.au3>
#include <MsgBoxConstants.au3>

Global $aResult, $sResult, $sIP

TCPStartup()
$sIP = TCPNameToIP("autoitscript.com")
$sResult = _TCPIpToName($sIP)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "_TCPIpToName()", "@error = " & @error & @CRLF & "@extended = " & @extended)
Else
	MsgBox($MB_SYSTEMMODAL, "autoitscript.com really is:", $sResult)
EndIf
