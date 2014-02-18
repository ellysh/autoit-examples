#include <FileConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Create a constant variable in Local scope of the filepath that will be read/written to.
	Local Const $sFilePath = @TempDir & "\FileWrite.txt"

	; Create a temporary file to write data to.
	If Not FileCreate($sFilePath, "Start of the FileWrite example, line 1. " & @CRLF) Then Return MsgBox($MB_SYSTEMMODAL, "", "An error occurred whilst writing the temporary file.")

	; Open the file for writing (append to the end of a file) and store the handle to a variable.
	Local $hFileOpen = FileOpen($sFilePath, $FO_APPEND)
	If $hFileOpen = -1 Then
		MsgBox($MB_SYSTEMMODAL, "", "An error occurred when reading the file.")
		Return False
	EndIf

	; Write data to the file using the handle returned by FileOpen.
	FileWrite($hFileOpen, "Line 2")
	FileWrite($hFileOpen, "This is still line 2 as a new line wasn't appended to the last FileWrite call." & @CRLF)
	FileWrite($hFileOpen, "Line 3" & @CRLF)
	FileWrite($hFileOpen, "Line 4")

	; Close the handle returned by FileOpen.
	FileClose($hFileOpen)

	; Display the contents of the file passing the filepath to FileRead instead of a handle returned by FileOpen.
	MsgBox($MB_SYSTEMMODAL, "", "Contents of the file:" & @CRLF & FileRead($sFilePath))

	; Delete the temporary file.
	FileDelete($sFilePath)
EndFunc   ;==>Example

; Create a file.
Func FileCreate($sFilePath, $sString)
	Local $fReturn = True ; Create a variable to store a boolean value.
	If FileExists($sFilePath) = 0 Then $fReturn = FileWrite($sFilePath, $sString) = 1 ; If FileWrite returned 1 this will be True otherwise False.
	Return $fReturn ; Return the boolean value of either True of False, depending on the return value of FileWrite.
EndFunc   ;==>FileCreate
