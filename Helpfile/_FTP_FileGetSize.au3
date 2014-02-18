#include <FTPEx.au3>

Local $sServer = 'ftp.csx.cam.ac.uk'
Local $sUsername = ''
Local $sPass = ''

Local $hOpen = _FTP_Open('MyFTP Control')
Local $hConn = _FTP_Connect($hOpen, $sServer, $sUsername, $sPass)

Local $h_Handle
Local $aFile = _FTP_FindFileFirst($hConn, "/pub/software/programming/pcre/", $h_Handle)
ConsoleWrite('$Filename = ' & $aFile[10] & ' attribute = ' & $aFile[1] & '  -> Error code: ' & @error & ' extended: ' & @extended & @CRLF)

Local $dirset = _FTP_DirSetCurrent($hConn, "/pub/software/programming/pcre/")
ConsoleWrite('$dirset = ' & $dirset & '  -> Error code: ' & @error & ' extended: ' & @extended & @CRLF)

Local $FileSize = _FTP_FileGetSize($hConn, $aFile[10])
ConsoleWrite('$Filename = ' & $aFile[10] & ' size = ' & $FileSize & '  -> Error code: ' & @error & ' extended: ' & @extended & @CRLF)

Local $Err, $Message
$FileSize = _FTP_GetLastResponseInfo($Err, $Message) ; error =  Contrib: Not a regular file
ConsoleWrite('$Message = ' & $Message & ' err = ' & $Err & '  -> Error code: ' & @error & ' extended: ' & @extended & @CRLF)

$aFile = _FTP_FindFileNext($h_Handle)
ConsoleWrite('$FilenameNext1 = ' & $aFile[10] & ' attribute = ' & $aFile[1] & '  -> Error code: ' & @error & ' extended: ' & @extended & @CRLF)

$FileSize = _FTP_FileGetSize($hConn, $aFile[10])
ConsoleWrite('$FilenameNext1 = ' & $aFile[10] & ' size = ' & $FileSize & '  -> Error code: ' & @error & ' extended: ' & @extended & @CRLF)

$FileSize = _FTP_GetLastResponseInfo($Err, $Message) ; no error
ConsoleWrite('$Message = ' & $Message & ' err = ' & $Err & '  -> Error code: ' & @error & ' extended: ' & @extended & @CRLF)

Local $FindClose = _FTP_FindFileClose($h_Handle)

Local $Ftpc = _FTP_Close($hConn)
Local $Ftpo = _FTP_Close($hOpen)
