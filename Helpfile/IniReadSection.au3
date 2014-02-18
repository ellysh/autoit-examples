#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Create an INI section structure as a string.
	Local $sSection = "Title=AutoIt" & @CRLF & "Version=" & @AutoItVersion & @CRLF & "OS=" & @OSVersion

	; Write the string to the section labelled 'General'.
	IniWriteSection(@TempDir & "\Example.ini", "General", $sSection)

	; Read the INI section labelled 'General'. This will return a 2 dimensional array.
	Local $aArray = IniReadSection(@TempDir & "\Example.ini", "General")

	; Check if an error occurred.
	If Not @error Then
		; Enumerate through the array displaying the keys and their respective values.
		For $i = 1 To $aArray[0][0]
			MsgBox($MB_SYSTEMMODAL, "", "Key: " & $aArray[$i][0] & @CRLF & "Value: " & $aArray[$i][1])
		Next
	EndIf

	; Delete the INI file.
	FileDelete(@TempDir & "\Example.ini")
EndFunc   ;==>Example
