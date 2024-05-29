Scriptname DN070_TrapTripwire extends TrapTripwire Hidden
{Variant of the standard TrapTripwire script. Ignores triggering events from actors in a specific faction, so the Protectrons won't trip the security system.}

Faction property RobotFaction Auto Const Mandatory
{Standard Robot Faction.}

Faction property TurretFaction Auto Const Mandatory
{Standard Turret Faction.}


;DN070_TurretHallManagerScript calls this to enable tripwires. Just use the Parent's OnReset behavior.
Function EnableTripwire()
	Parent.OnReset()
EndFunction

;DN070_TurretHallManagerScript calls this to deactivate tripwires. Just go to 'Inactive'.
Function DeactivateTripwire()
	Self.GoToState("Inactive")
EndFunction

;DN070_TurretHallManagerScript calls this to visually turn off the tripwire. Right now, we have to just play the 'Trip' animation.
Function DisableTripwire()
	Self.PlayAnimation("Disarm")
EndFunction

Auto State Active
	Event OnTriggerEnter(ObjectReference akActionRef)
		Actor akActionActor = akActionRef as Actor
		;Debug.Trace("akActionRef is: " + akActionActor +", "+ (akActionActor == None) +", "+ (!akActionActor.IsInFaction(RobotFaction)) +", "+ (!akActionActor.IsInFaction(TurretFaction)))
		if ((akActionActor != None) && (!akActionActor.IsInFaction(RobotFaction)) && (!akActionActor.IsInFaction(TurretFaction)))
			;Debug.Trace("DN070 akActionActor Was: " + akActionActor)
			Parent.OnTriggerEnter(akActionRef)
		EndIf
	EndEvent
EndState