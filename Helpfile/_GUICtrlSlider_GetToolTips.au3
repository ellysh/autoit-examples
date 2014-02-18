#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hWndTT, $hSlider

	; Create GUI
	GUICreate("Slider Get Tool Tips", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Get Tool Tips
	$hWndTT = _GUICtrlSlider_GetToolTips($hSlider)
	MsgBox($MB_SYSTEMMODAL, "Information", "Tool Tip Handle: " & $hWndTT)

	; Set Tool Tips
	_GUICtrlSlider_SetToolTips($hSlider, $hWndTT)

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
