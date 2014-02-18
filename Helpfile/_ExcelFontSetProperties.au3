; After opening a workbook and returning its object identifier: Sets the Font Properties in a range.

#include <Excel.au3>
#include <MsgBoxConstants.au3>

Local $oExcel = _ExcelBookNew() ;Create new book, make it visible
Local $sRangeOrRowStart = 1, $iColStart = 1, $iRowEnd = 10, $iColEnd = 10
Local $fBold, $fItalic, $fUnderline, $i = 1

; We can fill-up some cells using a simple loop and random Numbers
For $i = 1 To 10
	For $j = 1 To 10
		_ExcelWriteCell($oExcel, Round(Random(1, 100), 0), $i, $j) ;Round off some random numbers to file
	Next
Next

MsgBox($MB_SYSTEMMODAL, "_ExcelHorizontalAlignSet", "Notice the Font Properties, This will go through all the Possible Combinations" & @CRLF & "Press OK to Continue")

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, False, False, False) ; No font properties set
$i = "No font properties set"
ToolTip("New Font Setting: " & $i)
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, False, False, True) ; Underlined
$i = "Underlined"
ToolTip("New Font Setting: " & $i)
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, False, True, False) ; Italic
$i = "Italic"
ToolTip("New Font Setting: " & $i)
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, False, True, True) ; Italic and Underlined
$i = "Italic and Underlined"
ToolTip("New Font Setting: " & $i)
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, True, False, False) ; Bold
$i = "Bold"
ToolTip("New Font Setting: " & $i)
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, True, False, True) ; Bold and Underlined
$i = "Bold and Underlined"
ToolTip("New Font Setting: " & $i)
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, True, True, False) ; Bold and Italic
$i = "Bold and Italic"
ToolTip("New Font Setting: " & $i)
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, True, True, True) ; Bold, Italic, and Underlined
$i = "Bold, Italic, and Underlined"
ToolTip("New Font Setting: " & $i)
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, False, False, False) ; No font properties set
$i = "No font properties set"
ToolTip("New Font Setting: " & $i)
Sleep(2500)

MsgBox($MB_SYSTEMMODAL, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Now we save it into the temp directory; overwrite existing file if necessary
_ExcelBookClose($oExcel) ; And finally we close out
