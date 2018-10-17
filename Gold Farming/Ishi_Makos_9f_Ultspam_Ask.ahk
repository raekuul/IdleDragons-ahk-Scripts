; NOTE: This script assumes Celeste's ult is on 2, Ishi's ult is on 4, and Makos's ult is on 8

target = IdleDragons.exe

Gui, Add, text, , Enter Ishi's Ult Cooldown Time
Gui, Add, text, , (This is found on Ishi's profile page)
Gui, Add, Edit, vNum
Gui, Add, text, , Enter the current time scale
Gui, Add, text, , (If no Speed potions are active, this is 1)
Gui, Add, Edit, vScale
Gui, Add, Button, default, OK
Gui, Show
Return

GuiClose:
ButtonOK:
Gui, Submit 

ishi := Num
delay := ((ishi + 5) * 1000) / scale
big := 330000 / scale
medium := 10000 / scale
small := 5000 / scale


; WIN+M - Ishi into Makos, with a zone advance follow-up. Used on the march.

#m:: 
Loop
{
	ControlFocus,, ahk_exe %target% ;
	ControlSend,, {4}, ahk_exe %target% ;
	Sleep, %medium%
	ControlSend,, {7}, ahk_exe %target% ;
	Sleep, %medium%
	ControlSend,, {Right}, ahk_exe %target% ;
	Sleep, %delay%
}

; WIN+C - Ishi into Makos, with a Celeste follow-up. Used at wall.

#c::
Loop
{
	ControlFocus,, ahk_exe %target% ;
	ControlSend,, {4}, ahk_exe %target% ;
	Sleep, %medium%
	ControlSend,, {7}, ahk_exe %target% ;
	Sleep, %medium%
	ControlSend,, {2}, ahk_exe %target% ;
	Sleep, %big%
}