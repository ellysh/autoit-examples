#include <GUIConstantsEx.au3>
#include <GuiAVI.au3>
#include <MsgBoxConstants.au3>

Global $hAVI

Example()

Func Example()
	Local $Wow64 = ""
	If @AutoItX64 Then $Wow64 = "\Wow6432Node"
	Local $hGUI, $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $Wow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\Examples\GUI\SampleAVI.avi"

	; Create GUI
	$hGUI = GUICreate("(External) AVI Destroy", 300, 100)
	$hAVI = _GUICtrlAVI_Create($hGUI, "", -1, 10, 10)
	GUISetState(@SW_SHOW)

	; Play the sample AutoIt AVI
	_GUICtrlAVI_Open($hAVI, $sFile)

	; Play the sample AutoIt AVI
	_GUICtrlAVI_Play($hAVI)

	Sleep(3000)

	; Stop AVI clip after 3 seconds
	_GUICtrlAVI_Stop($hAVI)

	; Close AVI clip
	_GUICtrlAVI_Close($hAVI)

	MsgBox($MB_SYSTEMMODAL, "Information", "Destroy AVI Control")
	_GUICtrlAVI_Destroy($hAVI)

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>Example
