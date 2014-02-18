#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

; If you select the server button, start this script before and select the client button on:
; the second instance of this script OR on the example script UDPSend and vice versa.

Example()

Func Example()
	UDPStartup() ; Start the UDP service.

	; Register OnAutoItExit to be called when the script is closed.
	OnAutoItExitRegister("OnAutoItExit")

	; Assign Local variables the loopback IP Address and the Port.
	Local $sIPAddress = "127.0.0.1" ; This IP Address only works for testing on your own computer.
	Local $iPort = 65532 ; Port used for the connection.

	#region GUI
	Local $hGUI = GUICreate("UDPRecv", 150, 70)

	Local $iBtnServer = GUICtrlCreateButton("1. Server", 10, 10, 130, 22)

	Local $iBtnClient = GUICtrlCreateButton("2. Client", 10, 40, 130, 22)

	GUISetState(@SW_SHOW, $hGUI)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $iBtnServer
				GUISetState(@SW_DISABLE, $hGUI)
				_UDPRecv_Server($sIPAddress, $iPort)
				GUISetState(@SW_ENABLE, $hGUI)
			Case $iBtnClient
				GUISetState(@SW_DISABLE, $hGUI)
				_UDPRecv_Client($sIPAddress, $iPort)
				GUISetState(@SW_ENABLE, $hGUI)
		EndSwitch

		Sleep(10)
	WEnd

	GUIDelete($hGUI)
	#endregion GUI
EndFunc   ;==>Example

Func _UDPRecv_Server($sIPAddress, $iPort)
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
		; We are waiting for the string "toto" OR "tata" (example script UDPSend): 4 bytes length.
		$sReceived = UDPRecv($aSocket, 4)
	Until $sReceived <> ""

	; Notes: If you don't know how much length will be the data,
	; use e.g: 2048 for maxlen parameter and call the function until the it returns nothing/error.

	; Display the string received.
	MsgBox($MB_SYSTEMMODAL, "", "Server:" & @CRLF & "Received: " & $sReceived)

	; Close the socket.
	UDPCloseSocket($aSocket)
EndFunc   ;==>_UDPRecv_Server

Func _UDPRecv_Client($sIPAddress, $iPort)
	; Assign a Local variable the socket and connect to a Listening socket with the IP Address and Port specified.
	Local $aSocket = UDPOpen($sIPAddress, $iPort)
	Local $iError = 0

	; If an error occurred display the error code and return False.
	If @error Then
		; The server is probably offline/port is not opened on the server.
		$iError = @error
		MsgBox(BitOR($MB_SYSTEMMODAL, $MB_ICONHAND), "", "Client:" & @CRLF & "Could not connect, Error code: " & $iError)
		Return False
	EndIf

	; Send the string "toto" converted to binary to the server.
	UDPSend($aSocket, StringToBinary("toto"))

	; If an error occurred display the error code and return False.
	If @error Then
		$iError = @error
		MsgBox(BitOR($MB_SYSTEMMODAL, $MB_ICONHAND), "", "Client:" & @CRLF & "Could not send the data, Error code: " & $iError)
		Return False
	EndIf

	; Close the socket.
	UDPCloseSocket($aSocket)
EndFunc   ;==>_UDPRecv_Client

Func OnAutoItExit()
	UDPShutdown() ; Close the UDP service.
EndFunc   ;==>OnAutoItExit
