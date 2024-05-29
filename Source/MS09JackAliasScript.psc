Scriptname MS09JackAliasScript extends ReferenceAlias Const

Potion Property Stimpak Auto Const

Event OnEnterBleedout()
	StimpakCheck()
endEvent

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if aeCombatState == 1
		StimpakCheck()
	endif
endEvent


function StimpakCheck()
	MS09Script myQuest = GetOwningQuest() as MS09Script

	; only during final battle, and Jack is friendly
	if myQuest.GetStageDone(1450) == true && myQuest.GetStage() < 1500 && myQuest.Mission3PlayerSidesWithCabots
		actor jack = getActorRef()
		if jack.GetItemCount(Stimpak) < 2
			jack.AddItem(Stimpak)
		endif
	endif

endFunction