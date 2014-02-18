#include <Array.au3>
#include <MsgBoxConstants.au3>

Local $avArray = StringSplit("4,2,06,8,12,5", ",")

MsgBox($MB_SYSTEMMODAL, 'Min String value', _ArrayMin($avArray, 0, 1))
MsgBox($MB_SYSTEMMODAL, 'Min Numeric value', _ArrayMin($avArray, 1, 0))
