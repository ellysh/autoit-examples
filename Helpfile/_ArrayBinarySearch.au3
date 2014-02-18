; using a manually-defined array

#include <Array.au3>
#include <MsgBoxConstants.au3>

Local $avArray[10]

$avArray[0] = "JPM"
$avArray[1] = "Holger"
$avArray[2] = "Jon"
$avArray[3] = "Larry"
$avArray[4] = "Jeremy"
$avArray[5] = "Valik"
$avArray[6] = "Cyberslug"
$avArray[7] = "Nutster"
$avArray[8] = "JdeB"
$avArray[9] = "Tylo"

; sort the array to be able to do a binary search
_ArraySort($avArray)

; display sorted array
_ArrayDisplay($avArray, "$avArray AFTER _ArraySort()")

; lookup existing entry
Local $iKeyIndex = _ArrayBinarySearch($avArray, "Jon")
If Not @error Then
	MsgBox($MB_SYSTEMMODAL, 'Entry found', ' Index: ' & $iKeyIndex)
Else
	MsgBox($MB_SYSTEMMODAL, 'Entry Not found', ' Error: ' & @error)
EndIf

; lookup non-existing entry
$iKeyIndex = _ArrayBinarySearch($avArray, "Unknown")
If Not @error Then
	MsgBox($MB_SYSTEMMODAL, 'Entry found', ' Index: ' & $iKeyIndex)
Else
	MsgBox($MB_SYSTEMMODAL, 'Entry Not found', ' Error: ' & @error)
EndIf
