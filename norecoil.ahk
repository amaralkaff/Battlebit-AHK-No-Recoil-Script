#NoEnv
#SingleInstance force
#maxthreadsperhotkey 5
#InstallKeybdHook
#InstallMouseHook
 
 
SendMode Input
SetKeyDelay, 0
SetMouseDelay, 0
 
;SetWorkingDir %A_ScriptDir%
;ScriptName := A_ScriptName
;StringReplace, ScriptName, ScriptName, .ahk,, All
;StringReplace, ScriptName, ScriptName, .exe,, All
 
;-------------------------------------------------------------------------------
;	Vars
;-------------------------------------------------------------------------------
 
rpm = 5
NoRecoil = 1
enough = 1
period = 0
;xhair = 0
 
 
PixelUp = pgup
PixelDown = pgdn
PixelLeft = del
PixelRight = end
ToggleNoRecoil = Numpad2
DelayUp = Numpad8
DelayDown = Numpad7
PeriodUp = 
PeriodDown = 
LargeRecoilPreset = Numpad0
SmallRecoilPreset = Numpad1 
MoveY = LButton
 
 
;-------------------------------------------------------------------------------
;	Hotkeys
;-------------------------------------------------------------------------------
 
Hotkey, ~*$%PixelLeft%, DoPixelLeft
Hotkey, ~*$%PixelRight%, DoPixelRight
Hotkey, ~*$%PixelUp%, DoPixelUp
Hotkey, ~*$%PixelDown%, DoPixelDown
HotKey, ~*$%ToggleNoRecoil%, DoToggleNoRecoil
HotKey, ~*$%DelayUp%, DoDelayUp
HotKey, ~*$%DelayDown%, DoDelayDown
HotKey, ~*$%PeriodUp%, DoPeriodUp
HotKey, ~*$%PeriodDown%, DoPeriodDown
HotKey, ~*$%LargeRecoilPreset%, GetFromINI
HotKey, ~*$%SmallRecoilPreset%, SaveToINI
HotKey, ~*$%MoveY%, DoMoveY
 
 
;-------------------------------------------------------------------------------
;	Functions
;-------------------------------------------------------------------------------
 
 
TipRPS(PopupText)
{
	Gui, Destroy
	Gui, +AlwaysOnTop +ToolWindow -SysMenu -Caption
	Gui, Color, 000000
	WinSet, Transparent, 100
	Gui, Font, s8, norm, Verdana
	Gui, Add, Text, x5 y5 c00ff00, %PopupText%
	Gui, Show, NoActivate X0 Y36
	
}
 
 
TipOn(PopupText)
{   
	Gui, Destroy
	Gui, +AlwaysOnTop +ToolWindow -SysMenu -Caption
	Gui, Color, 000000
	WinSet, Transparent, 100
	Gui, Font, s8, norm, Verdana
	Gui, Add, Text, x5 y5 c00ff00, %PopupText%
	Gui, Show, NoActivate X0 Y18
}
 
TipOff(PopupText)
{
	Gui, Destroy 
	Gui, +AlwaysOnTop +ToolWindow -SysMenu -Caption
	Gui, Color, 000000
	WinSet, Transparent, 100
	Gui, Font, s8, norm, Verdana
	Gui, Add, Text, x5 y5 cff0000, %PopupText%
	Gui, Show, NoActivate X0 Y54
}
 
 
;-------------------------------------------------------------------------------
;	Hotkey labels
;-------------------------------------------------------------------------------
 
TipClear:
	loop
	{
		Gui, Destroy
		sleep 5000
	}
return
 
DoToggleNoRecoil:
	if NoRecoil < 1
	{
		NoRecoil += 1
		if NoRecoil = 1
		{
			SoundBeep, 800, 200
			TipOn("ON")
			
			
		}
	}
	else
	{
		NoRecoil := 0
		SoundBeep, 200, 100
		SoundBeep, 200, 100
		TipOff("OFF")
	}
	return
 
DoPixelLeft:
        if pixelx < 1000
                 pixelx += 1
        TipOn("Pixel X Is " pixelX)
        return
 
DoPixelRight:
        if pixelx > -1000
                 pixelx -= 1
        TipOn("Pixel X Is " pixelX)
        return
 
DoPixelUp:
	if pixely < 1000
		pixely += 1
	TipOn("Pixel Y Is " pixelY)
	return
 
DoPixelDown:
	if pixely > -1000
		pixely -= 1
	TipOn("Pixel Y Is " pixelY)
	return
 
DoDelayUp:
	if rpm > 100
		rpm -= 1
	TipRPS("RPM: " rpm "  " "RPS:"  f(rpm)) 
	return
 
DoDelayDown:
	if rpm < 100
		rpm += 1
	TipRPS("RPM: " rpm "  " "RPS:"  f(rpm) )
	return
 
DoPeriodUp:
	if period > 100
		period -= 100
	TipOn("PERIOD IS " period)
	return
 
DoPeriodDown:
	if period < 6000
		period += 100
	TipOn("PERIOD IS " period)
	return
 
GetFromINI:
{
InputBox, WeaponCall, WeaponCall, , Show, 200, 100
if ErrorLevel	
	
return
 
else
IniRead,pixely,%A_WorkingDir%\config.ini,%WeaponCall%,Y
IniRead,pixelx,%A_WorkingDir%\config.ini,%WeaponCall%,X
IniRead,rpm,%A_WorkingDir%\config.ini,%WeaponCall%,rpm
TipRPS(" Loaded!!    Weapon : " WeaponCall " " "Y : "pixely "  " "X : "pixelx "  "  "RPM : " rpm) 
}
sleep 0
Gui, destroy
return
;put in name of weapon before write to INI, every preset can be saved seperate.
 
SaveToINI:   
{
 
InputBox, WeaponSend, WeaponSend, , Show, 200, 100,
if ErrorLevel	
	
return
 
else
IniWrite,%pixely%,%A_WorkingDir%\config.ini,%WeaponSend%,Y
IniWrite,%pixelx%,%A_WorkingDir%\config.ini,%WeaponSend%,X
IniWrite,%rpm%,%A_WorkingDir%\config.ini,%WeaponSend%,rpm
TipRPS(" Saved!!    Weapon :" WeaponSend " " "Y :" pixely "  " "X : " pixelx "  "  "RPM :" rpm)
}
sleep 0
Gui, Destroy
return
 
 
 
 
DoMoveY: 
	if NoRecoil = 1	
		{
			xhair = 0
			enough = 0
			GetKeyState, state, LButton, P
			if state = U
				return
		    sleep % f(rpm)
				loop
				{
					GetKeyState, state2, LButton, P
					if state2 = U
						break
					if enough = 1
						break
					DllCall("mouse_event", uint, 1, int, pixelx, int, pixely, uint, 0, int, 0)
					f(n)
                    {
				
					   return Round(100/n/1)
					}
					   sleep % f(rpm)	
				}
				
		}
	return