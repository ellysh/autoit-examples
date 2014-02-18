#include <Math.au3>
#include <MsgBoxConstants.au3>

Local $degrees = 35
Local $radians = _Radian($degrees)

MsgBox($MB_SYSTEMMODAL, "Degrees to Radians", $degrees & " degrees = " & $radians & " radians")
