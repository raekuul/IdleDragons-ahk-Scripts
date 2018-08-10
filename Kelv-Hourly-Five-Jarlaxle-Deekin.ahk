; this is designed around farming TOMB OF ANNIHILATION - RING OF REGENERATION
; the framework can be reused for other campaigns
; I just went with Kelemvor because I have more favor there
; THIS IS DESIGNED AROUND 1280 by 720 RESOLUTION
target = IdleDragons.exe

hour = 3600000

reset_yes_x = 550
reset_yes_y = 500

go_to_map_x = 650
go_to_map_y = 600

campaigns_x = 105
torm_y = 100
kelv_y = 175

daggerford_x = 750
daggerford_y = 580

adventures_x = 400
kelv_fp_y = 195 ; Ring of Regeneration free play
torm_fp_y = 400 ; Mad Wizard free play

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
	ControlFocus,, ahk_exe %target% ;
	ControlSend,, {r}, ahk_exe %target% ;
	Sleep, 1000 ;
	Click %reset_yes_x%, %reset_yes_y% ;
	Sleep, 20000 ;
	Send ^+h ;
	Sleep, 3000 ;
	ControlFocus,, ahk_exe %target% ;
	Click %go_to_map_x%, %go_to_map_y% ;
	Sleep, 2000 ;
	Click %campaigns_x%, %kelv_y% ; 
	Sleep, 1000 ;
	Click %daggerford_x%, %daggerford_y% ;
	Sleep, 1000 ;
	Click %adventures_x%, %kelv_fp_y%
	Sleep, 1000 ;
	Click %go_x%, %go_y%
	Sleep, 20000 ;
	Click %fam_box_x%, %fam_box_y%, down
	Sleep, 200
	Click %click_x%, %upgrade_y%, up
	Sleep, 200
	Click %fam_box_x%, %fam_box_y%, down
	Sleep, 200
	Click %fam_out_x%, %fam_top_out_y%, up
	Sleep, 200
	Click %fam_box_x%, %fam_box_y%, down
	Sleep, 200
	Click %fam_in_x%, %fam_top_in_y%, up
	Sleep, 200
	Click %fam_box_x%, %fam_box_y%, down
	Sleep, 200
	Click %fam_in_x%, %fam_bot_in_y%, up
	Sleep, 200
	Click %fam_box_x%, %fam_box_y%, down
	Sleep, 200
	Click %slot4_x%, %upgrade_y%, up
	Sleep, 15000
	Click %spec2_choice_left%, %spec2_choice_y%
	Sleep, 1000
	Click %slot1_x%, %swap_y%
	Sleep, 1000
	Click %cswap_x%, %cswap_y%
	Sleep, 1000
	Send {Control Down}
	MouseClick, Left, %slot1_x%, %upgrade_y%
	Sleep 100
	Send {Control Up}
	Loop 8
	{
		Sleep, 1000
		Click %slot1u_x%, %upgrade_y%
	}
	Sleep, 1000
	MouseMove %shop_x%, %shop_y%
	Sleep, %hour%
}
