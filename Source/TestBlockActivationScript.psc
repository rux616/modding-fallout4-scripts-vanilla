Scriptname TestBlockActivationScript extends ObjectReference Const

Event OnLoad()
    BlockActivation(true)
EndEvent

Event OnActivate(ObjectReference akActionRef)
	debug.trace(self + " OnActivate by " + akActionRef)
	; toggle
	BlockActivation(!IsActivationBlocked())
EndEvent