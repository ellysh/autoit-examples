#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hSlider

	; Create GUI
	GUICreate("Slider Set Tic Freq", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Get Num Tics
	MsgBox($MB_SYSTEMMODAL, "Information", "Num Tics: " & _GUICtrlSlider_GetNumTics($hSlider))

	; Set Tic Freq
	_GUICtrlSlider_SetTicFreq($hSlider, 1)

	; Get Num Tics
	MsgBox($MB_SYSTEMMODAL, "Information", "Num Tics: " & _GUICtrlSlider_GetNumTics($hSlider))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
