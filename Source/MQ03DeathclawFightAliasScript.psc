ScriptName MQ03DeathclawFightAliasScript extends ReferenceAlias

Location Property ConcordLocation Auto
ReferenceAlias Property RaiderBoss Auto
ReferenceAlias Property RaiderLookout Auto
ReferenceAlias Property WaveRaider01 Auto
ReferenceAlias Property WaveRaider02 Auto
ReferenceAlias Property WaveRaider03 Auto

;89087 - need to define the Deathclaw so we can tell if he is dead directly
ReferenceAlias Property	Deathclaw Auto Const Mandatory

; check if the Raiders are in the Museum. If not, kill them.
Function RaiderFailsafe()
	If Self.GetActorRef().IsInLocation(ConcordLocation) == 1
		;do nothing
	Else
		;check if the player can see him
		If Game.GetPlayer().HasDetectionLOS(Self.GetActorRef()) == 0
			debug.trace(self + " Raider has left Concord, killing Raider and disabling him")
			Self.GetActorRef().Kill()
			Self.GetActorRef().Disable()
		EndIf
	EndIf
EndFunction

Event OnDeath(Actor akKiller)
	;Run function on quest script to track death count
	(GetOwningQuest() as MQ03QuestScript).DeathclawFightRaiderDead()
	;if the Deathclaw is dead, then respawning is shutdown, so we only ever care if the remaining Raiders are dead
	If GetOwningQuest().GetStageDone(123) == 1
		If (RaiderBoss.GetActorRef().IsDead() == True) && (RaiderLookout.GetActorRef().IsDead() == True) && (WaveRaider01.GetActorRef().IsDead() == True) && (WaveRaider02.GetActorRef().IsDead() == True) && (WaveRaider03.GetActorRef().IsDead() == True) 
			GetOwningQuest().SetStage(122)
		EndIf
	EndIf

	;89087 - sometimes Stage 123 fires too late, so check if the Deathclaw is dead directly
	If Deathclaw.GetActorRef().IsDead() == True
		;now check to see if all base Raiders are dead as well
		If (RaiderBoss.GetActorRef().IsDead() == True) && (RaiderLookout.GetActorRef().IsDead() == True) && (WaveRaider01.GetActorRef().IsDead() == True) && (WaveRaider02.GetActorRef().IsDead() == True) && (WaveRaider03.GetActorRef().IsDead() == True) 
			GetOwningQuest().SetStage(122)
		EndIf
	EndIF		
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	;If this actor is no longer in the Concord , kill him for safety
	RaiderFailsafe()
EndEvent