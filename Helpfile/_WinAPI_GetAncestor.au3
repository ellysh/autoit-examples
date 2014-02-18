#include <WinAPI.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hwnd, $hparent
	$hwnd = GUICreate("test")
	$hparent = _WinAPI_GetAncestor($hwnd, $GA_PARENT)
	MsgBox($MB_SYSTEMMODAL, "Parent", "Get Ancestor of " & $hwnd & ": " & $hparent)
	MsgBox($MB_SYSTEMMODAL, "Root", "Get Ancestor of " & $hparent & ": " & _WinAPI_GetAncestor($hwnd, $GA_ROOT))
	MsgBox($MB_SYSTEMMODAL, "Root Owner", "Get Ancestor of " & $hparent & ": " & _WinAPI_GetAncestor($hwnd, $GA_ROOTOWNER))
EndFunc   ;==>Example
