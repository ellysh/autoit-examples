; Create a new book, write data to 10 rows and columns,
; format 5 rows and columns as $ currency and set color to blue

#include <Excel.au3>
#include <MsgBoxConstants.au3>

Example()
Exit

Func Example()
	Local $oExcel = _ExcelBookNew() ; Create new book, make it visible
	; Fill some cells with random numbers
	For $y = 1 To 10
		For $x = 1 To 10
			_ExcelWriteCell($oExcel, Random(1000, 10000), $x, $y)
		Next
	Next
	Local $sFormat = "[Blue]$#,##0.00" ; Format cells as $ currency and set color to blue
	_ExcelNumberFormat($oExcel, $sFormat, 1, 1, 5, 5) ; Start on row 1, column 1 and end on row 5, column 5
	If @error Then MsgBox($MB_SYSTEMMODAL, "Error", "Formatting string '" & $sFormat & "' is invalid." & @CRLF & "This can be caused by wrong formatting strings if running on a non english system.")
	MsgBox($MB_SYSTEMMODAL, "Exiting", "Press OK to Exit Example 1")
	_ExcelBookClose($oExcel, 0) ; Close and drop changes
	Return
EndFunc   ;==>Example
