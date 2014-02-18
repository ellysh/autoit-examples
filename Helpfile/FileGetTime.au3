#include <FileConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Create a constant variable in Local scope of the filepath that will be read/written to.
	Local Const $sFilePath = @TempDir & "\FileGetTime.txt"

	; Create a temporary file to read data from.
	If Not FileCreate($sFilePath, "This is an example of using FileGetTime.") Then Return MsgBox($MB_SYSTEMMODAL, "", "An error occurred whilst writing the temporary file.")

	; Set the modified timestamp of the file to 1st Nov 2003 and use the current time.
	Local $iFileSetTime = FileSetTime($sFilePath, "20031101", $FT_MODIFIED)

	; Display the modified timestamp of the file and return as a string in the format YYYYMMDDHHMMSS.
	If $iFileSetTime Then
		MsgBox($MB_SYSTEMMODAL, "", "Timestamp:" & @CRLF & FileGetTime($sFilePath, $FT_MODIFIED, 1))
	Else
		MsgBox($MB_SYSTEMMODAL, "", "An error occurred whilst setting the timestamp of the file.")
	EndIf

	; Delete the temporary file.
	FileDelete($sFilePath)
EndFunc   ;==>Example

; Create a file.
Func FileCreate($sFilePath, $sString)
	Local $fReturn = True ; Create a variable to store a boolean value.
	If FileExists($sFilePath) = 0 Then $fReturn = FileWrite($sFilePath, $sString) = 1 ; If FileWrite returned 1 this will be True otherwise False.
	Return $fReturn ; Return the boolean value of either True of False, depending on the return value of FileWrite.
EndFunc   ;==>FileCreate
