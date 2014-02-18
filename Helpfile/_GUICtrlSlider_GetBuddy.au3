#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hInput, $hInput2, $hSlider

	; Create GUI
	GUICreate("Slider Get Buddy", 400, 296)
	$hSlider = GUICtrlCreateSlider(95, 2, 205, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	$hInput = GUICtrlCreateInput("0", 2, 25, 90, 20)
	$hInput2 = GUICtrlCreateInput("0", 2, 25, 90, 20)
	GUISetState(@SW_SHOW)

	; Set buddy to left
	_GUICtrlSlider_SetBuddy($hSlider, True, $hInput)
	; Set buddy to right
	_GUICtrlSlider_SetBuddy($hSlider, False, $hInput2)

	; Get Buddy from the left
	MsgBox($MB_SYSTEMMODAL, "Information", "Buddy Handle: " & _GUICtrlSlider_GetBuddy($hSlider, True))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
