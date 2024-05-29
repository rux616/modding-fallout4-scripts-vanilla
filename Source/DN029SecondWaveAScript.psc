Scriptname DN029SecondWaveAScript extends Quest Hidden

Quest Property MS11 Auto Const
Quest Property DN029SecondWaveA Auto Const
ReferenceAlias[] Property AttackerArray Auto Const
Ammo Property AmmoMissile Auto Const
Weapon Property MissileLauncher Auto Const
Scene Property MS11_0810_WeHaveBoarders Auto Const



Function StartAttackTimer()
	;debug.Notification("Timer Started!")
	if DN029SecondWaveA.GetStageDone(100) == 0
		if DN029SecondWaveA.GetStageDone(500) == 0
			StartTimer(30)
		endif
	endif
EndFunction



Event OnTimer(int aiTimerID)
	if DN029SecondWaveA.GetStageDone(100) == 0
		if DN029SecondWaveA.GetStageDone(500) == 0

;ONLY FOR PRESENTATION!!!!!!!
			;DN029SecondWaveA.SetStage(400)

			int AttackerToSet = utility.RandomInt(0, AttackerArray.length - 1)
			;debug.Notification("Array has a length of " + (AttackerArray.length - 1))
		    (AttackerArray[AttackerToSet] as DN029SecondWaveAAttakerScript).TryToEnterShip = TRUE
		    AttackerArray[AttackerToSet].GetActorReference().StopCombat()
		    AttackerArray[AttackerToSet].GetActorReference().EvaluatePackage()
		    ;Warn player that a scavengers is heading for the ship
		    if !MS11.GetStageDone(810)
		    	MS11.SetStage(810)
		    endif
		    MS11_0810_WeHaveBoarders.Start()
		    ;debug.Notification("Timer ended, sending attacker number " + AttackerToSet + " toward the ship! " + Attackerarray[AttackerToSet].GetReference())
		    debug.Trace("Timer ended, sending attacker number " + AttackerToSet + " toward the ship! " + Attackerarray[AttackerToSet].GetReference())
		    StartAttackTimer()
		endif
	endif
EndEvent
