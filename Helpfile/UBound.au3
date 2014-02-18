#include <MsgBoxConstants.au3>
#include <Array.au3> ; Required for _ArrayDisplay.

Example()

Func Example()
	Local $aArray[10][20]
	Local $iRows = UBound($aArray, 1) ; Total number of rows. In this example it will be 10.
	Local $iCols = UBound($aArray, 2) ; Total number of columns. In this example it will be 20.
	Local $iDimension = UBound($aArray, 0) ; The dimension of the array e.g. 1/2/3 dimensional.

	MsgBox($MB_SYSTEMMODAL, "", "The array is a " & $iDimension & " dimensional array with " & _
			$iRows & " row(s) & " & $iCols & " column(s).")

	; Fill the array with data.
	For $i = 0 To $iRows - 1
		For $j = 0 To $iCols - 1
			$aArray[$i][$j] = "Row: " & $i & " - Col: " & $j
		Next
	Next
	_ArrayDisplay($aArray)
EndFunc   ;==>Example
