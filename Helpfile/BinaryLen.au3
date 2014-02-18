#include <MsgBoxConstants.au3>

Local $bBinary = Binary("0x10203040") ; Create binary data from a string.
MsgBox($MB_SYSTEMMODAL, "", "The length of the binary is: " & BinaryLen($bBinary))
