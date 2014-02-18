#include <GuiListBox.au3>
#include <WinAPI.au3>
#include <GUIConstantsEx.au3>
#include <WinAPILangConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iLocale, $hListBox

	; Create GUI
	GUICreate("List Box Set Locale", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	$iLocale = _WinAPI_MAKELCID(_WinAPI_MAKELANGID($LANG_DUTCH, $SUBLANG_DUTCH), $SORT_DEFAULT)

	MsgBox($MB_SYSTEMMODAL, "Information", "Previous Locale: " & _GUICtrlListBox_SetLocale($hListBox, $iLocale))

	$iLocale = _WinAPI_MAKELCID(_WinAPI_MAKELANGID($LANG_ENGLISH, $SUBLANG_ENGLISH_US), $SORT_DEFAULT)

	MsgBox($MB_SYSTEMMODAL, "Information", "Previous Locale: " & _GUICtrlListBox_SetLocale($hListBox, $iLocale))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
