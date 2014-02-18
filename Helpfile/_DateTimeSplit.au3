#include <Date.au3>
#include <MsgBoxConstants.au3>

Local $MyDate, $MyTime
_DateTimeSplit("2005/01/01 14:30", $MyDate, $MyTime)

For $x = 1 To $MyDate[0]
	MsgBox($MB_SYSTEMMODAL, $x, $MyDate[$x])
Next
For $x = 1 To $MyTime[0]
	MsgBox($MB_SYSTEMMODAL, $x, $MyTime[$x])
Next
