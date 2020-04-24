; NOTE: This script assumes Celeste's ult is on 2, and Makos's ult is on 8

target = IdleDragons.exe

Gui, Add, text, , WIN+m: Makos Ult + Zone Advance
Gui, Add, text, , WIN+c: Makos Ult + Celeste Ult, wait for Makos
Gui, Add, text, , WIN+e: Makos Ult + Celeste Ult, wait five minutes
Gui, Add, text, , Enter Makos's Ult Cooldown Time
Gui, Add, text, , (This is found on Makos's profile page)
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

Makos := Num
delay := (Makos + 5) * 1000
delay_scaled := delay / Scale
enrage := 340000 / Scale

; WIN+M - Makos, with a zone advance follow-up. Used on the march.

#m:: 
Loop
{
	ControlFocus,, ahk_exe %target% ;
	ControlSend,, {8}, ahk_exe %target% ;
	Sleep, 5000
	ControlSend,, {Right}, ahk_exe %target% ;
	Sleep, %delay_scaled%
}

; WIN+C - Makos, with a Celeste follow-up. Used at wall.

#c::
Loop
{
	ControlFocus,, ahk_exe %target% ;
	ControlSend,, {8}, ahk_exe %target% ;
	Sleep, 5000
	ControlSend,, {2}, ahk_exe %target% ;
	Sleep, %delay_scaled%
}

; WIN+E - Makos, with a Celeste follow-up, then wait for the mobs to fill up. Use at your own risk!

#e::
Loop
{
	ControlFocus,, ahk_exe %target% ;
	ControlSend,, {8}, ahk_exe %target% ;
	Sleep, 5000
	ControlSend,, {2}, ahk_exe %target% ;
	Sleep, %enrage%
}