Scriptname DN134_StartArrivalSceneTrigScript extends ObjectReference Const

Quest Property DN134 Auto Const

int property Stage = 300 Auto Const

DialogueDrinkingBuddyScript property DialogueDrinkingBuddy Auto Const

ReferenceAlias Property DrinkingBuddy Auto Const

ObjectReference Property Dn134QuickMoveMarker Auto Const

Event OnTriggerEnter(ObjectReference TriggerRef)
	if !DN134.GetStageDone(Stage) && DialogueDrinkingBuddy.IsInDeliveryMode && !DialogueDrinkingBuddy.WaitOutsideRexford
		if !(DrinkingBuddy.GetReference() as Actor).IsDead()
			if DrinkingBuddy.GetReference().Is3dLoaded()
				DrinkingBuddy.GetReference().MoveTo(Dn134QuickMoveMarker)
				(DrinkingBuddy.GetReference() as Actor).EvaluatePackage()
			endif
			DN134.SetStage(Stage)
		endif
	endif
EndEvent