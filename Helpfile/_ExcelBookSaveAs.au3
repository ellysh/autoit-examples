; Open an existing workbook and returns its object identifier.  Then SaveAs the file under a new name, without any alerts.

#include <Excel.au3>
#include <MsgBoxConstants.au3>

Local $sFilePath1 = @ScriptDir & "\Test.xls" ;This file should already exist
Local $oExcel = _ExcelBookOpen($sFilePath1)

If @error = 1 Then
	MsgBox($MB_SYSTEMMODAL, "Error!", "Unable to Create the Excel Object")
	Exit
ElseIf @error = 2 Then
	MsgBox($MB_SYSTEMMODAL, "Error!", "File does not exist - Shame on you!")
	Exit
EndIf

_ExcelBookSaveAs($oExcel, @TempDir & "\SaveAsExample", "xls")
If Not @error Then MsgBox($MB_SYSTEMMODAL, "Success", "File was Saved!", 3)
_ExcelBookClose($oExcel, 1, 0) ;This method will save then Close the file, without any of the normal prompts, regardless of changes
