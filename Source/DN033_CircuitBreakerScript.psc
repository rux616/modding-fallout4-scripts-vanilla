Scriptname DN033_CircuitBreakerScript extends ObjectReference Hidden Conditional
{Script to enable disable lights in Dunwich}
Group OptionalProperties
	Bool Property OnPosition Auto Conditional
	{Whether this switch is in ON position or not, (Default: FALSE)
 	Also, updates every time the switch is flipped.}

 	Quest Property myQuest Auto Const
 	Int Property myStage Auto Const
 	Bool Property setQuestOnce = TRUE Auto
 	{defaults TRUE, set to FALSE if you want the quest stage to be set more than once}

EndGroup

Group NoTouchy CollapsedOnRef
	Sound Property mySoundOn Auto Const
	{Sound to play at each light when turned on}

	Sound Property mySoundOff Auto Const
	{Sound to play at each light when turned off}

	Keyword Property LinkCustom01 Auto Const
	{Link to the Breaker}

	Keyword Property LinkCustom02 Auto Const
	{Link to enable/disable when this switch is in the ON/OFF position}

EndGroup

ObjectReference Breaker
ObjectReference EnableMarker
ObjectReference[] LinkedRefs
int myInt = 0
Bool doOnce = FALSE

;**********************************************************

Event OnInit()
    Breaker = GetLinkedRef(LinkCustom01)
    EnableMarker = GetLinkedRef(LinkCustom02)
    LinkedRefs = GetLinkedRefChain(LinkCustom02)
EndEvent

;**********************************************************

Event OnLoad()
	RegisterForRemoteEvent(Breaker, "OnActivate")

    if OnPosition
		Breaker.PlayAnimation("Play01")
    endif
EndEvent

Event ObjectReference.OnActivate(objectReference akSender, ObjectReference akActionRef)
	;do nothing
EndEvent
;**********************************************************

Auto State WaitingForActivate

	Event ObjectReference.OnActivate(objectReference akSender, ObjectReference akActionRef)

		if akSender == Breaker
			GoToState("DoNothing")
		    Breaker.PlayAnimationAndWait("play01","done")
			myInt = 0

		    if !OnPosition
		    	; In OFF Position.  Moved to ON Position
		    	OnPosition = TRUE

		    	if (EnableMarker)
			    	While(myInt < LinkedRefs.length)
			    		LinkedRefs[myInt].enable(0)
						mySoundOn.play(LinkedRefs[myInt].getLinkedRef())
						utility.wait(0.5)
			    		myInt += 1
			    	endWhile
		    	endif

		    else
		    	; In ON Position.  Moved to OFF Position
		    	OnPosition = FALSE
		    	;debug.notification("just turned off")
		    	if (EnableMarker)
		    		While(myInt < LinkedRefs.length)
			    		LinkedRefs[myInt].disable(0)
						mySoundOff.play(LinkedRefs[myInt].getLinkedRef())
						utility.wait(0.5)
			    		myInt += 1
			    	endWhile
		    	endif
		    endif

		    ;place a sound detection event at player
		    if(myQuest && myStage && !doOnce)
		    	if(setQuestOnce)
					doOnce = TRUE
				endif
				myQuest.setStage(myStage)
		    endif

		    GoToState("WaitingForActivate")
	   endif
	EndEvent
EndState

;**********************************************************

State DoNothing
	;Don't do a thing
EndState

;**********************************************************