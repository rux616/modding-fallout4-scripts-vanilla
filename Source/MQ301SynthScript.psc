ScriptName MQ301SynthScript extends ReferenceAlias Const
{script to count for a small group of synths and set a stage if everyone in the group is dead. Was originally planning to use one of the Counter scripts, but I might need any number of these}

ReferenceAlias[] property SynthCombatGroup Auto Const
Int Property StageToSet Auto Const

Event OnDeath(Actor akKiller)
	;when we die, check if everyone else in the group is dead, then set a stage
	int currentElement = 0
	Int DeadCount = 0
	While (currentElement < SynthCombatGroup.Length)
		If SynthCombatGroup[currentElement].GetActorRef().IsDead()
			DeadCount += 1
		EndIf
		currentElement += 1
	EndWhile

	; if all the actors in the group are dead, set the stage
	If DeadCount == SynthCombatGroup.Length
		GetOwningQuest().SetStage(StageToSet)
	endIf
EndEvent