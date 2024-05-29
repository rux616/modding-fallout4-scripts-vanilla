Scriptname DLC01:DLC01_JailBreakerScript extends ObjectReference
{Script for Breaker in Jail Cell for DLC01Lair}

Quest property myQuest auto const
Bool property bIsOn = FALSE auto
Keyword property LinkCustom01 auto const

;************************************

ObjectReference mySparks
ObjectReference myActivator
Bool doOnce = FALSE

;************************************

Auto State Waiting
	Event OnLoad()
		mySparks = self.getLinkedRef()
		myActivator = self.getLinkedRef(LinkCustom01)    
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
		if (bIsOn == FALSE)
			gotoState("DoNothing")
			bIsOn = TRUE
			self.playAnimation("Play01")
			mySparks.enable()
			if(doOnce == FALSE)
				doOnce = TRUE
				myActivator.activate(myActivator)
			endif
			myQuest.setStage(200)
			Utility.Wait(5.0)
			gotoState("Waiting")
		else
			gotoState("DoNothing")
			bIsOn = FALSE
			self.playAnimation("Play01")
			mySparks.disable()
			myQuest.setStage(205)
			Utility.Wait(5.0)
			gotoState("Waiting")
		endif
	EndEvent
EndState

State DoNothing
	Event OnActivate(ObjectReference akActionRef)
		;do nothing
	EndEvent			
EndState
;************************************