Scriptname DN151_CircuitBreakerActivatorScript extends ObjectReference Hidden
{Script for the DN151 Circuit Breaker Activator. Just makes a callback, then prevents further activations.}

Keyword property LinkCustom03 Auto Const Mandatory
{Link from the Activator back to the Circuit Breaker.}

Auto State Waiting
	Event OnActivate(ObjectReference akActivator)
		GoToState("Done")
		(Self.GetLinkedRef(LinkCustom03) as DN151_CircuitBreakerScript).ActivatePump()
	EndEvent
EndState

State Done
	Event OnActivate(ObjectReference akActivator)
		;Do nothing.
	EndEvent
EndState
