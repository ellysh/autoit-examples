#include <Array.au3>
#include <String.au3>

Example()

Func Example()
	; Create an array of all the values between "[" and "]".
	Local $aArray = _StringBetween("[18][20][3][5][500][60]", "[", "]")

	; Display the results in _ArrayDisplay.
	_ArrayDisplay($aArray, "Default Search")
EndFunc   ;==>Example
