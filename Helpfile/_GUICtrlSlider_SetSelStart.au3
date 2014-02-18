#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hSlider

	; Create GUI
	GUICreate("Slider Set Sel Start", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Set Sel Start
	_GUICtrlSlider_SetSelStart($hSlider, 10)

	; Get Sel Start
	MsgBox($MB_SYSTEMMODAL, "Information", "Sel Start: " & _GUICtrlSlider_GetSelStart($hSlider))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
