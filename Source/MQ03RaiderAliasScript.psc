ScriptName MQ03RaiderAliasScript extends ReferenceAlias

Cell Property ConcordMuseum01 Auto

; check if the Raiders are in the Museum. If not, kill them.
Function RaiderFailsafe()
	If Self.GetActorRef().GetParentCell() == ConcordMuseum01 
		;do nothing
	Else
		debug.trace(self + " Raider has left Concord Museum, killing Raider and disabling him")
		Self.GetActorRef().Kill()
		Self.GetActorRef().Disable()
	EndIf
EndFunction


Event OnDeath(Actor akKiller)
	;Run function on quest script to track death count
	(GetOwningQuest() as MQ03QuestScript).FirstWaveRaiderDead()
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	;If this actor is no longer in the Concord Museum, kill him for safety
	RaiderFailsafe()
EndEvent