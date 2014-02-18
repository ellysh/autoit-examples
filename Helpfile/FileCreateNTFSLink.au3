#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Create a constant variable in Local scope of the filepath that will be read/written to.
	Local Const $sFilePath = @TempDir & "\FileCreateNTFSLink.txt"

	; Create a temporary file to link to.
	If Not FileCreate($sFilePath, "This is an example of using FileCreateNTFSLink.") Then Return MsgBox($MB_SYSTEMMODAL, "", "An error occurred whilst writing the temporary file.")

	; Create a NTFS link of the .txt file to the .log file on the desktop.
	Local $iNTFSLink = FileCreateNTFSLink($sFilePath, @DesktopDir & "\ExampleNTFSLink.log")

	; Display a message of whether the NTFS link was created.
	If $iNTFSLink Then
		; Open the desktop directory.
		ShellExecute(@DesktopDir)

		MsgBox($MB_SYSTEMMODAL, "", "The NTFS link was created." & @CRLF & "FileCreateNTFSLink returned: " & $iNTFSLink)
	Else
		MsgBox($MB_SYSTEMMODAL, "", "The NTFS link wasn't created." & @CRLF & "FileCreateNTFSLink returned: " & $iNTFSLink)
	EndIf

	; Delete the temporary files.
	FileDelete($sFilePath)
	FileDelete(@DesktopDir & "\ExampleNTFSLink.log")
EndFunc   ;==>Example

; Create a file.
Func FileCreate($sFilePath, $sString)
	Local $fReturn = True ; Create a variable to store a boolean value.
	If FileExists($sFilePath) = 0 Then $fReturn = FileWrite($sFilePath, $sString) = 1 ; If FileWrite returned 1 this will be True otherwise False.
	Return $fReturn ; Return the boolean value of either True of False, depending on the return value of FileWrite.
EndFunc   ;==>FileCreate
