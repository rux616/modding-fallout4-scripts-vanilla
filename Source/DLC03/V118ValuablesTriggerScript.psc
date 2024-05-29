Scriptname DLC03:V118ValuablesTriggerScript extends ObjectReference Const


DLC03:DLC03DialogueV118Script Property DLC03DialogueV118 Auto Const Mandatory

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == game.GetPlayer()
		GetLinkedRef().Disable()
		Disable()
		DLC03DialogueV118.GatherValuables()
	endif
EndEvent