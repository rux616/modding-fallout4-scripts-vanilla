Scriptname hackerHolotapeTurretSCRIPT extends ObjectReference
{Script to set up globals for feedback in the holotape interace.}

Keyword Property LinkTerminalTurret Auto Const
GlobalVariable Property gNativeTermTurretsConnected Auto Const
GlobalVariable Property gNativeTermTurretsFrenzied auto
GlobalVariable Property gNativeTermTurretsSabotaged auto

faction property playerAllyFaction auto const
faction property raiderFaction auto const
actorValue property Aggression auto const

spell property hackerTurretSabotageSpell auto const
MagicEffect Property hackerTurretSabotageEffect Auto Const

Message Property terminalTurretStatusCombat Auto Const
Message Property terminalTurretStatusDead Auto Const
Message Property terminalTurretStatusNonCombat Auto Const
Message Property terminalTurretStatusOffline Auto Const
Message Property terminalTurretStatusOnline Auto Const
Message Property terminalTurretStatusSearching Auto Const
Message Property terminalTurretStatusFrenzied Auto Const
Message Property terminalTurretStatusSabotaged Auto Const

objectReference myTerminalref

Event OnHolotapePlay( ObjectReference akTerminalRef )

	; store the terminal we're being played on.
	myTerminalref = akTerminalRef

	debug.trace("HOLOTAPE: set up globals for turret info")
	objectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(LinkTerminalTurret)
	int i = 0
	while i < akTerminalRef.countLinkedRefChain(LinkTerminalTurret)
		i += 1
	endWhile
	gNativeTermTurretsConnected.setValue(i)
	akTerminalRef.addtextreplacementData("Connected", gNativeTermTurretsConnected)

	; Add text replacement Data for frenzy status.
	if ((akTerminalRef.getLinkedRef(linkTerminalTurret) as actor).getValue(Aggression) == 3)
		gNativeTermTurretsFrenzied.setValue(1)
	endif
	akTerminalRef.addtextreplacementData("Frenzied", gNativeTermTurretsFrenzied)

	if ((akTerminalRef.getLinkedRef(linkTerminalTurret) as actor).hasMagicEffect(hackerTurretSabotageEffect))
		gNativeTermTurretsFrenzied.setValue(1)
	endif
	akTerminalRef.addtextreplacementData("Sabotaged", gNativeTermTurretsSabotaged)	
	
	; set up text.repl. for Faction owner of ref of first linked turret.
	akTerminalRef.addtextreplacementData("Faction", (akTerminalRef.getLinkedRef(linkTerminalTurret)).getFactionOwner())

	if (akTerminalRef.getLinkedref(linkTerminalTurret) as actor).getCombatState() == 0
		akTerminalRef.addTextReplacementData("AIstatus", terminalTurretStatusNonCombat)
	elseif (akTerminalRef.getLinkedref(linkTerminalTurret) as actor).getCombatState() == 1
		akTerminalRef.addTextReplacementData("AIstatus", terminalTurretStatusCombat)
	else
		akTerminalRef.addTextReplacementData("AIstatus", terminalTurretStatusSearching)
	endif

	if (akTerminalRef.getLinkedref(linkTerminalTurret) as actor).isDead()
		akTerminalRef.addtextReplacementData("OnStatus", terminalTurretStatusDead)
		akTerminalRef.addtextReplacementData("AIstatus", terminalTurretStatusDead)
		else
		if ((akTerminalRef.getLinkedref(linkTerminalTurret) as actor).isUnconscious())
			akTerminalRef.addtextreplacementData("OnStatus", terminalTurretStatusOnline)
		else
			akTerminalRef.addtextreplacementData("OnStatus", terminalTurretStatusOffline)
		endif
	endif

	debug.trace("HOLOTAPE: gNativeTermTurretsConnected = "+gNativeTermTurretsConnected.getValue())
	debug.trace("HOLOTAPE: Faction = "+(akTerminalRef.getLinkedRef(linkTerminalTurret)).getFactionOwner())

EndEvent

Event OnHolotapeChatter( string astrChatter, float afNumericData )

	ObjectReference[] linkedRefChain = myTerminalRef.getLinkedrefChain(LinkTerminalTurret)
	int i = 0
	while i < myTerminalRef.countLinkedRefChain(LinkTerminalTurret)

		; go through all the received chatters and respond to them.
		if astrChatter == "setTurretStatusOff"
			(linkedRefChain[i] as actor).setUnconscious()
			myTerminalRef.addtextreplacementData("OnStatus", terminalTurretStatusOffline)
		endif
		if astrChatter == "SetTurretStatusFriend"
			(linkedRefChain[i] as actor).removeFromAllFactions()
			(linkedRefChain[i] as actor).setFactionRank(playerAllyFaction, 1)
			(linkedRefChain[i] as actor).setValue(Aggression, 2)
			debug.trace("Turret in raider faction? "+(linkedrefChain[i] as actor).isinFaction(raiderFaction))
			debug.trace("Turret in player ally faction? "+(linkedrefChain[i] as actor).isinFaction(playerAllyFaction))
			debug.trace("holotape: update faction string replacer! (SWF version)")
			(linkedrefChain[i]).setActorOwner(game.getplayer().getActorBase())
			;addtextreplacementData("Faction", playerAllyFaction)
			myTerminalRef.addtextreplacementData("Faction", game.getPlayer().getActorBase())
		endif
		if astrChatter == "SetTurretStatusFrenzy"
			(linkedRefChain[i] as actor).setValue(Aggression, 3)
			gNativeTermTurretsFrenzied.setValue(1)
			myTerminalRef.addTextReplacementData("Frenzied", gNativeTermTurretsFrenzied)
		endif
		if astrChatter == "SetTurretStatusDestroy"
			; apply the magic effect which handles the sabotage.
			debug.trace("Holotape: (SWF version) Apply "+hackerTurretSabotageSpell+" to "+linkedrefChain[i])
			if !((linkedRefChain[i] as actor).hasMagicEffect(hackerTurretSabotageEffect))
				hackerTurretSabotageSpell.cast(linkedRefChain[i], linkedRefChain[i])
				(linkedRefChain[i] as actor).doCombatSpellApply(hackerTurretSabotageSpell,linkedRefChain[i])
			endif
			gNativeTermTurretsSabotaged.setValue(1)	
			myTerminalRef.addTextReplacementData("Sabotaged", gNativeTermTurretsSabotaged)
		endif

		(linkedRefChain[i] as actor).stopcombat()
		(linkedRefChain[i] as actor).evaluatePackage()
		i += 1

	endWhile
endEvent