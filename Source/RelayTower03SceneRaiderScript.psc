Scriptname RelayTower03SceneRaiderScript extends Actor Hidden

Keyword Property LinkCustom01 auto


auto STATE WaitForActivate
	Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	    if akTarget == Game.GetPlayer() && aeCombatState == 1
	    	GoToState("Done")
	    	GetLinkedRef(LinkCustom01).DisableNoWait()
	    	;debug.trace ("I'm disabled")
	    endif
	EndEvent

	Event OnDeath(Actor akKiller)
	    GoToState("Done")
	    ;debug.trace ("I'm dead")
	    GetLinkedRef(LinkCustom01).DisableNoWait()
	EndEvent
EndSTATE


STATE Done

EndSTATE