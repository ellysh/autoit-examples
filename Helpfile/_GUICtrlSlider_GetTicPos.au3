#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iTic = Random(1, 99, 1), $hSlider

	; Create GUI
	GUICreate("Slider Get Tic Pos", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Get Tic Pos
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Tic %d: X Pos: %d", $iTic, _GUICtrlSlider_GetTicPos($hSlider, $iTic)))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
