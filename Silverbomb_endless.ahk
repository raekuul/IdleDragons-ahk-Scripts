; this is designed around farming A GRAND TOUR OF THE SWORD COAST - WATERDEEP DETOURS
; the framework can be reused for other campaigns
; NOTE: This will farm Lost in the Deep if that has not been completed yet!

; THIS IS DESIGNED AROUND 1280 by 720 RESOLUTION

target = IdleDragons.exe

;silver chests only drop three cards
y1 = 185
x1 = 475
x2 = 735
x3 = 975

y2 = 565
x4 = 600
x5 = 860

next_x = 730
next_y = 420

CoordMode, Mouse, Client

Esc::
BreakLoop = 1
return

Loop
{
	if (%BreakLoop% = 1)
		break
	ControlFocus,, ahk_exe %target% ;
	Click %next_x%, %next_y%
	Sleep, 1500 ;
	Click %x1%, %y1% ;
	Sleep, 500 ;
	Click %x2%, %y1% ;
	Sleep, 500 ;
	Click %x3%, %y1% ;
	Sleep, 500 ;
}
