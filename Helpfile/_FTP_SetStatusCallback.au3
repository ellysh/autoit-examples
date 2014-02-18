#include <FTPEx.au3>
#include <Debug.au3>

_DebugSetup(StringTrimRight(@ScriptName, 4) & ' example', True)

Local $sServer = 'ftp.mozilla.org'
Local $sUsername = ''
Local $sPass = ''

Local $hOpen = _FTP_Open('MyFTP Control')
Local $Callback = _FTP_SetStatusCallback($hOpen, 'FTPStatusCallbackHandler')

Local $hConn = _FTP_Connect($hOpen, $sServer, $sUsername, $sPass, 0, $INTERNET_DEFAULT_FTP_PORT, $INTERNET_SERVICE_FTP, 0, $Callback)

Local $Ftpc = _FTP_Close($hConn)
Local $Ftpo = _FTP_Close($hOpen)

Func FTPStatusCallbackHandler($hInternet, $iContext, $iInternetStatus, $pStatusInformation, $iStatusInformationLength)
	#forceref $hInternet, $iContext
	If $iInternetStatus = $INTERNET_STATUS_REQUEST_SENT Or $iInternetStatus = $INTERNET_STATUS_RESPONSE_RECEIVED Then
		Local $iBytesRead
		Local $tSize = DllStructCreate('dword')
		_WinAPI_ReadProcessMemory(_WinAPI_GetCurrentProcess(), $pStatusInformation, DllStructGetPtr($tSize), $iStatusInformationLength, $iBytesRead)
		_DebugOut(_FTP_DecodeInternetStatus($iInternetStatus) & ' | Size = ' & DllStructGetData($tSize, 1) & ' Bytes    Bytes read = ' & $iBytesRead)
	Else
		_DebugOut(_FTP_DecodeInternetStatus($iInternetStatus))
	EndIf
EndFunc   ;==>FTPStatusCallbackHandler
