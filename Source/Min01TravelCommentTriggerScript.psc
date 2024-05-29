Scriptname Min01TravelCommentTriggerScript extends ObjectReference Const

Min01Script Property Min01 Auto Const
ReferenceAlias Property TriggerAlias auto const
int Property TravelStageToSet = 1 auto const

Event OnTriggerEnter(ObjectReference akActionRef)
    if akActionRef == TriggerAlias.GetRef() && Min01.IsRunning()
    	Min01.SetNewTravelStage(TravelStageToSet)
    	Disable()
    endif
EndEvent
