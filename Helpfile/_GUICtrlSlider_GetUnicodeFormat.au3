#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hSlider

	; Create GUI
	GUICreate("Slider Get Unicode Format", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Get Unicode Format
	MsgBox($MB_SYSTEMMODAL, "Information", "Unicode Format: " & _GUICtrlSlider_GetUnicodeFormat($hSlider))

	; Set Unicode Format
	MsgBox($MB_SYSTEMMODAL, "Information", "Previous Unicode Format: " & _GUICtrlSlider_SetUnicodeFormat($hSlider, False))

	; Get Unicode Format
	MsgBox($MB_SYSTEMMODAL, "Information", "Unicode Format: " & _GUICtrlSlider_GetUnicodeFormat($hSlider))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
