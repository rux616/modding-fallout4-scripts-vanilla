Scriptname testJoelTerminalFlashListener extends ObjectReference Const

keyword property LinkTerminalTurret auto const
faction property playerAllyFaction auto const
faction property raiderFaction auto const
actorValue property Aggression auto const

Event OnHolotapeChatter( string astrChatter, float afNumericData )
	Debug.trace("________________________")
	Debug.trace("| HOLOTAPE LISTENER")
	Debug.trace("|   Received Chatter")
	Debug.trace("|   Chatter: "+astrChatter)
	Debug.trace("|   Numeric: "+afNumericData)
	Debug.trace("________________________")

	ObjectReference[] linkedRefChain = getLinkedrefChain(LinkTerminalTurret)
	int i = 0
	while i < countLinkedRefChain(LinkTerminalTurret)

		; go through all the received chatters and respond to them.
		if astrChatter == "setTurretStatusOff"
			(linkedRefChain[i] as actor).setUnconscious()
		endif
		if astrChatter == "SetTurretStatusFriend"
			(linkedRefChain[i] as actor).removeFromAllFactions()
			(linkedRefChain[i] as actor).setFactionRank(playerAllyFaction, 1)
			(linkedRefChain[i] as actor).setValue(Aggression, 2)
			debug.trace("Turret in raider faction? "+(linkedrefChain[i] as actor).isinFaction(raiderFaction))
			debug.trace("Turret in player ally faction? "+(linkedrefChain[i] as actor).isinFaction(playerAllyFaction))
		endif
		if astrChatter == "SetTurretStatusFrenzy"
			(linkedRefChain[i] as actor).setValue(Aggression, 3)
		endif
		if astrChatter == "SetTurretStatusDestroy"
			if (linkedRefChain[i] as turretMountedScript)
				TurretMountedScript TurretScript = linkedRefChain[i] as TurretMountedScript
				TurretScript.registerForAnimationEvent(linkedRefChain[i],"WeaponFire")
			else
				TurretStandingScript TurretScript = linkedRefChain[i] as TurretStandingScript	
				TurretScript.registerForAnimationEvent(linkedRefChain[i],"WeaponFire")
			endif
		endif

		(linkedRefChain[i] as actor).stopcombat()
		(linkedRefChain[i] as actor).evaluatePackage()
		i += 1

	endWhile
endEvent