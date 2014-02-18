#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hSlider

	; Create GUI
	GUICreate("Slider Set Range Max", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Get Range Max
	MsgBox($MB_SYSTEMMODAL, "Information", "Range Max: " & _GUICtrlSlider_GetRangeMax($hSlider))

	; Set Range Max
	_GUICtrlSlider_SetRangeMax($hSlider, 50)

	; Get Range Max
	MsgBox($MB_SYSTEMMODAL, "Information", "Range Max: " & _GUICtrlSlider_GetRangeMax($hSlider))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
