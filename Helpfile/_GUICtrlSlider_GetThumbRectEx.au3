#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $tRect, $hSlider

	; Create GUI
	GUICreate("Slider Get Thumb RectEx", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Get Thumb Rect
	$tRect = _GUICtrlSlider_GetThumbRectEx($hSlider)

	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("[%d][%d][%d][%d]", _
			DllStructGetData($tRect, "Left"), DllStructGetData($tRect, "Top"), _
			DllStructGetData($tRect, "Right"), DllStructGetData($tRect, "Bottom")))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
