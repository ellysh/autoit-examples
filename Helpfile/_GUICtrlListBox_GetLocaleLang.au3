#include <GuiListBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hListBox

	; Create GUI
	GUICreate("List Box Get Locale Language identifier", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Show locale, country code, language identifier, primary language id, sub-language id
	MsgBox($MB_SYSTEMMODAL, "Information", _
			"Locale .................: " & _GUICtrlListBox_GetLocale($hListBox) & @CRLF & _
			"Country code ........: " & _GUICtrlListBox_GetLocaleCountry($hListBox) & @CRLF & _
			"Language identifier..: " & _GUICtrlListBox_GetLocaleLang($hListBox) & @CRLF & _
			"Primary Language id : " & _GUICtrlListBox_GetLocalePrimLang($hListBox) & @CRLF & _
			"Sub-Language id ....: " & _GUICtrlListBox_GetLocaleSubLang($hListBox))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
