ScriptName DN021_BugZapperScript Extends TrapBase
{Script for the custom, reusable 'Bug Zapper' trap in DN021.}

;This script is a multi-use version of the standard electric arc trap (TrapElectricArc),
;intended for the special bug zapper in Chestnut Hillock Reservoir.

Group LocalProperties CollapsedOnRef
	Static property XMarker Auto Const
	Spell property DN021_TrapBugZapperArcSpell Auto Const 	;Variant of the standard arc trap spell that does extra damage to bugs.
	int property maxProjectiles = 20 Auto Const
	float property TargetDistance = 384.0 Auto Const
	Keyword property LinkCustom01 Auto Const 	;Link to the circuit breaker's On activator.
	Keyword property LinkCustom02 Auto Const 	;Link to the circuit breaker's Off activator.
	Keyword property LinkCustom03 Auto Const	;Link to the circuit breaker itself.
EndGroup

;Local variables.
bool initialized = False		;Have we done our first-time initialization?
bool isFiring				;Are we currently firing?
int projectiles = 0 		;How many projectiles have we fired in this activation?

;Local refs.
ObjectReference OnStateActivator
ObjectReference OffStateActivator

Event OnLoad()
	if (!initialized)
		initialized = True
		OnStateActivator = GetLinkedRef(LinkCustom01)
		OffStateActivator = GetLinkedRef(LinkCustom02)

		RegisterForRemoteEvent(OnStateActivator, "OnActivate")
		RegisterForRemoteEvent(OffStateActivator, "OnActivate")
	EndIf
EndEvent

;Allow the circuit breaker to turn the bug zapper on or off.
Event ObjectReference.OnActivate(ObjectReference source, ObjectReference akActivator)
	if (source == OnStateActivator)
		isFiring = True
		LocalFireTrap()
	Else
		isFiring = False
	EndIf
EndEvent

;Largely copied from TrapElectricArc, with some simplifications for this particular use-case.
Function LocalFireTrap()
	ObjectReference akTarget
	projectiles = 0

	;Store trap fire refs. 
	ObjectReference targetRange = GetLinkedRef()
	ObjectReference targetXMarker = targetRange.placeAtMe(XMarker)
	ObjectReference CircuitBreakerActivator = GetLinkedRef(LinkCustom03) ;Circuit breaker

	While ((projectiles < maxProjectiles) && Is3dLoaded() && isFiring)
		akTarget = Game.FindRandomActorFromRef(targetRange, TargetDistance)

		;If we have a target, roll to see whether to fire at it. Half the time, we fire at the XMarker anyway.		
		if (akTarget && (Utility.RandomInt(1, 100) <= 50))
			;Debug.trace(self + ": firing at actor >> " + akTarget)
			DN021_TrapBugZapperArcSpell.Cast(Self, akTarget)
		Else 		
			;Debug.trace(self + ": firing at dummy >> " + myXmarker)
			targetXMarker.Moveto(targetRange, afXOffset = Utility.RandomFloat(-200.0, 200.0),  afYOffset = Utility.RandomFloat(-200.0, 200.0), afZOffset = Utility.RandomFloat(-200.0, 200.0))
			DN021_TrapBugZapperArcSpell.Cast(Self, targetXMarker)
		EndIf
		Utility.Wait(Utility.RandomFloat(0.05, 0.2))
		projectiles += 1
	EndWhile

	;We no longer need the XMarker.
	targetXMarker.Delete()

	if (isFiring)
		CircuitBreakerActivator.Activate(CircuitBreakerActivator)
	EndIf
EndFunction


;Override unused functions from TrapBase with empty versions.
Function ResolveLeveledDamage ()
EndFunction

Function LocalDisarmTrap()
EndFunction

Function LocalDisarmReward()
EndFunction

Function LocalOnTimer(int aiTimerID)
endFunction
