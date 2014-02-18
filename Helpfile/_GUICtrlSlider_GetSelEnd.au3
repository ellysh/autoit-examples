#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hSlider

	; Create GUI
	GUICreate("Slider Get Sel End", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Set Sel End
	_GUICtrlSlider_SetSelEnd($hSlider, 50)

	; Get Sel End
	MsgBox($MB_SYSTEMMODAL, "Information", "Sel End: " & _GUICtrlSlider_GetSelEnd($hSlider))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
