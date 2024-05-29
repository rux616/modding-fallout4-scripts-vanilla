Scriptname ElevatorDoorForwardActivationScript extends ObjectReference
{Script for use on elevator doors with non-standard activators (like ID Card Readers). Forwards the activation to the other activator.}

Keyword property myKeyword Auto Const
{Keyword of the linkedref to forward the activation to.}

Event OnLoad()
	Self.BlockActivation()
	Self.SetNoFavorAllowed()
EndEvent

Auto State Waiting
	Event OnActivate(ObjectReference akActivator)
		GoToState("Busy")
		if (akActivator == Game.GetPlayer())
			Self.GetLinkedRef(myKeyword).Activate(akActivator)
		EndIf
		GoToState("Waiting")
	EndEvent
EndState

State Busy
	Event OnActivate(ObjectReference akActivator)
		;Do nothing.
	EndEvent
EndState