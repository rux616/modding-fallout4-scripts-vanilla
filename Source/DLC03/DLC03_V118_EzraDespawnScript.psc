Scriptname DLC03:DLC03_V118_EzraDespawnScript extends ReferenceAlias

Location Property DLC03Vault118Location Auto Const mandatory
DLC03:DLC03DialogueV118Script property DLC03DialogueV118 Auto Const Mandatory

Event OnUnload()
	Actor SelfActor = GetActorRef()
	if !SelfActor.isInLocation(DLC03Vault118Location) && !SelfActor.isDead()
		DLC03DialogueV118.EzraHasEscaped()
	endif
EndEvent