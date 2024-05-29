Scriptname DLC03:MQ04IndexerReturnTriggerScript extends ObjectReference Const

SPELL Property DLC03MQ04DataRetrieverAbility Auto Const Mandatory

DLC03:MQ04Script Property myQuest auto Const Mandatory
{ quest to notify when something enters trigger }

Event OnTriggerEnter(ObjectReference akActionRef)
	debug.trace(self + "OnTriggerEnter " + akActionRef)
    if myQuest.GetStageDone(150) && myQuest.GetStageDone(160) == false && akActionRef is Actor
    	actor theActor = akActionRef as Actor
    	if theActor
    		if theActor.HasSpell(DLC03MQ04DataRetrieverAbility)
				debug.trace(self + " data retriever entered trigger with data")
	    		myQuest.setStage(160)
	    		Disable()
	    	endif 
    	endif
    endif
EndEvent
