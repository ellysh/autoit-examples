#include <MsgBoxConstants.au3>

Local $aArray[2] = [1, "Example"]
Local $bBinary = Binary("0x00204060")
Local $fBoolean = False
Local $hFunc = ConsoleWrite
Local $hPtr = Ptr(-1)
Local $hWnd = WinGetHandle("[CLASS:Shell_TrayWnd]")
Local $iInt = 1
Local $nFloat = 2.0
Local $oObject = ObjCreate("Scripting.Dictionary")
Local $sString = "Some text"
Local $tStruct = DllStructCreate("wchar[256]")
Local $vKeyword = Default

MsgBox($MB_SYSTEMMODAL, "", "Variable Types" & @CRLF & "$aArray is an " & VarGetType($aArray) & " variable type." & @CRLF & _
		"$bBinary is a " & VarGetType($bBinary) & " variable type." & @CRLF & _
		"$fBoolean is a " & VarGetType($fBoolean) & " variable type." & @CRLF & _
		"$hFunc is a " & VarGetType($hFunc) & " variable type." & @CRLF & _
		"$hPtr is a " & VarGetType($hPtr) & " variable type." & @CRLF & _
		"$hWnd is a " & VarGetType($hWnd) & " variable type." & @CRLF & _
		"$iInt is an " & VarGetType($iInt) & " variable type." & @CRLF & _
		"$nFloat is a " & VarGetType($nFloat) & " variable type." & @CRLF & _
		"$oObject is a " & VarGetType($oObject) & " variable type." & @CRLF & _
		"$sString is a " & VarGetType($sString) & " variable type." & @CRLF & _
		"$tStruct is a " & VarGetType($tStruct) & " variable type." & @CRLF & _
		"$vKeyword is a " & VarGetType($vKeyword) & " variable type." & @CRLF)
