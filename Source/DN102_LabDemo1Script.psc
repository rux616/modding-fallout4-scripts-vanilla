ScriptName DN102_LabDemo1Script extends ObjectReference
{Script for HalluciGen Lab Demo 1, the 'Irradicator': Plays some explosions, turns on a radiation hazard, and kills enemies there after a brief delay.}

Group LabDemoProperties CollapsedOnRef
	ObjectReference property DN102_LabDemo1Radiation Auto Const Mandatory
	{Radiation hazard to enable.}

	ObjectReference property DN102_LabDemo1Source Auto Const Mandatory
	{Source of the explosion effect. In this case, it's the first source in a chain.}

	Explosion property DN102_LabDemo1Explosion Auto Const Mandatory
	{The explosion to play. Doesn't do anything on its own.}

	MagicEffect property DN102_LabDemo1IrradicatorEffect Auto Const Mandatory
	{Magic effect applied to actors by the explosion.}

	RefCollectionAlias property DN102_FrenzyEnemies Auto Const Mandatory
	{Array of enemies in the level. Any enemies with the InvisibilityEffect on them also get disabled.}

	ReferenceAlias property DN102_LabDemoAffectedEnemy Auto Const Mandatory
	{Alias actors affected by the demo are forced into. Set by the magic effect; cleared here when they're killed.}

	Sound property QSTDN102Demo01Explosion2D Auto Const Mandatory
	Sound property QSTDN102Demo01Explosion3D Auto Const Mandatory	
EndGroup


Function StartDemo()
	;Start a timer to handle the effects, so StartDemo doesn't block and hold up the scene.
	StartTimer(0)
EndFunction

Event OnTimer(int timerID)
	;Play the explosions.
	DN102_LabDemo1Source.PlaceAtMe(DN102_LabDemo1Explosion)
	ObjectReference[] explosionSources = DN102_LabDemo1Source.GetLinkedRefChain()
	int i = 0
	While (i < explosionSources.Length)
		explosionSources[i].PlaceAtMe(DN102_LabDemo1Explosion)
		i = i + 1
	EndWhile

	;Play explosion sound effects.
	QSTDN102Demo01Explosion2D.Play(Self)
	QSTDN102Demo01Explosion3D.Play(Self)

	;Enable the radiation hazard.
	DN102_LabDemo1Radiation.Enable()

	;After a moment, kill any enemies in the affected area.
	Utility.Wait(2)
	i = 0
	While (i < DN102_FrenzyEnemies.GetCount())
		Actor current = DN102_FrenzyEnemies.GetAt(i) as Actor
		if ((current != None) && (current.HasMagicEffect(DN102_LabDemo1IrradicatorEffect)))
			current.Kill()
		EndIf
		i = i + 1
	EndWhile

	;Clear the Affected Enemy alias.
	DN102_LabDemoAffectedEnemy.Clear()
EndEvent

Function StopDemo()
	;Nothing to do here.
EndFunction