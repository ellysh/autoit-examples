; Open an existing workbook and returns its object identifier.

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
