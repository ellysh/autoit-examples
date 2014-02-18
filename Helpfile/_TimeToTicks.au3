#include <Date.au3>
#include <MsgBoxConstants.au3>

Global $Sec, $Min, $Hour, $Time
; calculate with time
Local $StartTicks = _TimeToTicks(@HOUR, @MIN, @SEC)
; calculate 45 minutes later
Local $EndTicks = $StartTicks + 45 * 60 * 1000
_TicksToTime($EndTicks, $Hour, $Min, $Sec)
MsgBox($MB_SYSTEMMODAL, '', 'New Time:' & $Hour & ":" & $Min & ":" & $Sec)
