; this is designed around farming GRAND TOUR OF THE SWORD COAST - MAD WIZARD
; the framework can be reused for other campaigns

CoordMode, Mouse, Client

target = IdleDragons.exe

Gui, Add, text, , RESOLUTIONS OTHER THAN 1280x720 ARE NOT SUPPORTED
Gui, Add, text, , The keystroke to start this script is WIN+R`nThis does not change your active patron.
Gui, Add, text, , In the map, enable Hide Locked and Hide Completed.`nIn the adventure, set your level strategy to "UPG".
Gui, Add, text, , This script will load your 3rd saved formation, using the E hotkey.
Gui, Add, text, , This script assumes you have Deekin.`nThis script also assumes you have at least four familiars.
Gui, Add, text, , Minutes per run (starts from setting last familiar):
Gui, Add, Edit, vDduration_in_minutes
Gui, Add, Button, default, OK
Gui, Show
Return

GuiClose:
ButtonOK:
Gui, Submit 

duration_in_ms := (Dduration_in_minutes * 60 * 1000)

reset_yes_x = 550
reset_yes_y = 525

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
pan_top_y = 110
pan_bot_y = 600
ror_fp_y = 90 ; Ring of Regeneration free play
mw_fp_y = 180 ; Mad Wizard free play

go_x = 800
go_y = 550

fam_box_x = 670
fam_box_y = 540

fam_out_x = 945
fam_in_x = 875
fam_far_x = 1015

fam_top_out_y = 260
fam_top_in_y = 330
fam_bot_in_y = 395
fam_bot_out_y = 465

upgrade_y = 700
swap_y = 580
click_x = 155
slot1_x = 245
slot1u_x = 335


shop_x = 75
shop_y = 85

spec3_choice_left = 390
spec3_choice_middle = 635
spec3_choice_right = 885
spec3_choice_y = 575
spec3_cancel_x = 890
spec3_cancel_y = 110

charsheet_cancel_x = 1100
charsheet_cancel_y = 130

#r::
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
		Click %campaigns_x%, %kelv_y% ; Switch to Tomb of Annihilation...
		Sleep, 500 ;
		Click %campaigns_x%, %torm_y% ; ...and then back to Grand Tour (to reset the map)
		Sleep, 500 ;
		Click %neverwinter_x%, %neverwinter_y% ; The "map node" for Mad Wizard
		Sleep, 1000 ;
		Click %adventures_x%, %mw_fp_y% ; Mad Wizard Free Play marker
		Sleep, 500 ;
		Click %go_x%, %go_y%
		Sleep, 8500 ;
		Send e 
		
		Sleep, 130
		Send {f down}
		Sleep, 130
		Click %fam_far_x%, %fam_top_in_y%
		Sleep, 130
		Click %fam_out_x%, %fam_top_out_y%
		Sleep, 130
		Click %fam_in_x%, %fam_top_in_y%
		Sleep, 130 
		Click %click_x%, %upgrade_y%
		Sleep, 130
		Send {f up}

		Sleep, 4000
		
		Loop 9
		{
			Sleep, 130
			Click %slot1_x%, %upgrade_y% ;Deekin is eight upgrades off of Confidence in the Boss, requiring no Spec choice
		}
		Sleep, 130
		
		Click 360, %upgrade_y% ; Celeste
		Sleep, 130
		
		Click 475, %upgrade_y% ; Gromma
		Sleep, 130
		
		Click 590, %upgrade_y% ;Ishi
		Sleep, 130
		
		Click 705, %upgrade_y% ;Calliope
		Sleep, 130
		
		Click 820, %upgrade_y% ; Krond
		Sleep, 130

		Click 935, %upgrade_y% ; Minsc is three upgrades off of Boastful, requiring no spec choice
		Sleep, 130
		
		Click 1050, %upgrade_y% ;Nrakk
		Sleep, 130
			
		; Now we place our remaining familiars - we defer this to reduce number of variables in the champ upgrade process
		Send {f down}
		Sleep, 130
		Click %fam_in_x%, %fam_bot_in_y%
		Sleep, 130
		Click %fam_out_x%, %fam_bot_out_y%
		Sleep, 130
		Click %fam_far_x%, %fam_bot_in_y%
		Sleep, 130
		Send {f up}
		Sleep, 130

		Sleep, 130
		Send e
		Sleep, 1
		
		; Unblock input so the user can use their machine again.
		BlockInput, Off
		Sleep, %duration_in_ms%
	}
}