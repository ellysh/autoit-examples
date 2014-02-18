; using AutoIt Function

#include <GUIConstantsEx.au3>
#include <GuiAVI.au3>

Global $hAVI

_Example_Internal()

Func _Example_Internal()
	Local $btn_start, $btn_stop

	; Create GUI
	GUICreate("(Internal) AVI Stop", 300, 200)
	$hAVI = GUICtrlCreateAvi(@SystemDir & "\shell32.dll", 160, 10, 10)
	$btn_start = GUICtrlCreateButton("start", 50, 150, 70, 22)
	$btn_stop = GUICtrlCreateButton("stop", 150, 150, 70, 22)
	GUISetState(@SW_SHOW)

	; Loop until the user exits.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $btn_start
				; Play part of the AVI clip
				_GUICtrlAVI_Play($hAVI)
			Case $btn_stop
				; Stop AVI clip
				_GUICtrlAVI_Stop($hAVI)
		EndSwitch
	WEnd

	; Close AVI clip
	_GUICtrlAVI_Close($hAVI)

	GUIDelete()
EndFunc   ;==>_Example_Internal
