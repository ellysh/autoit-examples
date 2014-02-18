#include <MsgBoxConstants.au3>

Local $bBinary = Binary("0x10203040") ; Create binary data from a string.
Local $bExtract = BinaryMid($bBinary, 2, 2)
MsgBox($MB_SYSTEMMODAL, "", "The 2nd and 3rd bytes are: " & $bExtract)
