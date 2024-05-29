Scriptname DN136_AttackKlaxonDestScript extends ObjectReference
{Klaxon script for destructible versions in Institute}

;self = Mesh
;self.getlinkedRef() = Light
;self.getLinkedRef().getLinkedRef() = Sound

ObjectReference myLight
ObjectReference mySound
Bool DoOnce = FALSE

;************************************

Event ObjectReference.OnCellAttach(ObjectReference akSender)
		;do nothing
EndEvent

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
		if(akActionRef == self)
			;check if I'm destroyed, if not, enable light and sound
			;animate Klaxon
			if(self.isDestroyed() == FALSE)
				;enable and animate light
				if(DoOnce == FALSE)
					DoOnce = TRUE
					myLight = self.GetLinkedRef()
					mySound = self.GetLinkedRef().GetLinkedRef()
				endif

				if(self.is3DLoaded())
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
					;I'm not loaded, register mylight for cell attach
					myLight.enable()
					RegisterForRemoteEvent(myLight, "OnCellAttach")
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

	Event ObjectReference.OnCellAttach(ObjectReference akSender)
		if(akSender == myLight)
			While(myLight.IsDisabled())
				utility.Wait(1.0)
			endWhile
			;light is now loaded, so we can play animation
			myLight.PlayAnimation("Stage2")
			;animate klaxon
			self.PlayAnimation("Stage2")
			;enable sound, have to check to see if they have sounds because some of them don't
			if(mySound)
				mySound.enable()
			endif
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

	Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	    ;do nothing
	EndEvent

	Event ObjectReference.OnCellAttach(ObjectReference akSender)
		;do nothing
	EndEvent
EndState

;************************************