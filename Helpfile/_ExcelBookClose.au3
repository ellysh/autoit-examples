; Open a new Excel Window and Close it, with default parameters

#include <Excel.au3>

Local $oExcel = _ExcelBookNew() ; Create a Microsoft Excel window
_ExcelBookClose($oExcel) ;By default, this method Saves the file under the "My Documents" folder
