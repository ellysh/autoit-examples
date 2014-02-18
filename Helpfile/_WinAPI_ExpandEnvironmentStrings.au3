#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

MsgBox($MB_SYSTEMMODAL, "Environment string", "%windir% = " & _WinAPI_ExpandEnvironmentStrings("%windir%"))
