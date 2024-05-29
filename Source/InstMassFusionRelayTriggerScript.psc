Scriptname InstMassFusionRelayTriggerScript extends ObjectReference Conditional

Message Property InstMassFusionRelayMessage Auto Const

Quest Property InstMassFusion Auto Const

Int ButtonPressed = 0

Event OnTriggerEnter(ObjectReference ActionRef)

	ObjectReference PlayerRef=Game.GetPlayer()

	If InstKickOut.IsRunning() == 0

		if ActionRef == PlayerRef	
			if InstMassFusion.IsObjectiveDisplayed(20)
				if PlayerBoS_KickedOut.GetValue() == 0
					Debug.Trace("Trigger Entered")
					ButtonPressed=InstMassFusionRelayMessage.Show()
					if ButtonPressed==0
						Debug.Trace("Button 0 Pressed")
						InstMassFusion.SetStage(30)
					elseif ButtonPressed==1
						Debug.Trace("Button 1 Pressed")
						;do nothing
					endif
				else
					InstMassFusion.SetStage(30)
				endif					
			endif
		endif
	endif

EndEvent
GlobalVariable Property PlayerBoS_KickedOut Auto Const

Quest Property InstKickOut Auto Const Mandatory
