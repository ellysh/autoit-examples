#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

MsgBox($MB_SYSTEMMODAL, "ID", "Get Current Process: " & _WinAPI_GetCurrentProcessID())
