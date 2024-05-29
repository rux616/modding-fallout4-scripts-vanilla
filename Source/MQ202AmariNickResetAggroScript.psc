Scriptname MQ202AmariNickResetAggroScript extends ReferenceAlias

;whenever Nick or Amari unload, call stop combat on them if the player somehow got them to aggro on each other
Event OnUnload()
	;only do this once the player reaches the Memory Den
	If GetOwningQuest().GetStageDone(12) == 1 && GetOwningQuest().GetStageDone(1000) == 0
		Self.GetActorRef().StopCombat()
	EndIf
EndEvent