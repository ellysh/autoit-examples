#include <GuiRichEdit.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Color.au3>

Global $lblMsg, $hRichEdit

Example()

Func Example()
	Local $hGui, $btnNext, $iStep = 0
	$hGui = GUICreate(StringTrimRight(@ScriptName, 4), 420, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, 'This is a test.', 10, 10, 400, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$lblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$btnNext = GUICtrlCreateButton("Next", 270, 310, 60, 30)
	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				_GUICtrlRichEdit_Destroy($hRichEdit) ; needed unless script crashes
				GUIDelete()
				Exit
			Case $btnNext
				$iStep += 1
				Switch $iStep
					Case 1
						Report("1. Initial setting")
					Case 2
						_GUICtrlRichEdit_SetCharBkColor($hRichEdit, Dec('00FF00'))
						Report("2. Setting is now")
					Case 3
						_GUICtrlRichEdit_SetSel($hRichEdit, 1, 5)
						_GUICtrlRichEdit_SetCharBkColor($hRichEdit, Dec('8888FF'))
						Report("3. Background of a few characters changed")
					Case 4
						; Stream all text to the Desktop so you can look at settings in Word
						_GUICtrlRichEdit_StreamToFile($hRichEdit, @DesktopDir & "\gcre.rtf")
						GUICtrlSetState($btnNext, $GUI_DISABLE)
						GUICtrlSetData($lblMsg, "4. Saved to a file on the desktop gcre.rtf")
				EndSwitch
		EndSwitch
	WEnd
EndFunc   ;==>Example

Func Report($sMsg)
	Local $iColor = _GUICtrlRichEdit_GetCharBkColor($hRichEdit)
	Local $aRet = _ColorGetRGB($iColor)
	$sMsg &= @CRLF & @CRLF & $aRet[0] & ";" & $aRet[1] & ";" & $aRet[2] & " BkColor=0x" & Hex($iColor)
	GUICtrlSetData($lblMsg, $sMsg)
EndFunc   ;==>Report
