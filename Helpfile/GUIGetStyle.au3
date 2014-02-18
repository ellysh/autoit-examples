#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $fNewStyle = False, $hGUI = 0, $iBtnStyle = 0, $aGUIStyle = 0, $iMsg = 0

	$hGUI = GUICreate("Gui Style", 260, 100)
	$iBtnStyle = GUICtrlCreateButton("Set Style", 45, 50, 150, 20)

	$aGUIStyle = GUIGetStyle($hGUI) ; be careful the style change after opening

	GUISetState(@SW_SHOW)

	While 1
		$iMsg = GUIGetMsg()
		Switch $iMsg
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $iBtnStyle
				If Not $fNewStyle Then
					GUISetStyle(BitOR($WS_POPUPWINDOW, $WS_THICKFRAME), BitOR($WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))
					GUICtrlSetData($iBtnStyle, 'Undo Style')
					$fNewStyle = True
				Else
					GUISetStyle($aGUIStyle[0], $aGUIStyle[1])
					GUICtrlSetData($iBtnStyle, 'Set Style')
					$fNewStyle = False
				EndIf
			Case Else
		EndSwitch
	WEnd

	GUIDelete($hGUI)
EndFunc   ;==>Example
