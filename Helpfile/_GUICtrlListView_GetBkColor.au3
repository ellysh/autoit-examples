#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <ColorConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hListView

	GUICreate("ListView Get BkColor", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Set colors
	_GUICtrlListView_SetBkColor($hListView, $CLR_MONEYGREEN)
	_GUICtrlListView_SetTextColor($hListView, $CLR_BLACK)
	_GUICtrlListView_SetTextBkColor($hListView, $CLR_MONEYGREEN)

	; Add columns
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; Add items
	_GUICtrlListView_BeginUpdate($hListView)
	For $iI = 1 To 10
		_GUICtrlListView_AddItem($hListView, "Item " & $iI)
	Next
	_GUICtrlListView_EndUpdate($hListView)

	; Show colors
	MsgBox($MB_SYSTEMMODAL, "Information", "Back Color ....: " & _GUICtrlListView_GetBkColor($hListView) & @CRLF & _
			"Text Color ....: " & _GUICtrlListView_GetTextColor($hListView) & @CRLF & _
			"Text Back Color: " & _GUICtrlListView_GetTextBkColor($hListView))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
