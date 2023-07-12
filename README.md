# Battlebit-AHK-No-Recoil-Script

<b>Yo, don't forget to hook me up with a head stars, bros. ★★★★★ </b>

![ezgif com-resize](https://github.com/amaralkaff/Battlebit-AHK-No-Recoil-Script/assets/104537377/42c838ab-46ca-455d-bec6-dc81bf2f7540)

The provided AutoHotKey (AHK) script is designed to create a "no recoil" effect in a game. The script uses various hotkeys and functions to control the behavior of the script.

To activate the AHK script with the specific controls you mentioned, follow these simplified steps:

1. Install AutoHotKey:
   - Download and install AutoHotKey from the official website: https://www.autohotkey.com/

2. Create a new AHK script:
   - Open a text editor (e.g., Notepad) and create a new file.
   - Copy and paste the following code into the text file:

```ahk
#NoEnv
#SingleInstance force
SendMode Input
SetKeyDelay, 0
SetMouseDelay, 0

PixelUp = pgup
PixelDown = pgdn
PixelLeft = del
PixelRight = end
ToggleNoRecoil = Numpad2
LargeRecoilPreset = Numpad0
SmallRecoilPreset = Numpad1

;-------------------------------------------------------------------------------
;	Hotkeys
;-------------------------------------------------------------------------------

Hotkey, ~*$%PixelLeft%, DoPixelLeft
Hotkey, ~*$%PixelRight%, DoPixelRight
Hotkey, ~*$%PixelUp%, DoPixelUp
Hotkey, ~*$%PixelDown%, DoPixelDown
HotKey, ~*$%ToggleNoRecoil%, DoToggleNoRecoil
HotKey, ~*$%LargeRecoilPreset%, GetFromINI
HotKey, ~*$%SmallRecoilPreset%, SaveToINI

DoToggleNoRecoil:
    NoRecoil := !NoRecoil
    SoundBeep, NoRecoil ? 800 : 200
    return

DoPixelLeft:
    SendInput, {Left}
    return

DoPixelRight:
    SendInput, {Right}
    return

DoPixelUp:
    SendInput, {Up}
    return

DoPixelDown:
    SendInput, {Down}
    return

GetFromINI:
    InputBox, WeaponCall, WeaponCall, , Show, 200, 100
    if ErrorLevel
        return
    IniRead, X, config.ini, %WeaponCall%, X
    IniRead, Y, config.ini, %WeaponCall%, Y
    IniRead, RPM, config.ini, %WeaponCall%, RPM
    MsgBox, Loaded!! Weapon: %WeaponCall% | X: %X% | Y: %Y% | RPM: %RPM%
    return

SaveToINI:
    InputBox, WeaponSend, WeaponSend, , Show, 200, 100
    if ErrorLevel
        return
    IniWrite, %PixelLeft%, config.ini, %WeaponSend%, X
    IniWrite, %PixelUp%, config.ini, %WeaponSend%, Y
    IniWrite, 0, config.ini, %WeaponSend%, RPM
    MsgBox, Saved!! Weapon: %WeaponSend% | X: %PixelLeft% | Y: %PixelUp% | RPM: 0
    return
```

3. Save the script:
   - Save the file with a ".ahk" extension (e.g., "norecoil.ahk").

4. Run the script:
   - Double-click on the saved AHK script file.
   - The script should start running, and an AHK icon will appear in the system tray (usually located near the clock on the taskbar).

5. Test the script:
   - Open a game or any application where you want to use the script.
   - Use the following controls to adjust the script behavior:
     - Page Up: Pulls the mouse down
     - Page Down: Pulls the mouse up
     - Delete: Pulls the mouse to the right
     - End: Pulls the mouse to the left
     - Numpad 2: Toggles the script on and off
     - Numpad 1: Saves settings to an .ini file
     - Numpad 0: Loads settings from the .ini file (use the proper names as you save and load)

Lupenhagen
