; Open a New workbook and returns its object identifier.  Then Save the file without any alerts.

#include <Excel.au3>
#include <MsgBoxConstants.au3>

Local $oExcel = _ExcelBookNew()

_ExcelBookSave($oExcel) ;Save File With No Alerts
If Not @error Then MsgBox($MB_SYSTEMMODAL, "Success", "File was Saved!", 3)
