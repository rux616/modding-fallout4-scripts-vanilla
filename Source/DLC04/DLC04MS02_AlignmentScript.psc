Scriptname DLC04:DLC04MS02_AlignmentScript extends ReferenceAlias

GlobalVariable Property DLC04_AHS_Rank Auto Const Mandatory
Quest Property DLC04DialogueHubologists Auto Const Mandatory
Scene Property PhilDoAlignment Auto Const Mandatory
Scene Property DaraDoAlignment Auto Const Mandatory
Perk Property PowerArmorPerk Auto Const Mandatory
ObjectReference Property DLC04_PhilRollerRef Auto Const Mandatory
Quest Property DLC04MS02 Auto Const Mandatory

Event OnActivate(ObjectReference akActionRef)
	if DLC04_PhilRollerRef.GetDistance(game.GetPlayer()) < 1000 && (DLC04MS02.GetStage() < 500 || DLC04MS02.GetStage() >= 800)
		if akActionRef == game.GetPlayer() && game.GetPlayer().HasPerk(PowerArmorPerk) == false && game.GetPlayer().GetSitState() > 0
			if DLC04DialogueHubologists.GetStageDone(37) == true && DLC04DialogueHubologists.GetStageDone(57) == false
				DaraDoAlignment.Start()
			elseif DLC04DialogueHubologists.GetStageDone(36) == true && DLC04DialogueHubologists.GetStageDone(56) == false
				PhilDoAlignment.Start()
			elseif DLC04DialogueHubologists.GetStageDone(35) == true && DLC04DialogueHubologists.GetStageDone(55) == false
				PhilDoAlignment.Start()
			elseif DLC04DialogueHubologists.GetStageDone(34) == true && DLC04DialogueHubologists.GetStageDone(54) == false
				PhilDoAlignment.Start()
			elseif DLC04DialogueHubologists.GetStageDone(33) == true && DLC04DialogueHubologists.GetStageDone(53) == false
				PhilDoAlignment.Start()
			elseif DLC04DialogueHubologists.GetStageDone(32) == true && DLC04DialogueHubologists.GetStageDone(52) == false
				PhilDoAlignment.Start()
			elseif DLC04DialogueHubologists.GetStageDone(31) == true || DLC04DialogueHubologists.GetStageDone(41) == true
				if DLC04DialogueHubologists.GetStageDone(51) == false
					PhilDoAlignment.Start()
				endif
			elseif DLC04DialogueHubologists.GetStageDone(30) == true || DLC04DialogueHubologists.GetStageDone(40) == true
				if DLC04DialogueHubologists.GetStageDone(50) == false
					PhilDoAlignment.Start()
				endif
			endif
		endif
	endif
EndEvent

