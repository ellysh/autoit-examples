#include <Process.au3>
#include <MsgBoxConstants.au3>

Run("notepad.exe")
WinWaitActive("[CLASS:Notepad]", "")
Local $pid = WinGetProcess("[CLASS:Notepad]", "")
Local $name = _ProcessGetName($pid)

MsgBox($MB_SYSTEMMODAL, "Notepad - " & $pid, $name)
