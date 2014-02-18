#include <MsgBoxConstants.au3>

Local $bBinary = Binary("0x00204060") ; Convert the string to binary.

MsgBox($MB_SYSTEMMODAL, "", "Returns 1 as the variable is binary: " & IsBinary($bBinary))
