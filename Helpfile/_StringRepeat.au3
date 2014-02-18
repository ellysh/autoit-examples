#include <String.au3>
#include <MsgBoxConstants.au3>

; Repeat the string "+-" forty times.
MsgBox($MB_SYSTEMMODAL, '', _StringRepeat("+-", 40))
