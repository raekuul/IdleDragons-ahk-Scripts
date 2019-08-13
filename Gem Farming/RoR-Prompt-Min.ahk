; this is designed around farming TOMB OF ANNIHILATION - RING OF REGENERATION
; the framework can be reused for other campaigns
; I just went with Kelemvor because I have more favor there
; THIS IS DESIGNED AROUND 1280 by 720 RESOLUTION
target = IdleDragons.exe

Gui, Add, text, , RESOLUTIONS OTHER THAN 1280x720 ARE NOT SUPPORTED
Gui, Add, text, , In the map, enable Hide Locked and Hide Completed.`nIn the adventure, set your level strategy to "UPG".
Gui, Add, text, , This script will not load any saved formations.
Gui, Add, text, , This is a minimal script that uses only familiars and Deekin.`nThis script assumes you have at least four familiars.
Gui, Add, text, , Minutes per run (starts from setting last familiar):
Gui, Show
Return

GuiClose:
ButtonOK:
Gui, Submit 

duration_in_ms := Dduration_in_minutes * 60 * 1000

reset_yes_x = 550
reset_yes_y = 500

go_to_map_x = 650
go_to_map_y = 600

campaigns_x = 105
torm_y = 100
kelv_y = 175

neverwinter_x = 500
neverwinter_y = 685

daggerford_x = 750
daggerford_y = 580

adventures_x = 400
ror_fp_y = 195 ; Ring of Regeneration free play
mw_fp_y = 400 ; Mad Wizard free play

go_x = 800
go_y = 550

fam_box_x = 665
fam_box_y = 540

fam_out_x = 945
fam_in_x = 875
fam_top_out_y = 260
fam_top_in_y = 330
fam_bot_in_y = 395
fam_bot_out_y = 465

upgrade_y = 700
swap_y = 580
click_x = 155
slot1_x = 245
slot1u_x = 335
slot4_x = 585
cswap_x = 405
cswap_y = 485

shop_x = 75
shop_y = 85

spec2_choice_left = 510
spec2_choice_right = 765
spec2_choice_y = 575
spec2_cancel_x = 890
spec2_cancel_y = 110

CoordMode, Mouse, Client

#r::
Loop
{
	; RESET
	ControlFocus,, ahk_exe %target% ;
	ControlSend,, {r}, ahk_exe %target% ;
	Sleep, 1000 ;
	Click %reset_yes_x%, %reset_yes_y% ;
	Sleep, 20000 ;
	Send ^+h ; Take a screenshot with ShareX of the results screen. If you don't have ^+h set for ShareX, remove this line and the next sleep
	Sleep, 3000 ;
	ControlFocus,, ahk_exe %target% ;
	Click %go_to_map_x%, %go_to_map_y% ;
	Sleep, 2000 ;
	Click %campaigns_x%, %kelv_y% ; Switch to Tomb of Annihilation...
	Sleep, 200 ;
	Click %campaigns_x%, %torm_y% ; ...and then back to Grand Tour (to reset the map)
	Sleep, 200 ;
	Click %neverwinter_x%, %neverwinter_y% ; The location marker for Mad Wizard
	Sleep, 1000 ;
	Click %adventures_x%, %pan_top_y%, down
	Sleep, 300 ;
	Click %adventures_x%, %pan_bot_y%, up
	Sleep, 300 ;
	Click %adventures_x%, %mw_fp_y% ; Mad Wizard Free Play marker
	Sleep, 200 ;
	Click %go_x%, %go_y%
	Sleep, 8500 ;
	ControlSend,, {f down}, ahk_exe %target%
	Sleep, 100 
	Click %fam_far_x%, %fam_top_in_y%
	Sleep, 100
	Click %fam_out_x%, %fam_top_out_y%
	Sleep, 100
	Click %fam_in_x%, %fam_top_in_y%
	Sleep, 100
	ControlSend,, {f up}, ahk_exe %target%
	
	Loop 9
	{
		Sleep, 100
		Click %slot1_x%, %upgrade_y% ;Deekin is eight upgrades off of Confidence in the Boss, requiring no Spec choice
	}
	Sleep, 100
	
	; Now we place our remaining familiars - we defer this to reduce number of variables in the champ upgrade process
	ControlSend,, {f down}, ahk_exe %target%
	Sleep, 100
	Click %click_x%, %upgrade_y%
	Sleep, 100
	Click %fam_in_x%, %fam_bot_in_y%
	Sleep, 100
	Click %fam_out_x%, %fam_bot_out_y%
	Sleep, 100
	Click %fam_far_x%, %fam_bot_in_y%
	Sleep, 100
	ControlSend,, {f up}, ahk_exe %target%
	Sleep, 1000

	Sleep, 100
	ControlSend,, {e}, ahk_exe %target% 
	Sleep, 100
	Sleep, %duration_in_ms%
}
