; this is designed around farming TOMB OF ANNIHILATION - RING OF REGENERATION
; the framework can be reused for other campaigns

CoordMode, Mouse, Client

target = IdleDragons.exe

Gui, Add, text, , RESOLUTIONS OTHER THAN 1280x720 ARE NOT SUPPORTED
Gui, Add, text, , The keystroke to start this script is CTRL+R`nThis does not change your active patron.
Gui, Add, text, , In the map, enable Hide Locked and Hide Completed.`nIn the adventure, set your level strategy to "UPG".
Gui, Add, text, , This script will not load any saved formations.
Gui, Add, text, , This script assumes you have Minsc, Sentry and Shandie.`nThis script also assumes you have at least four familiars.
Gui, Add, text, , Minutes per run (starts from setting last familiar):
Gui, Add, Edit, vDduration_in_minutes
Gui, Add, Button, default, OK
Gui, Show
Return

GuiClose:
ButtonOK:
Gui, Submit 

duration_in_ms := Dduration_in_minutes * 60 * 1000

reset_yes_x = 550
reset_yes_y = 520

go_to_map_x = 650
go_to_map_y = 600

campaigns_x = 105
torm_y = 100
kelv_y = 175

neverwinter_x = 500
neverwinter_y = 685

daggerford_x = 640
daggerford_y = 420

adventures_x = 400
ror_fp_y = 90 ; Ring of Regeneration free play
mw_fp_y = 180 ; Mad Wizard free play

go_x = 800
go_y = 590

fam_box_x = 665
fam_box_y = 540

fam_left_x = 875
fam_mid_x = 945
fam_right_x = 1015

fam_top_y = 260
fam_up_mid_y = 330
fam_down_mid_y = 395
fam_bot_y = 465

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
spec3_choice_left = 385
spec3_choice_mid = 640
spec3_choice_right = 900

spec2_choice_y = 575
spec2_cancel_x = 890
spec2_cancel_y = 110

charsheet_cancel_x = 1100
charsheet_cancel_y = 130

CoordMode, Mouse, Client

^r::
Loop
{
	test := WinExist("Idle Champions")
	if (test == 0)
	{
		ExitApp
	}
	else
	{
		
		; If you're looking this closely at the code, judge for yourself if running this script
		; as an Administrator is a worthwhile risk just to prevent you from hijacking yourself.

		BlockInput, On
		
		; RESET
		Sleep, 1
		WinActivate, Idle Champions
		Sleep, 1000
		Send r ;
		Sleep, 1000 ;
		Click %reset_yes_x%, %reset_yes_y% ;
		Sleep, 22000 ;
		Click %go_to_map_x%, %go_to_map_y% ;
		Sleep, 3000 ;
		Click %campaigns_x%, %torm_y% ; Switch to Grand Tour...
		Sleep, 500 ;
		Click %campaigns_x%, %kelv_y% ; ...and then back to Tomb of Annihilation (to reset the map)
		Sleep, 500 ;
		Click %daggerford_x%, %daggerford_y% ; The "map node" for Ring of Regeneration
		Sleep, 500 ;
		Click %adventures_x%, %ror_fp_y% ; Ring of Regeneration Free Play marker
		Sleep, 500 ;
		Click %go_x%, %go_y%
		Sleep, 8500 ;
		
		Sleep, 200
		Send {f down}
		Sleep, 200
		Click %fam_mid_x%, %fam_top_y%
		Sleep, 200
		Click %fam_left_x%, %fam_up_mid_y%
		Sleep, 200
		Click %fam_left_x%, %fam_down_mid_y%
		Sleep, 200 
		Click %click_x%, %upgrade_y%
		Sleep, 200
		Click %fam_mid_x%, %fam_bot_y%
		Sleep, 200
		Click %fam_right_x%, %fam_up_mid_y%
		Sleep, 200
		Click %fam_right_x%, %fam_down_mid_y%
		Sleep, 200
		Send {f up}
		Loop 18
		{
			Sleep, 200
			Click 620, %upgrade_y% ; Sentry is sixteen upgrades off of Echo's Will, requiring one spec choice
		}	
		Sleep, 1000
		Click %spec3_choice_mid%, %spec2_choice_y%
		Sleep, 1000
		Click %charsheet_cancel_x%, %charsheet_cancel_y%
		Sleep, 200
		Loop 18
		{
			Sleep, 200
			Click 820, %upgrade_y% ; Shandie is eighteen upgrades off of Ranger Training, requiring one spec choice
		}	
		Sleep, 1000
		Click %spec3_choice_left%, %spec2_choice_y%
		Sleep, 1000
		Click %charsheet_cancel_x%, %charsheet_cancel_y%
		Sleep, 200
		Loop 5
		{
			Sleep, 200
			Click 930, %upgrade_y% ; Minsc is four upgrades off of Boastful, requiring no spec choice.
		}	
		Sleep, 1

		
		; Unblock input so the user can use their machine again.
		BlockInput, Off
		Sleep, %duration_in_ms%
	}
}