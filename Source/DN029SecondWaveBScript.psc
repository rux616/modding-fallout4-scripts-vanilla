Scriptname DN029SecondWaveBScript extends Quest Hidden Conditional

Quest Property DN029SecondWaveA Auto Const
Quest Property DN029SecondWaveB Auto Const
Quest Property MS11 Auto Const
ReferenceAlias[] Property AttackerArray Auto Const
Scene Property MS11_AttackersOnSecondFloor Auto Const
Scene Property MS11_AttackersOnThirdFloor Auto Const
Scene Property MS11_AttackersOnTopDeck Auto Const

Int MaxPhase = 4
Int Property CurrentPhase = 1 Auto Conditional


Function StartPhaseTimer()
	;debug.Notification("Starting Phase Timer!")
	if DN029SecondWaveA.GetStageDone(100) == 0
		StartTimer(40, 1)
	endif
EndFunction


Function StartTryForDeckTimer()
	;debug.Notification("Timer Started!")
	if DN029SecondWaveA.GetStageDone(100) == 0
		if CurrentPhase < 5
			StartTimer(30, 2)
		endif
	endif
EndFunction


Event OnTimer(int aiTimerID)
	if aiTimerID == 1 ;PHASE TIMER

	    if CurrentPhase < MaxPhase
	    	CurrentPhase = CurrentPhase + 1

	    	;debug.Notification("Now in Phase " + CurrentPhase + "/" + MaxPhase + ". Moving Position Forward!")
	    	if CurrentPhase < MaxPhase
	    		StartPhaseTimer()
	    	endif
	    	if CurrentPhase == MaxPhase
	    		StartTryForDeckTimer()
	    	endif

	    	if CurrentPhase == 2
	    		if MS11.GetStageDone(900) == 0
	    			MS11_AttackersOnSecondFloor.Start()
	    		endif
	    		((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[1]).MoveTo((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[1].GetNthLinkedRef(1))
	    		((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[2]).MoveTo((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[2].GetNthLinkedRef(1))
	    		((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[3]).MoveTo((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[3].GetNthLinkedRef(1))
	    	endif

	    	if CurrentPhase == 3
	    		if MS11.GetStageDone(900) == 0
	    			MS11_AttackersOnThirdFloor.Start()
	    		endif
	    	endif

	    	if CurrentPhase == 4
	    		if MS11.GetStageDone(900) == 0
	    			MS11_AttackersOnTopDeck.Start()
	    		endif
	    		((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[1]).MoveTo((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[1].GetNthLinkedRef(2))
	    		((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[2]).MoveTo((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[2].GetNthLinkedRef(2))
	    		((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[3]).MoveTo((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[3].GetNthLinkedRef(2))
	    	endif

	    	EVPAllAttackers()
	    endif

	elseif aiTimerID == 2 ;DECK TIMER
		if CurrentPhase < 5
			int AttackerToSet = utility.RandomInt(0, AttackerArray.length - 1)
			;debug.Notification("Array has a length of " + (AttackerArray.length - 1))
		    (AttackerArray[AttackerToSet] as DN029SecondWaveBAttackerScript).TryToReachDeck = TRUE
		    AttackerArray[AttackerToSet].GetActorReference().StopCombat()
		    AttackerArray[AttackerToSet].GetActorReference().EvaluatePackage()
		    ;debug.Notification("Timer ended, sending attacker number " + (AttackerToSet + 1) + " toward the deck!")
		    StartTryForDeckTimer()
		endif
	endif
EndEvent


Function PlayerUpdatePhase()
	if CurrentPhase == 2
		((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[1]).MoveTo((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[1].GetNthLinkedRef(1))
		((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[2]).MoveTo((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[2].GetNthLinkedRef(1))
		((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[3]).MoveTo((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[3].GetNthLinkedRef(1))
		EVPAllAttackers()
	endif

	if CurrentPhase == 4
		((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[1]).MoveTo((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[1].GetNthLinkedRef(2))
		((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[2]).MoveTo((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[2].GetNthLinkedRef(2))
		((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[3]).MoveTo((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[3].GetNthLinkedRef(2))
		EVPAllAttackers()
	endif

	if CurrentPhase == 5
		((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[1]).MoveTo((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[1].GetNthLinkedRef(3))
		((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[2]).MoveTo((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[2].GetNthLinkedRef(3))
		((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[3]).MoveTo((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkers[3].GetNthLinkedRef(3))
		(DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkerFailsafe.MoveTo((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkerFailsafe.GetNthLinkedRef(1))
		(AttackerArray[0].GetReference()).MoveTo((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkerFailsafe)
		(AttackerArray[1].GetReference()).MoveTo((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkerFailsafe)
		(AttackerArray[2].GetReference()).MoveTo((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkerFailsafe)
		(AttackerArray[3].GetReference()).MoveTo((DN029SecondWaveB as defaultQuestRespawnScript).RespawnMarkerFailsafe)
		EVPAllAttackers()
	endif
EndFunction


Function EVPAllAttackers()
	int i = (AttackerArray.length)
	While i > 0
		i = i - 1
		AttackerArray[i].GetActorReference().EvaluatePackage()
	EndWhile
EndFunction
