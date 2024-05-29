Scriptname DLC03:DLC03CoA_DiaNucVictorySermonScript extends Quest

float Property fFailSafeTimerLength = 24.0 Auto Const 
{Length of failsafe timer for victory speech}

Cell Property DLC03Nucleus Auto Const Mandatory
{Check to see if player's in Nucleus cell}

;Local vars
int iFailSafeTimerID = 1 Const

Event OnTimerGameTime(int aiTimerID)
	if aiTimerID == iFailSafeTimerID
		;If player's in the Nucleus cell, restart timer
		if Game.GetPlayer().GetParentCell() == DLC03Nucleus
			StartFailsafeTimer()
		else
			;Otherwise, shut this thang down
			SetStage(100)
		endif
	endif
EndEvent

Function StartFailsafeTimer()
	StartTimerGameTime(fFailSafeTimerLength, iFailSafeTimerID)
EndFunction

Function CancelFailsafeTimer()
	CancelTimerGameTime(iFailSafeTimerID)
EndFunction

