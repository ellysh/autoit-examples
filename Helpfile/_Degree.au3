#include <Math.au3>
#include <MsgBoxConstants.au3>

Local $radians = 3.14159265358979
Local $degrees = _Degree($radians)

MsgBox($MB_SYSTEMMODAL, "Radians to Degrees", $radians & " radians = " & $degrees & " degrees")
