Scriptname DN111_ActivateSelfOnCombatStateChange extends Actor Hidden
{The ref activates itself on combat state change, typically to trigger an ambush from an ActivateParented actor.}

bool property doOnce = True auto const

Auto State Initial
	Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
		Self.Activate(Self)
		if (doOnce)
			GoToState("Done")
		EndIf
	EndEvent
EndState

State Done
	Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
		;Do nothing
	EndEvent
EndState



