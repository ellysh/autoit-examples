; After opening a workbook and returning its object identifier, create and display an array of all the Sheet Names in the workbook

#include <Excel.au3>
#include <Array.au3>
#include <MsgBoxConstants.au3>

Local $oExcel = _ExcelBookNew() ;Create new book, make it visible

Local $aArray = _ExcelSheetList($oExcel)
_ArrayDisplay($aArray, "All The WorkSheets In this WorkBook")

MsgBox($MB_SYSTEMMODAL, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Now we save it into the temp directory; overwrite existing file if necessary
_ExcelBookClose($oExcel) ; And finally we close out
