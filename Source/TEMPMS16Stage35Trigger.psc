Scriptname TEMPMS16Stage35Trigger extends ObjectReference Const

Message Property MessageToShow const auto
Quest Property TargetQuest const auto
int Property TargetStage const auto


Event OnTriggerEnter(ObjectReference akActionRef)
    if (MessageToShow != None)
    	MessageToShow.Show()

    	TargetQuest.SetStage(TargetStage)

		Delete()
    endif
EndEvent

