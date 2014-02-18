#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hListView

	GUICreate("ListView Get Header", 400, 300)
	$hListView = GUICtrlCreateListView("col1|col2|col3", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	MsgBox($MB_SYSTEMMODAL, "Information", "ListView Header Handle: 0x" & Hex(_GUICtrlListView_GetHeader($hListView)) & @CRLF & _
			"IsPtr = " & IsPtr(_GUICtrlListView_GetHeader($hListView)) & " IsHWnd = " & IsHWnd(_GUICtrlListView_GetHeader($hListView)))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>Example
