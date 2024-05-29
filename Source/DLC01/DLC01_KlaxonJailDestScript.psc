Scriptname DLC01:DLC01_KlaxonJailDestScript extends ObjectReference
{Klaxon script for destructible versions in the Jail section of DLC01}

Bool property ActivateSelf = FALSE auto const
{set to TRUE if you only want self to activate self}
ObjectReference property myBreaker auto const

ObjectReference myLight
ObjectReference mySound
DLC01_JailBreakerScript myNewBreaker
Bool DoOnce = FALSE
Bool LightOn = FALSE

;************************************

Auto State Waiting

	Event OnLoad()
		if(DoOnce == FALSE)
			DoOnce = TRUE
			myLight = self.GetLinkedRef()
			mySound = self.GetLinkedRef().GetLinkedRef()
			myNewBreaker = myBreaker as DLC01_JailBreakerScript
			self.PlayAnimation("Reset")
		endif
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
		if(akActionRef == self && ActivateSelf == TRUE) || (ActivateSelf == FALSE)
			;check if I'm destroyed, if not, enable/disable light and sound
			;animate Klaxon
			if(self.isDestroyed() == FALSE)
				;enable/disable and animate light
				if(DoOnce == FALSE)
					DoOnce = TRUE
					myLight = self.GetLinkedRef()
					mySound = self.GetLinkedRef().GetLinkedRef()
				endif

				if(self.is3DLoaded())
					if (myNewBreaker.bIsOn == TRUE)
						myLight.enable()
						while(myLight.is3DLoaded() == FALSE)
							utility.wait(1.0)
						endWhile
						if(LightOn == FALSE)
							LightOn = TRUE
							myLight.PlayAnimation("Stage2")
						endif
						self.PlayAnimation("Stage2")
						if(mySound)
							mySound.enable()
						endif
					else
						myLight.disable()
						self.PlayAnimation("Reset")
						if(mySound)
							mySound.disable()
						endif
					endif
				endif
			else
				gotoState("Done")
			endif
		endif
	EndEvent

	Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
		gotoState("Done")
		if(DoOnce == FALSE)
			DoOnce = TRUE
			myLight == self.GetLinkedRef()
			mySound = self.GetLinkedRef().GetLinkedRef()
		endif
		mySound.disable()
		myLight.disable()
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

	Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	    ;do nothing
	EndEvent

EndState

;************************************