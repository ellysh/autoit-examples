#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Sample script with three user-defined functions
	; Notice the use of variables, ByRef, and Return

	Local $foo = 2
	Local $bar = 5
	MsgBox($MB_SYSTEMMODAL, "", "Today is " & today() & @CRLF & "$foo equals " & $foo)
	swap($foo, $bar)
	MsgBox($MB_SYSTEMMODAL, "", "After swapping $foo and $bar:" & @CRLF & "$foo now contains " & $foo)
	MsgBox($MB_SYSTEMMODAL, "", "Finally:" & @CRLF & "The larger of 3 and 4 is " & max(3, 4))
EndFunc   ;==>Example

Func swap(ByRef $a, ByRef $b) ;swap the contents of two variables
	Local $t = 0
	$t = $a
	$a = $b
	$b = $t
EndFunc   ;==>swap

Func today() ;Return the current date in mm/dd/yyyy form
	Return (@MON & "/" & @MDAY & "/" & @YEAR)
EndFunc   ;==>today

Func max($x, $y) ;Return the larger of two numbers
	If $x > $y Then
		Return $x
	Else
		Return $y
	EndIf
EndFunc   ;==>max
