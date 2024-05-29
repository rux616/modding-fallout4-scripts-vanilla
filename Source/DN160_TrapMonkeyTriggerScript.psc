Scriptname DN160_TrapMonkeyTriggerScript extends TrapMonkeyTriggerScript Hidden

ReferenceAlias property DogmeatCompanion Auto Const
bool property ignoreTriggerIfDogmeatPresent Auto Const
bool hasTriggeredOnce = false 	;The DN160 trigger always trips the first time, ignoring the usual rules.


Auto State Active
	Event OnTriggerEnter(ObjectReference akActionRef)
		if(akActionRef == game.getPlayer())
			if (!hasTriggeredOnce)
				if (!ignoreTriggerIfDogmeatPresent || (DogmeatCompanion.GetActorRef() == None))	
					GoToState("Warn")
				EndIf
			Else
				Parent.OnTriggerEnter(akActionRef)
			EndIf
		EndIf
	EndEvent
EndState

state Warn
	Event OnTriggerLeave(ObjectReference akActionRef)
		if (hasTriggeredOnce)
			Parent.OnTriggerLeave(akActionRef)
		EndIf
	EndEvent

	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		if (hasTriggeredOnce)
			Parent.OnAnimationEvent(akSource, asEventName)
	   	EndIf    
	EndEvent
endState

state Tripped
	Event OnBeginState(string asOldState)
	    if (asOldState == "Warn")
	    		hasTriggeredOnce = True
	    		Parent.OnBeginState(asOldState)
	    endif
	EndEvent
endState