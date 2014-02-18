#include <GUIConstantsEx.au3>
#include <GuiIPAddress.au3>

Example()

Func Example()
	Local $hgui, $hIPAddress

	$hgui = GUICreate("IP Address Control Set Focus Example", 400, 300)
	$hIPAddress = _GUICtrlIpAddress_Create($hgui, 2, 4)
	GUISetState(@SW_SHOW)

	_GUICtrlIpAddress_Set($hIPAddress, "24.168.2.128")

	_GUICtrlIpAddress_SetFocus($hIPAddress, 1)
	; Wait for user to close GUI
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
