Maven settings switcher
=======================

Script for switching between many Maven settings files.

## Usage

For following examples let's assume that you have following settings files:

    ```
    another-settings.xml
    default.xml
    settings-used-in-the-office.xml
    ```
    
You have to copy ```mvs.ps1``` to some place visible in ```%PATH%``` to use this script from any place in Windows Powershell.
    
Beware that settings in ```%USERPROFILE%\.m2\settings.xml``` will be overwritten by this script.

### Store a settings file

Put settings file into ```%USERPROFILE%\.m2\mvs-settings-files``` directory (you should create it).

### List stored settings files

    ```
    mvs
    ```
    
The result will be (assuming that ```another-settings.xml``` is the current content of ```%USERPROFILE%\.m2\settings.xml```):

    ```
    another-settings <-- current settings.xml
    default
    settings-used-in-the-office
    ```

### Switch to a settings file

    ```
    mvs <settings file name without extension>
    ```
    
For example to switch to ```settings-used-in-the-office.xml``` you should type:

    ```
    mvs settings-used-in-the-office
    ```

### Show name of current settings file

    ```
    mvs
    ```
