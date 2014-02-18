#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hImage, $hListView

	GUICreate("ListView Get ISearch", 400, 300)

	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUICtrlSetStyle($hListView, $LVS_ICON)
	GUISetState(@SW_SHOW)

	; Load images
	$hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0xFF0000, 16, 16))
	_GUICtrlListView_SetImageList($hListView, $hImage, 0)

	_GUICtrlListView_BeginUpdate($hListView)
	For $x = 1 To 10
		_GUICtrlListView_InsertItem($hListView, "Item " & $x, -1, 0)
	Next
	_GUICtrlListView_EndUpdate($hListView)

	Send("Item 1")

	; Get incremental search string
	MsgBox($MB_SYSTEMMODAL, "Information", "Incremental Search String: " & _GUICtrlListView_GetISearchString($hListView))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>Example
