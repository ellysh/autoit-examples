#include <MsgBoxConstants.au3>

Local $var = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "ProgramFilesDir")
MsgBox($MB_SYSTEMMODAL, "Program files are in:", $var)
