ScriptName DN102_LabDemo3Script Extends TrapBase Conditional
{Script for HalluciGen Lab Demo 3, the 'Suppressor': An electrical arc trap that paralyzes targets.}
;
;This script is derived from DN021_BugZapperScript; it just casts a variant spell.

Group LabDemoProperties CollapsedOnRef
	ObjectReference property DN102_LabDemo3Source Auto Const Mandatory
	{Source of the electrical arcs.}

	ObjectReference property DN102_LabDemo3Light Auto Const Mandatory
	{Light to enable when the trap powers up.}

	Activator property DefaultDummy Auto Const Mandatory
	{Object to spawn, move, and eventually discard, for random firing of the trap.}

	Spell property DN102_LabDemo3Spell Auto Const Mandatory
	{Variant of the standard arc trap spell that paralyzes targets.}

	MagicEffect property DN102_LabDemo3ParalyzeEffect Auto Const Mandatory
	{The paralysis effect caused by the trap.}

	int property maxProjectiles = 22 Auto Const
	{Number of projectiles to fire.}

	float property TargetDistance = 768.0 Auto Const
	{Max distance to search for targets.} 

	bool property demoRunning Auto Conditional
	{Is this demo currently active? (firing arcs?).}
EndGroup

;Local variables.
int projectiles = 0 		;How many projectiles have we fired in this activation?

Function StartDemo()
	demoRunning = True
	;Start a timer to handle the effects, so StartDemo doesn't block and hold up the scene.
	StartTimer(0)
EndFunction

Event OnTimer(int timerID)
	LocalFireTrap()
EndEvent

Function StopDemo()
	demoRunning = False
EndFunction

;Largely copied from DN021_BugZapperScript.
Function LocalFireTrap()
	ObjectReference dummyTarget = Self.PlaceAtMe(DefaultDummy)
	Actor akTarget 
	projectiles = 0

	;Enable the blue light.
	DN102_LabDemo3Light.EnableNoWait(True)

	While ((projectiles < maxProjectiles) && Is3dLoaded() && demoRunning)
		akTarget = Game.FindRandomActorFromRef(Self, TargetDistance)

		;If we have a target, roll to see whether to fire at it. Some of the time, we fire at the XMarker anyway.		
		if (akTarget && !akTarget.HasMagicEffect(DN102_LabDemo3ParalyzeEffect) && (Utility.RandomInt(1, 100) <= 50))
			;Debug.trace(self + ": firing at actor >> " + akTarget)
			DN102_LabDemo3Spell.Cast(DN102_LabDemo3Source, akTarget)
		Else 		
			;Debug.trace(self + ": firing at dummy >> " + myXmarker)
			dummyTarget.MoveTo(Self, afXOffset = Utility.RandomFloat(-TargetDistance, TargetDistance),  afYOffset = Utility.RandomFloat(-TargetDistance, TargetDistance), afZOffset = Utility.RandomFloat(-TargetDistance, TargetDistance))
			DN102_LabDemo3Spell.Cast(DN102_LabDemo3Source, dummyTarget)
		EndIf
		Utility.Wait(Utility.RandomFloat(0.05, 0.2))
		projectiles += 1
	EndWhile

	;Disable the blue light.
	DN102_LabDemo3Light.DisableNoWait(True)

	;Set demoRunning to false if it wasn't already.
	demoRunning = False
EndFunction


;Override unused functions from TrapBase with empty versions.
Function ResolveLeveledDamage()
EndFunction

Function LocalDisarmTrap()
EndFunction

Function LocalDisarmReward()
EndFunction

Function LocalOnTimer(int aiTimerID)
endFunction
