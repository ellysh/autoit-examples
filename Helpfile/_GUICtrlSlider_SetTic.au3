#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iTic = Random(0, 100, 1), $hSlider

	; Create GUI
	GUICreate("Slider Set Tic", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Set Tic
	_GUICtrlSlider_SetTic($hSlider, $iTic)

	; Get Tic
	MsgBox($MB_SYSTEMMODAL, "Information", "Tic: " & _GUICtrlSlider_GetTic($hSlider, $iTic))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
