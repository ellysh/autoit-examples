#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hListView

	GUICreate("ListView Get Unicode Format", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Add columns
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; Set Unicode format
	MsgBox($MB_SYSTEMMODAL, "Information", "Unicode: " & _GUICtrlListView_GetUnicodeFormat($hListView))
	_GUICtrlListView_SetUnicodeFormat($hListView, True)
	MsgBox($MB_SYSTEMMODAL, "Information", "Unicode: " & _GUICtrlListView_GetUnicodeFormat($hListView))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
