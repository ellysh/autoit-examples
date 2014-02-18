; Trap COM errors so that 'Back' and 'Forward'
; outside of history bounds does not abort script
; (expect COM errors to be sent to the console)

#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <IE.au3>

Local $oIE = _IECreateEmbedded()
GUICreate("Embedded Web control Test", 640, 580, _
		(@DesktopWidth - 640) / 2, (@DesktopHeight - 580) / 2, _
		$WS_OVERLAPPEDWINDOW + $WS_CLIPSIBLINGS + $WS_CLIPCHILDREN)
GUICtrlCreateObj($oIE, 10, 40, 600, 360)
Global $GUI_Button_Back = GUICtrlCreateButton("Back", 10, 420, 100, 30)
Global $GUI_Button_Forward = GUICtrlCreateButton("Forward", 120, 420, 100, 30)
Global $GUI_Button_Home = GUICtrlCreateButton("Home", 230, 420, 100, 30)
Global $GUI_Button_Stop = GUICtrlCreateButton("Stop", 340, 420, 100, 30)

Global $GUI_Error_Message = GUICtrlCreateLabel("", 100, 500, 500, 30)
GUICtrlSetColor(-1, 0xff0000)

GUISetState(@SW_SHOW) ;Show GUI

_IENavigate($oIE, "http://www.autoitscript.com")
_IEAction($oIE, "stop")

; Waiting for user to close the window
While 1
	Local $msg = GUIGetMsg()
	Select
		Case $msg = $GUI_EVENT_CLOSE
			ExitLoop
		Case $msg = $GUI_Button_Home
			_IENavigate($oIE, "http://www.autoitscript.com")
			_IEAction($oIE, "stop")
			_IEAction($oIE, "back")
			CheckError("Home", @error, @extended)
		Case $msg = $GUI_Button_Back
			_IEAction($oIE, "back")
			CheckError("Back", @error, @extended)
		Case $msg = $GUI_Button_Forward
			_IEAction($oIE, "forward")
			CheckError("Forward", @error, @extended)
		Case $msg = $GUI_Button_Stop
			_IEAction($oIE, "stop")
			CheckError("Stop", @error, @extended)
	EndSelect
WEnd

GUIDelete()

Exit

Func CheckError($sMsg, $error, $extended)
	If $error Then
		$sMsg = "Error using " & $sMsg & " button (" & $extended & ")"
	Else
		$sMsg = ""
	EndIf
	GUICtrlSetData($GUI_Error_Message, $sMsg)
EndFunc   ;==>CheckError
