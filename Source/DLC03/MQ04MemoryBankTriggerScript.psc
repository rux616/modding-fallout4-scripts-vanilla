Scriptname DLC03:MQ04MemoryBankTriggerScript extends ObjectReference Const

SPELL Property DLC03MQ04DataRetrieverAbility Auto Const Mandatory

Faction Property DLC03VRDataRetrieverFaction Auto Const Mandatory

DLC03:MQ04Script Property myQuest auto Const Mandatory
{ quest to notify when something enters trigger }

Event OnTriggerEnter(ObjectReference akActionRef)
    if (akActionRef is Actor)
		debug.trace(self + "OnTriggerEnter " + akActionRef)
    	actor theActor = akActionRef as Actor
    	if theActor
    		if myQuest.GetStageDone(myQuest.iAccessNextMemory) && theActor == Game.GetPlayer()
    			; move player to next memory
    			myQuest.MoveToNextMemory()
    		elseif theActor.IsInFaction(DLC03VRDataRetrieverFaction)
				debug.trace(self + " data retriever - grab data from " + myQuest)
	    		myQuest.DataGrab(theActor, true)
	    	endif 
    	endif
    endif
EndEvent
