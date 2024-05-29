Scriptname DN058ChildRaiderHitScript extends ReferenceAlias Hidden

Int Property StageToSet Auto
{Stage to set when this references is hit}

Faction Property DN058RaiderFaction Auto

Auto STATE WaitingForHit
	Event OnLoad()
		if GetReference().Is3dLoaded()
			RegisterForHitEvent(self) ; get a single hit
		endIf
	EndEvent

	Event OnUnload()
		UnregisterForAllHitEvents()
	EndEvent

	Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
		GoToState("BeenTriggered")
		GetOwningQuest().SetStage(StageToSet)
		GetOwningQuest().SetStage(55)
		Game.GetPlayer().RemoveFromFaction(DN058RaiderFaction)
		if Game.GetPlayer().IsInInterior()
			if self.GetReference().GetParentCell() == game.GetPlayer().GetParentCell()
				GetOwningQuest().SetStage(60)
			endIf
		endif

	EndEvent
EndSTATE

STATE BeenTriggered
	;Do Nothing
EndSTATE

Event OnDying(Actor akKiller)
EndEvent
