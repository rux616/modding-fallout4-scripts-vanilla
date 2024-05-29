Scriptname DLC06:DLC06E01PowerCycleAliasScript extends ReferenceAlias

int property AssignedStage = 400 auto const 
{ set this stage once Clem activates power cycle for the first time }

int property RepairedStage = 800 auto const 
{ set this stage once power cycle is producing power again }

int property StartTrackingRepairStage = 600 auto const 
{ after this stage is set, start tracking for being repaired }

ReferenceAlias Property Alias_Clem Auto Const

Event OnActivate(ObjectReference akActionRef)
	Quest myQuest = GetOwningQuest()

	; first time Clem activates it
	if myQuest.GetStageDone(AssignedStage) == false 
		myQuest.SetStage(AssignedStage)
	endif 
EndEvent

Event OnWorkshopObjectRepaired(ObjectReference akReference)
	Quest myQuest = GetOwningQuest()

	; when repaired
	if myQuest.GetStageDone(StartTrackingRepairStage) && myQuest.GetStageDone(RepairedStage) == false 
   		myQuest.SetStage(RepairedStage)
    endif 
endEvent 