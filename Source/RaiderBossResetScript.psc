Scriptname RaiderBossResetScript extends ScriptedResetRef Const

ActorBase Property NamedBoss Auto Const
ObjectReference Property EnableMarker Auto Const

Event OnCellDetach()
	RegisterForReset()
EndEvent

Function ScriptedReset()
	;If named boss base actor has died and hasn't yet been disabled, disable him (or her!)
	;debug.trace("Raider Boss reset event fired from " + self + ". " + NamedBoss + " target boss.")
	if NamedBoss.GetDeadCount() >= 1 && !EnableMarker.isDisabled()
		;All Raider bosses have a marker reverse enable parented to them, which in turn enables the new, unnamed boss
		EnableMarker.Disable()
	endif
EndFunction