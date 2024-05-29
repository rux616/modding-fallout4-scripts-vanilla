Scriptname DLC01:DLC01_KlaxonDestScript extends ObjectReference
{Klaxon script for destructible versions}

Bool property ActivateSelf = FALSE auto const
{set to TRUE if you only want self to activate self}

ObjectReference myLight
ObjectReference mySound
Bool DoOnce = FALSE

;************************************

Auto State Waiting

	Event OnLoad()
		if(DoOnce == FALSE)
			DoOnce = TRUE
			myLight = self.GetLinkedRef()
			mySound = self.GetLinkedRef().GetLinkedRef()
		endif
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
		if(akActionRef == self && ActivateSelf == TRUE) || (ActivateSelf == FALSE)
			;check if I'm destroyed, if not, enable light and sound
			;animate Klaxon
			if(self.isDestroyed() == FALSE)
				;enable and animate light
				if(DoOnce == FALSE)
					DoOnce = TRUE
					myLight = self.GetLinkedRef()
					mySound = self.GetLinkedRef().GetLinkedRef()
				endif

				myLight.enable()
				while(myLight.is3DLoaded() == FALSE)
					utility.wait(1.0)
				endWhile
				myLight.PlayAnimation("Stage2")
				self.PlayAnimation("Stage2")
				if(mySound)
					mySound.enable()
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