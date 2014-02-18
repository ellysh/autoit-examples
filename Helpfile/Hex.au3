#include <MsgBoxConstants.au3>

; Assign a Local variable the hex number representation of 1033.
Local $iHex1 = Hex(1033, 4)

; Display the result.
MsgBox($MB_SYSTEMMODAL, "", $iHex1)
