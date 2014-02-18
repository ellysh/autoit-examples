#include <GuiListBox.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hListBox

	; Create GUI
	GUICreate("List Box Update HScroll", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296, BitOR($LBS_NOTIFY, $LBS_SORT, $WS_HSCROLL, $WS_VSCROLL))
	GUISetState(@SW_SHOW)

	; Add long string
	_GUICtrlListBox_AddString($hListBox, "AutoIt v3 is a freeware BASIC-like scripting language designed for automating the Windows GUI.")

	; Show current horizontal extent
	MsgBox($MB_SYSTEMMODAL, "Information", "Horizontal Extent: " & _GUICtrlListBox_GetHorizontalExtent($hListBox))

	; Adjust horizontal scroll bars
	_GUICtrlListBox_UpdateHScroll($hListBox)

	; Show current horizontal extent
	MsgBox($MB_SYSTEMMODAL, "Information", "Horizontal Extent: " & _GUICtrlListBox_GetHorizontalExtent($hListBox))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
