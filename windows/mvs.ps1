$SETTINGS_DIRECTORY_PATH = "$env:USERPROFILE\.m2\mvs-settings-files"
$TARGET_SETTING_FILENAME = "settings.xml"
$TARGET_SETTINGS_FILE_PATH = "$env:USERPROFILE\.m2\$TARGET_SETTING_FILENAME"

function getListOfSettingsFiles {
    return Get-ChildItem -Path $SETTINGS_DIRECTORY_PATH
}

function calculateHash($filePath) {
    $md5Provider = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
    $hash = $md5Provider.ComputeHash([System.IO.File]::ReadAllBytes($filePath))
    return [System.BitConverter]::ToString($hash)
}

function isGivenFileEqualToTargetSettingsFile($filePath) {
    $hashOfGivenFile = calculateHash $filePath
    $hashOfTargetSettingsFile = calculateHash $TARGET_SETTINGS_FILE_PATH
    return $hashOfGivenFile -eq $hashOfTargetSettingsFile
}

function printSettingsFilenameWithoutExtension($filename) {
    $filenamWithoutExtension = $filename.Name -replace ".xml$", ""
    if (isGivenFileEqualToTargetSettingsFile $SETTINGS_DIRECTORY_PATH\$filename) {
        Write-Host "$filenamWithoutExtension" -ForegroundColor "Green" -NoNewLine
        Write-Host " <-- current $TARGET_SETTING_FILENAME" -foregroundcolor "White"
    } else {
        Write-Host $filenamWithoutExtension -ForegroundColor "Red"
    }
}

function printListOfeSettingsFilenames {
    $filenames = getListOfSettingsFiles
    foreach ($filename in $filenames) {
        if ($filename.Attributes -ne "Directory") {
            printSettingsFilenameWithoutExtension $filename
        }
    }
}

printListOfeSettingsFilenames
