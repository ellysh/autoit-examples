#include <FTPEx.au3>

Local $hOpen = _FTP_Open('MyFTP Control')
; ...
Local $hFtpc = _FTP_Close($hOpen)
