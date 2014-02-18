#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hSlider

	; Create GUI
	GUICreate("Slider Get Thumb Length", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 25, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_FIXEDLENGTH))
	GUISetState(@SW_SHOW)

	; Get Thumb Length
	MsgBox($MB_SYSTEMMODAL, "Information", "Thumb Length: " & _GUICtrlSlider_GetThumbLength($hSlider))

	; Set Thumb Length
	_GUICtrlSlider_SetThumbLength($hSlider, 10)

	; Get Thumb Length
	MsgBox($MB_SYSTEMMODAL, "Information", "Thumb Length: " & _GUICtrlSlider_GetThumbLength($hSlider))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
