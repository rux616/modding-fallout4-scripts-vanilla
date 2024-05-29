ScriptName DN102_LabDemo2Script extends ObjectReference Conditional
{Script for HalluciGen Lab Demo 2, the 'InvisiWave': Plays an explosion, then disables a bunch of objects.}

Group LabDemoProperties CollapsedOnRef
	ObjectReference property DN102_LabDemo2Source Auto Const Mandatory
	{Source of the 'invisibility' explosion effect.}

	ObjectReference property DN102_LabDemo2TriggerRef Auto Const Mandatory
	{Trigger that applies the 'invisibility' effect to everyone in the room, since the explosion is unreliable.}

	Explosion property DN102_LabDemo2Explosion Auto Const Mandatory
	{The 'invisibility' explosion to play. Doesn't do anything on its own.}

	MagicEffect property DN102_LabDemo2InvisibilityEffect Auto Const Mandatory
	{Magic effect applied to actors by the explosion.}

	RefCollectionAlias property DN102_LabDemo2Refs Auto Const Mandatory
	{Array of refs in the demo room. These all get disabled when made 'invisible'.}

	RefCollectionAlias property DN102_FrenzyEnemies Auto Const Mandatory
	{Array of enemies in the level. Any enemies with the InvisibilityEffect on them also get disabled.}

	bool property hasBeenTriggered = False Auto Conditional
	{Has this demo already been triggered?}
EndGroup


Function StartDemo()
	;Start a timer to handle the effects, so StartDemo doesn't block and hold up the scene.
	StartTimer(0)
EndFunction

Event OnTimer(int timerID)
	;Play the explosion and (for this demo) enable the trigger.
	DN102_LabDemo2Source.PlaceAtMe(DN102_LabDemo2Explosion)

	;Delay briefly to wait for vfx.
	Utility.Wait(0.25)
	DN102_LabDemo2TriggerRef.Enable()
	Utility.Wait(0.75)
	DN102_LabDemo2TriggerRef.DisableNoWait()

	;Disable everything in the room. Hey, you can't see it anymore!
	;Debug.Trace("Count to Disable: " + DN102_LabDemo2Refs.GetCount())
	While(DN102_LabDemo2Refs.GetCount() > 0)
		ObjectReference current = DN102_LabDemo2Refs.GetAt(0)
		;Debug.Trace("Disabling " + current)
		current.DisableNoWait(True)
		DN102_LabDemo2Refs.RemoveRef(current)
	EndWhile

	;Disable all of the enemies that were hit by the explosion.
	int i = 0
	While (i < DN102_FrenzyEnemies.GetCount())
		Actor current = DN102_FrenzyEnemies.GetAt(i) as Actor
		if ((current != None) && (current.HasMagicEffect(DN102_LabDemo2InvisibilityEffect)))
			;Debug.Trace("Disabling Actor " + current)
			current.DisableNoWait(True)
		EndIf
		i = i + 1
	EndWhile

	;Once the explosion source disappears, we can't run this demo again.
	;Debug.Trace("HasBeenTriggereD")
	hasBeenTriggered = True

	;Wait a moment to give them a chance to disable, then kill them to make sure they're dead (for the purposes of clearing the dungeon, etc.).
	Utility.Wait(1)
	While (i < DN102_FrenzyEnemies.GetCount())
		Actor current = DN102_FrenzyEnemies.GetAt(i) as Actor
		if ((current != None) && (current.HasMagicEffect(DN102_LabDemo2InvisibilityEffect)))
			current.Kill()
		EndIf
		i = i + 1
	EndWhile
EndEvent

Function StopDemo()
	;Nothing to do here.
EndFunction