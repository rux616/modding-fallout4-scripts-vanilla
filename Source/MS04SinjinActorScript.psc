Scriptname MS04SinjinActorScript extends Actor

Quest property pMS04 auto

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	; When Sinjin enters combat flag the quest properly
	if ( akTarget == Game.GetPlayer() && aeCombatState == 1)
	   	pMS04.SetStage(1310)
	endif
EndEvent