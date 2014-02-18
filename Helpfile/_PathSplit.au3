#include <Array.au3>
#include <File.au3>

Local $sDrive = "", $sDir = "", $sFilename = "", $sExtension = ""
Local $aPathSplit = _PathSplit(@ScriptFullPath, $sDrive, $sDir, $sFilename, $sExtension)
_ArrayDisplay($aPathSplit, "_PathSplit of " & @ScriptFullPath)
