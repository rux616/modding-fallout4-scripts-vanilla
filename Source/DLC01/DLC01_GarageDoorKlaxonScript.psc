Scriptname DLC01:DLC01_GarageDoorKlaxonScript extends ObjectReference
{Turns on/off klaxon when opened/closed}

ObjectReference Property myKlaxon auto const

;************************************

ObjectReference myLight
ObjectReference mySound
Bool DoOnce = FALSE

;************************************

Event ObjectReference.OnDestructionStageChanged(ObjectReference akSender, int aiOldStage, int aiCurrentStage)
	;do nothing
EndEvent

;************************************

Auto State Waiting

	Event OnLoad()
		if(DoOnce == FALSE)
			DoOnce = TRUE
			myLight = myKlaxon.GetLinkedRef()
			mySound = myKlaxon.GetLinkedRef().GetLinkedRef()
			myKlaxon.PlayAnimation("Reset")
		endif

		RegisterForAnimationEvent(self, "opened")
		RegisterForAnimationEvent(self, "closed")
		RegisterForRemoteEvent(myKlaxon, "OnDestructionStageChanged")
	EndEvent

	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		debug.trace("JUST GOT ANIMATION EVENT FROM " + akSource)
		;check if klaxon is destroyed
		if(myKlaxon.isDestroyed() == FALSE)
			if(DoOnce == FALSE)
				DoOnce = TRUE
				myLight = myKlaxon.GetLinkedRef()
				mySound = myKlaxon.GetLinkedRef().GetLinkedRef()
			endif

			if(asEventName == "opened")
				;garage door opened, so enable light and sound and animation klaxon
				if(myKlaxon.is3DLoaded())
					myLight.enable()
					while(myLight.is3DLoaded() == FALSE)
						utility.wait(1.0)
					endWhile
					myLight.PlayAnimation("Stage2")
					myKlaxon.PlayAnimation("Stage2")
					if(mySound)
						mySound.enable()
					endif
				endif
			elseif(asEventName == "closed")
				;garage door closed, so disable light and sound and turn off klaxon
				myLight.disable()
				myKlaxon.PlayAnimation("Reset")
				if(mySound)
					mySound.disable()
				endif
			endif
		else
			gotoState("Done")
		endif
	EndEvent

	Event ObjectReference.OnDestructionStageChanged(ObjectReference akSender, int aiOldStage, int aiCurrentStage)
		if(akSender == myKlaxon)
			gotoState("Done")
			if(DoOnce == FALSE)
				DoOnce = TRUE
				myLight == myKlaxon.GetLinkedRef()
				mySound = myKlaxon.GetLinkedRef().GetLinkedRef()
			endif
			mySound.disable()
			myLight.disable()
		endif
	EndEvent

EndState

;************************************

State Done
	Event OnLoad()
		;do nothing    
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
		;do nothing    
	EndEvent

	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		;do nothing
	EndEvent

	Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	    ;do nothing
	EndEvent
EndState

;************************************