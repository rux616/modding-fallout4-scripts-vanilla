Scriptname MS17PennyShopTriggerScript extends ObjectReference Conditional

Quest Property pMS17 Auto Const
ActorBase Property pMS17PennyFitzgerald Auto Const
ObjectReference Property pMS17PennysInWorldKey Auto Const
ReferenceAlias Property Alias_PennysInInventoryKey Auto Conditional

Event OnTriggerEnter(ObjectReference akActionRef)
	if (akActionRef == (pMS17PennyFitzgerald.GetUniqueActor() as ObjectReference) )
		if ( !pMS17.GetStageDone(206) )
			pMS17PennysInWorldKey.Enable()
			Alias_PennysInInventoryKey.GetReference().Disable()
		EndIf
	EndIf
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	if (akActionRef == (pMS17PennyFitzgerald.GetUniqueActor() as ObjectReference) )
		if ( !pMS17.GetStageDone(206) )
			pMS17PennysInWorldKey.Disable()
			Alias_PennysInInventoryKey.GetReference().Enable()
		EndIf
	EndIf
EndEvent

