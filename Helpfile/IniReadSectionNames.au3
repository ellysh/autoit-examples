#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Create an INI section structure as a string.
	Local $sSection = "Title=AutoIt" & @CRLF & "Version=" & @AutoItVersion & @CRLF & "OS=" & @OSVersion

	; Write the string to the sections labelled 'General', 'Version' and 'Other'.
	IniWriteSection(@TempDir & "\Example.ini", "General", $sSection)
	IniWriteSection(@TempDir & "\Example.ini", "Version", $sSection)
	IniWriteSection(@TempDir & "\Example.ini", "Other", $sSection)

	; Read the INI section names. This will return a 1 dimensional array.
	Local $aArray = IniReadSectionNames(@TempDir & "\Example.ini")

	; Check if an error occurred.
	If Not @error Then
		; Enumerate through the array displaying the section names.
		For $i = 1 To $aArray[0]
			MsgBox($MB_SYSTEMMODAL, "", "Section: " & $aArray[$i])
		Next
	EndIf

	; Delete the INI file.
	FileDelete(@TempDir & "\Example.ini")
EndFunc   ;==>Example
