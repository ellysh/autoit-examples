#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

; If you select the client button, start this script after and select the server button on:
; the second instance of this script OR on the script UDPRecv and vice versa.

Example()

Func Example()
	UDPStartup() ; Start the UDP service.

	; Register OnAutoItExit to be called when the script is closed.
	OnAutoItExitRegister("OnAutoItExit")

	; Assign Local variables the loopback IP Address and the Port.
	Local $sIPAddress = "127.0.0.1" ; This IP Address only works for testing on your own computer.
	Local $iPort = 65532 ; Port used for the connection.

	#region GUI
	Local $hGUI = GUICreate("UDPSend", 150, 70)

	Local $iBtnClient = GUICtrlCreateButton("2. Client", 10, 10, 130, 22)

	Local $iBtnServer = GUICtrlCreateButton("1. Server", 10, 40, 130, 22)

	GUISetState(@SW_SHOW, $hGUI)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $iBtnClient
				GUISetState(@SW_DISABLE, $hGUI)
				_UDPSend_Client($sIPAddress, $iPort)
				GUISetState(@SW_ENABLE, $hGUI)
			Case $iBtnServer
				GUISetState(@SW_DISABLE, $hGUI)
				_UDPSend_Server($sIPAddress, $iPort)
				GUISetState(@SW_ENABLE, $hGUI)
		EndSwitch

		Sleep(10)
	WEnd

	GUIDelete($hGUI)
	#endregion GUI
EndFunc   ;==>Example

Func _UDPSend_Client($sIPAddress, $iPort)
	; Assign a Local variable the socket and connect to a Listening socket with the IP Address and Port specified.
	Local $iError = @error
	Local $aSocket = UDPOpen($sIPAddress, $iPort)

	; If an error occurred display the error code and return False.
	If @error Then
		$iError = @error
		MsgBox(BitOR($MB_SYSTEMMODAL, $MB_ICONHAND), "", "Client:" & @CRLF & "Could not connect, Error code: " & $iError)
		Return False
	EndIf

	; Send the string "tata" to the server.
	UDPSend($aSocket, "tata")

	; If an error occurred display the error code and return False.
	If @error Then
		$iError = @error
		MsgBox(BitOR($MB_SYSTEMMODAL, $MB_ICONHAND), "", "Client:" & @CRLF & "Could not send the data, Error code: " & $iError)
		Return False
	EndIf

	; Close the socket.
	UDPCloseSocket($aSocket)
EndFunc   ;==>_UDPSend_Client

Func _UDPSend_Server($sIPAddress, $iPort)
	; Assign a Local variable the socket and bind to the IP Address and Port specified.
	Local $aSocket = UDPBind($sIPAddress, $iPort)

	; If an error occurred display the error code and return False.
	If @error Then
		; Someone is probably already binded on this IP Address and Port (script already running?).
		Local $iError = @error
		MsgBox(BitOR($MB_SYSTEMMODAL, $MB_ICONHAND), "", "Server:" & @CRLF & "Could not bind, Error code: " & $iError)
		Return False
	EndIf

	; Assign a Local variable to store the data received.
	Local $sReceived = ""

	Do
		; We are waiting for the string "tata" OR "toto" (example script UDPRecv): 4 bytes length.
		$sReceived = UDPRecv($aSocket, 4)
	Until $sReceived <> ""

	; Notes: If you don't know how much length will be the data,
	; use e.g: 2048 for maxlen parameter and call the function until the it returns nothing/error.

	; Display the string received.
	MsgBox($MB_SYSTEMMODAL, "", "Server:" & @CRLF & "Received: " & $sReceived)

	; Close the socket.
	UDPCloseSocket($aSocket)
EndFunc   ;==>_UDPSend_Server

Func OnAutoItExit()
	UDPShutdown() ; Close the UDP service.
EndFunc   ;==>OnAutoItExit
