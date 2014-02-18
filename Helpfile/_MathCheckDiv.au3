#include <Math.au3>
#include <MsgBoxConstants.au3>

Local $I_Var = InputBox('Odd or Even', 'Enter a number:')
Local $I_Result = _MathCheckDiv($I_Var, 2)
If $I_Result = -1 Or @error = 1 Then
	MsgBox($MB_SYSTEMMODAL, '', 'You did not enter a valid number')
ElseIf $I_Result = 1 Then
	MsgBox($MB_SYSTEMMODAL, '', 'Number is odd')
ElseIf $I_Result = 2 Then
	MsgBox($MB_SYSTEMMODAL, '', 'Number is even')
Else
	MsgBox($MB_SYSTEMMODAL, '', 'Could not parse $I_Result')
EndIf
