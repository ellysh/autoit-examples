#include <InetConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Save the downloaded file to the temporary folder.
	Local $sFilePath = @TempDir & "\update.dat"

	; Download the file in the background with the selected option of 'force a reload from the remote site.'
	Local $hDownload = InetGet("http://www.autoitscript.com/autoit3/files/beta/update.dat", @TempDir & "\update.dat", $INET_FORCERELOAD, $INET_DOWNLOADBACKGROUND)

	; Wait for the download to complete by monitoring when the 2nd index value of InetGetInfo returns True.
	Do
		Sleep(250)
	Until InetGetInfo($hDownload, $INET_DOWNLOADCOMPLETE)

	; Retrieve details about the download file.
	Local $aData = InetGetInfo($hDownload)
	If @error Then Return SetError(1, 0, FileDelete($sFilePath)) ; If an error occurred the return from the function and delete the file.

	; Close the handle returned by InetGet.
	InetClose($hDownload)

	; Display details about the downloaded file.
	MsgBox($MB_SYSTEMMODAL, "", "Bytes read: " & $aData[$INET_DOWNLOADREAD] & @CRLF & _ ; Or use 0 instead of the constant.
			"Size: " & $aData[$INET_DOWNLOADSIZE] & @CRLF & _ ; Or use 1 instead of the constant.
			"Complete: " & $aData[$INET_DOWNLOADCOMPLETE] & @CRLF & _ ; Or use 2 instead of the constant.
			"successful: " & $aData[$INET_DOWNLOADSUCCESS] & @CRLF & _ ; Or use 3 instead of the constant.
			"@error: " & $aData[$INET_DOWNLOADERROR] & @CRLF & _ ; Or use 4 instead of the constant.
			"@extended: " & $aData[$INET_DOWNLOADEXTENDED] & @CRLF) ; Or use 5 instead of the constant.

	; Delete the file.
	FileDelete($sFilePath)
EndFunc   ;==>Example
