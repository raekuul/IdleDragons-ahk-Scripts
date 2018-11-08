target = IdleDragons.exe
delay = 5000
#1::
Loop
{
	ControlFocus,, ahk_exe %target% ;
	ControlSend,, {1}, ahk_exe %target% ;
	Sleep, %delay%
}
#2::
Loop
{
	ControlFocus,, ahk_exe %target% ;
	ControlSend,, {2}, ahk_exe %target% ;
	Sleep, %delay% ;
}

#3::
Loop
{
	ControlFocus,, ahk_exe %target% ;
	ControlSend,, {3}, ahk_exe %target% ;
	Sleep, %delay%
}
#4::
Loop
{
	ControlFocus,, ahk_exe %target% ;
	ControlSend,, {4}, ahk_exe %target% ;
	Sleep, %delay%
}
#5::
Loop
{
	ControlFocus,, ahk_exe %target% ;
	ControlSend,, {5}, ahk_exe %target% ;
	Sleep, %delay%
}
#6::
Loop
{
	ControlFocus,, ahk_exe %target% ;
	ControlSend,, {6}, ahk_exe %target% ;
	Sleep, %delay%
}
#7::
Loop
{
	ControlFocus,, ahk_exe %target% ;
	ControlSend,, {7}, ahk_exe %target% ;
	Sleep, %delay%
}
#8::
Loop
{
	ControlFocus,, ahk_exe %target% ;
	ControlSend,, {8}, ahk_exe %target% ;
	Sleep, %delay%
}
#9::
Loop
{
	ControlFocus,, ahk_exe %target% ;
	ControlSend,, {9}, ahk_exe %target% ;
	Sleep, %delay%
}
#0::
Loop
{
	ControlFocus,, ahk_exe %target% ;
	ControlSend,, {0}, ahk_exe %target% ;
	Sleep, %delay%
}