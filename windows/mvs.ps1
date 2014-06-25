$SETTINGS_DIRECTORY_PATH = "$env:USERPROFILE\.m2\mvs-settings-files"

function getListOfSettingsFiles {
    return Get-ChildItem -path $SETTINGS_DIRECTORY_PATH
}

function printSettingsFilenameWithoutExtension($filename) {
    $filenamWithoutExtension = $filename.Name -replace ".xml$", ""
    Write-Host $filenamWithoutExtension -foregroundcolor "Gray"
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
