#include <GuiToolbar.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $hGUI, $hToolbar
	Local Enum $idRed = 1000, $idGreen, $idBlue
	Local $Wow64 = ""
	If @AutoItX64 Then $Wow64 = "\Wow6432Node"
	Local $sPath = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $Wow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\Examples\GUI\Advanced\Images"

	; Create GUI
	$hGUI = GUICreate("Toolbar", 400, 300)
	$hToolbar = _GUICtrlToolbar_Create($hGUI)
	GUISetState(@SW_SHOW)

	; Add bitmaps
	_GUICtrlToolbar_LoadBitmap($hToolbar, $sPath & "\red.bmp")
	_GUICtrlToolbar_LoadBitmap($hToolbar, $sPath & "\green.bmp")
	_GUICtrlToolbar_LoadBitmap($hToolbar, $sPath & "\blue.bmp")

	; Add buttons
	_GUICtrlToolbar_AddButton($hToolbar, $idRed, 0)
	_GUICtrlToolbar_AddButton($hToolbar, $idGreen, 1)
	_GUICtrlToolbar_AddButton($hToolbar, $idBlue, 2)

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
