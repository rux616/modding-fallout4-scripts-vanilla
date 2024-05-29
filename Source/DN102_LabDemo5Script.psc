ScriptName DN102_LabDemo5Script extends ObjectReference
{Script for HalluciGen Lab Demo 5, the 'Dispersant': Triggers an explosion that applies a fear effect to enemies in the area of effect.}

Group LabDemoProperties CollapsedOnRef
	ObjectReference property DN102_LabDemo5Source Auto Const Mandatory
	{Source of the fear explosion effect.}

	Explosion property DN102_LabDemo5Explosion Auto Const Mandatory
	{The fear effect explosion.}

	MagicEffect property DN102_LabDemo5FearEffect Auto Const Mandatory
	{Magic effect applied to actors by the explosion.}

	RefCollectionAlias property DN102_FrenzyEnemies Auto Const Mandatory
	{Array of enemies in the level. Any enemies with the FearEffect on them are killed at the end of the demo.}
EndGroup


Function StartDemo()
	DN102_LabDemo5Source.PlaceAtMe(DN102_LabDemo5Explosion)
EndFunction

Function StopDemo()
	;Kill the affected actors.
	Utility.Wait(1)
	int i = 0
	While (i < DN102_FrenzyEnemies.GetCount())
		Actor current = DN102_FrenzyEnemies.GetAt(i) as Actor
		if ((current != None) && (current.HasMagicEffect(DN102_LabDemo5FearEffect)))
			current.Kill()
			Utility.Wait(0.5)
		EndIf
		i = i + 1
	EndWhile
EndFunction