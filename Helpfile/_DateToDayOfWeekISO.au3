#include <Date.au3>
#include <MsgBoxConstants.au3>

; ISO Week day number for a given date 0=Monday - 6=Sunday
Local $iWeekday = _DateToDayOfWeekISO(@YEAR, @MON, @MDAY)
; NOT equal to @WDAY
MsgBox($MB_SYSTEMMODAL, "", "Todays ISO WeekdayNumber is: " & $iWeekday)
