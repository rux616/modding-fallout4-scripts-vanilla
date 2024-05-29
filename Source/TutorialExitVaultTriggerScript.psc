Scriptname TutorialExitVaultTriggerScript extends ObjectReference Const

TutorialScript Property Tutorial Auto Const Mandatory

Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		Tutorial.RegisterPostVaultTutorialEvents()
		self.Disable()
	endif
EndEvent