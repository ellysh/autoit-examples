#include <Date.au3>
#include <MsgBoxConstants.au3>

; Retrieve the long name
Local $sLongDayName = _DateDayOfWeek(@WDAY)

; Retrieve the abbreviated name
Local $sShortDayName = _DateDayOfWeek(@WDAY, 1)

MsgBox($MB_SYSTEMMODAL, "Day of Week", "Today is: " & $sLongDayName & " (" & $sShortDayName & ")")
