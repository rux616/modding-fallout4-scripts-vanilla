;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Perks:PRKF__0100408E Extends Perk Hidden Const

;BEGIN FRAGMENT Fragment_Entry_01
Function Fragment_Entry_01(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Actor victim = akTargetRef as Actor
	float distancefromplayer = game.getPlayer().getDistance(victim) 
		pVictimAlias.forceRefto(akTargetRef)
		pTestHoldupQuestPlayerStickemup.start()
		victim.setValue(Game.GetAggressionAV(), 0)
		victim.EvaluatePackage()
		victim.playIdle(pPoseA_To_PoseB)
		while game.getPlayer().IsWeaponDrawn() == 1 && distancefromplayer < 512 
			distancefromplayer = game.getPlayer().getDistance(akTargetRef) 
			if game.getPlayer().IsWeaponDrawn() == 0 || ptestHoldupQuest.getstage() == 30 || victim.getcombatstate() == 1 || game.getplayer().hasDetectionLOS(victim) == false
				;gotoState("Transition")
			elseif ptestHoldupQuest.getstage() == 10
				; gotoState("commands")
			elseif ptestHoldupQuest.getstage() == 20
				;gotoState("flee")
			endif
		endwhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Quest Property ptestHoldupQuest Auto Const

Idle Property pPoseA_to_PoseB Auto Const

Idle Property pPoseB_to_PoseA Auto Const

Scene Property ptestHoldupQuestPlayerStickemup Auto Const

ReferenceAlias Property pVictimAlias Auto Const

