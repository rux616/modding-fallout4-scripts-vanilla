Scriptname DN102_RefAddPerkOnLoad extends ObjectReference
{Ref version of DefaultAliasAddPerkOnLoad. Adds a perk to an actor on load.}

Perk property PerkToAdd auto const
{The perk that should be added to the actor upon load.}

bool property doOnce = True auto const
{Whether the Perk should only be added on first load. Default=TRUE}

Auto State Ready
	Event OnLoad()
		Actor selfActor = (Self as ObjectReference) as Actor
		if (selfActor != None)
			selfActor.AddPerk(PerkToAdd)
		EndIf
		if (doOnce)
			GoToState("Done")
		EndIf
	EndEvent
EndState

State Done
	Event OnLoad()
		;Do nothing.
	EndEvent
EndState