; using AutoIt Function

#include <GuiEdit.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Example_Internal()

Func Example_Internal()
	Local $s_texttest = "this is a test" & @CRLF & _
			"this is only a test" & @CRLF & _
			"this testing should work for you as well as it does for me"
	Local $Button1, $Button2, $msg, $hEdit

	GUICreate('Find And Replace Example with AutoIt ' & FileGetVersion(@AutoItExe), 622, 448, 192, 125)
	$hEdit = GUICtrlCreateEdit($s_texttest, 64, 24, 505, 233, _
			BitOR($ES_AUTOVSCROLL, $WS_VSCROLL, $ES_MULTILINE, $WS_HSCROLL, $ES_NOHIDESEL))
	$Button1 = GUICtrlCreateButton("Find", 176, 288, 121, 33, 0)
	$Button2 = GUICtrlCreateButton("Find And Replace", 368, 288, 121, 33, 0)
	GUISetState(@SW_SHOW)

	While 1
		$msg = GUIGetMsg()
		Select
			Case $msg = $GUI_EVENT_CLOSE
				ExitLoop
			Case $msg = $Button1
				_GUICtrlEdit_Find($hEdit)
			Case $msg = $Button2
				_GUICtrlEdit_Find($hEdit, True)
			Case Else
				;;;;;;;
		EndSelect
	WEnd
	GUIDelete()
EndFunc   ;==>Example_Internal
