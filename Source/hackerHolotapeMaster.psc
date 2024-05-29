Scriptname hackerHolotapeMaster extends ObjectReference conditional

Group textReplacementMessages
;Relevant textreplacement messages for use with Token text replacement in the terminals that need to be initialized prior to any function use.
Message Property terminalHackedDoorStatusOpen Auto Const
Message Property terminalHackedDoorStatusClosed Auto Const
Message Property terminalHackedDoorStatusLocked Auto Const
Message Property terminalHackedDoorStatusUnlocked Auto Const
Message Property terminalHackedStatusError Auto Const
Message Property blankmessage Auto Const
Message Property terminalTurretStatusCombat Auto Const
Message Property terminalTurretStatusDead Auto Const
Message Property terminalTurretStatusSomeDead Auto Const
Message Property terminalTurretStatusNonCombat Auto Const
Message Property terminalTurretStatusOffline Auto Const
Message Property terminalTurretStatusOnline Auto Const
Message Property terminalTurretStatusSearching Auto Const
Message Property terminalTurretStatusFrenzied Auto Const
Message Property terminalTurretStatusSabotaged Auto Const
endGroup

Group TurretProperties
;Relevant Turret hacking properties
Keyword Property LinkTerminalTurret Auto Const
GlobalVariable Property gNativeTermTurretsConnected Auto Const
GlobalVariable Property gNativeTermTurretsFrenzied auto Const
GlobalVariable Property gNativeTermTurretsSabotaged auto Const
GlobalVariable Property terminalHackerTurretTargetStatus auto Const

faction property playerAllyFaction auto const
faction property raiderFaction auto const
actorValue property Aggression auto const

spell property hackerTurretSabotageSpell auto const
MagicEffect Property hackerTurretSabotageEffect Auto Const

formlist property ExplosivesList auto const
formlist property DoorBlockerList auto const
formlist property ExplosivesListCanSee auto const
formlist property DoorBlockerListCanSee auto const
;Formlists for detecting nearby objects and tracking LoS for said objects before reaching the turret targeting function.

String property StateString auto
;String to store the state of the TrapBase script on any targeted traps.

Static property DebugXMarker auto

endGroup

Group RobotProperties
;Relevant Robot hacking properties
Keyword Property LinkTerminalProtectron auto const

endGroup

Group DoorProperties
;Relevant door hacking properties(Function might be removed)
Keyword Property LinkTerminalDoor auto Const
endGroup

Group VentProperties
;Relevant ventilation hacking properties
Keyword Property LinkTerminalVent auto Const
Keyword Property DamageTypeRadiation auto Const
endGroup

Group SafeProperties
;Globals for tracking safe object counts for text replacement specific to safes. (Function might be removed)
Keyword property LinkTerminalSafe auto Const
FormList Property terminalHackerSafeContentList Auto Const
GlobalVariable[] Property terminalHackerSafeGlobalArray Auto
endGroup

ObjectReference Property baseTerminal auto
;Is assigned the value from the akTerminalRef parameter in the OnHolotapePlay event.

int property HackerHolotape auto
;Property to set to define what part of the script needs to run to initialize the pertinent data for that holotape setup.
{Turrets = 1
 Spotlights = 2
 Robots = 3
 Doors = 4
 Vents = 5}

Event OnHolotapePlay(ObjectReference akTerminalRef)

baseTerminal = akTerminalRef
if akTerminalRef != none

	if HackerHolotape == 1
	;Turrets
		hackerHolotapeTurretSetup()

		elseif HackerHolotape == 3
		;Robots
			hackerHolotapeRobotSetup()

			elseif HackerHolotape == 4
			;Doors
				hackerHolotapeDoorSetup()

				elseif HackerHolotape == 5
				;Safes
					hackerHolotapeSafeSetup()

	endif

endif ;end of akTerminalRef != none

endEvent ;end of OnHolotapePlay event

Function hackerHolotapeTurretSetup()

ObjectReference[] turretsArray = baseTerminal.GetLinkedRefChain(LinkTerminalTurret)
Actor currentTurret = (baseTerminal.getLinkedRef(linkTerminalTurret) as Actor)
	
ExplosivesListCanSee.Revert()
DoorBlockerListCanSee.Revert()

;debug.trace("HOLOTAPE: set up globals for turret info")
int i = baseTerminal.CountLinkedRefChain(LinkTerminalTurret)
gNativeTermTurretsConnected.setValue(i)

baseTerminal.addtextreplacementData("Connected", gNativeTermTurretsConnected)

; Add text replacement Data for frenzy status.
if (currentTurret.getValue(Aggression) == 3)
	gNativeTermTurretsFrenzied.setValue(1)
endif
baseTerminal.addtextreplacementData("Frenzied", gNativeTermTurretsFrenzied)

if (currentTurret.hasMagicEffect(hackerTurretSabotageEffect))
	gNativeTermTurretsFrenzied.setValue(1)
endif
baseTerminal.addtextreplacementData("Sabotaged", gNativeTermTurretsSabotaged)

; set up text.repl. for Faction owner of ref of first linked turret.
if currentTurret.getFactionOwner() == none
	baseTerminal.addtextreplacementData("Faction", blankmessage)
else
	baseTerminal.addtextreplacementData("Faction", currentTurret.getFactionOwner())

endif

if currentTurret.getCombatState() == 0
	baseTerminal.addTextReplacementData("AIstatus", terminalTurretStatusNonCombat)
	elseif currentTurret.getCombatState() == 1
		baseTerminal.addTextReplacementData("AIstatus", terminalTurretStatusCombat)
		else
			baseTerminal.addTextReplacementData("AIstatus", terminalTurretStatusSearching)
endif

int t = 0	
while t < turretsArray.Length

	if (turretsArray[t] as Actor).isUnconscious()
		baseTerminal.addtextreplacementData("OnStatus", terminalTurretStatusOffline)
	else
		baseTerminal.addtextreplacementData("OnStatus", terminalTurretStatusOnline)
	endif

t += 1
endwhile
t = 0

while t < turretsArray.Length
	if (turretsArray[t] as actor).isDead()
		baseTerminal.addtextReplacementData("OnStatus", terminalTurretStatusDead)
		baseTerminal.addtextReplacementData("AIstatus", terminalTurretStatusDead)

		int ta = 0
		;ta = index for checking alive turrets
		while ta < turretsArray.Length

			if (turretsArray[ta] as actor).isDead() != 1
				baseTerminal.addtextReplacementData("OnStatus", terminalTurretStatusSomeDead)
				baseTerminal.addtextReplacementData("AIstatus", terminalTurretStatusDead)
				ta = turretsArray.Length
			endif

		ta += 1
		endWhile

		t = turretsArray.Length
	endif
t += 1
endwhile

ObjectReference[] ExplosivesArray = baseTerminal.GetLinkedRef(LinkTerminalTurret).FindAllReferencesOfType(ExplosivesList, 20000)
ObjectReference[] DoorBlockersArray = baseTerminal.GetLinkedRef(LinkTerminalTurret).FindAllReferencesOfType(DoorBlockerList, 20000)
;Arrays holding nearby Explosives and Doorblockers, as well as any turrets linked to the terminal.
TrapBase TargetScriptVar
		debug.trace(ExplosivesArray.Length + "Explosives")
		debug.trace(DoorBlockersArray.Length + "Doorblocks")
		debug.trace(TurretsArray.Length + "turrets")
		ObjectReference currentTarget
		i = 0
		while i < ExplosivesArray.Length

			t = 0
			while t < turretsArray.Length
				currentTurret = turretsArray[t] as Actor
				currentTarget = ExplosivesArray[i]
				TargetScriptVar = currentTarget as TrapGrenadeBouquet

					if TargetScriptVar != none
						StateString = TargetScriptVar.GetState()
					endif
						;debug.trace(TargetScriptVar.GetState())

					if currentTurret.IsDead() == false
						CanISeeFunction(currentTurret, currentTarget, ExplosivesListCanSee, "Grenade", "ProjectileNode", StateString)
						CanISeeFunction(currentTurret, currentTarget, ExplosivesListCanSee, "ProjectileNode", "ProjectileNode", StateString)
						CanISeeFunction(currentTurret, currentTarget, ExplosivesListCanSee, "", "ProjectileNode", StateString)
					endif
					;Checking LoS from the current indexed turret to the current indexed explosive and then storing it in the CanSee formlist for use later in the terminal.
					;debug.trace(ExplosivesListCanSee.GetSize())
			t += 1
			endWhile

		i += 1
		endWhile


		i = 0
		while i < DoorBlockersArray.Length

			t = 0
			while t < turretsArray.Length
				currentTurret = turretsArray[t] as Actor
				currentTarget = DoorBlockersArray[i]
					if (turretsArray[t] as Actor).IsDead() == false
						CanISeeFunction(currentTurret, currentTarget, DoorBlockerListCanSee, "Bar", "ProjectileNode")
						;CanISeeFunction(currentTurret, currentTarget, DoorBlockerListCanSee, "", "ProjectileNode") 
					endif
					;Checking LoS from the current indexed turret to the current indexed doorblocker and then storing it in the CanSee formlist for use later in the terminal.
					;debug.trace(DoorBlockerListCanSee.GetSize())
			t += 1
			endWhile

		i += 1
		endWhile
		debug.trace(ExplosivesListCanSee.GetSize())
		debug.trace(DoorBlockerListCanSee.GetSize())
		if ExplosivesListCanSee.GetSize() > 0 && DoorBlockerListCanSee.GetSize() > 0
			terminalHackerTurretTargetStatus.SetValueInt(3)

		elseif DoorBlockerListCanSee.GetSize() > 0
			terminalHackerTurretTargetStatus.SetValueInt(2)

		elseif ExplosivesListCanSee.GetSize() > 0
			terminalHackerTurretTargetStatus.SetValueInt(1)

		else
			terminalHackerTurretTargetStatus.SetValueInt(0)

		endif


endFunction

Function hackerHolotapeRobotSetup()
	ObjectReference[] robotArray = baseTerminal.GetLinkedRefChain(LinkTerminalProtectron)
	Actor currentProtectron = (baseTerminal.getLinkedRef(LinkTerminalProtectron) as Actor)

	; set up text.repl. for Faction owner of ref of first linked turret.
	if currentProtectron.getFactionOwner() == none
		baseTerminal.addtextreplacementData("Faction", blankmessage)
	else
		baseTerminal.addtextreplacementData("Faction", currentProtectron.getFactionOwner())
	endif

	if currentProtectron.getCombatState() == 0
		baseTerminal.addTextReplacementData("AIstatus", terminalTurretStatusNonCombat)
		elseif currentProtectron.getCombatState() == 1
			baseTerminal.addTextReplacementData("AIstatus", terminalTurretStatusCombat)
			else
				baseTerminal.addTextReplacementData("AIstatus", terminalTurretStatusSearching)
	endif

	int t = 0	
	while t < robotArray.Length

		if (robotArray[t] as Actor).isUnconscious()
			baseTerminal.addtextreplacementData("OnStatus", terminalTurretStatusOffline)
		else
			baseTerminal.addtextreplacementData("OnStatus", terminalTurretStatusOnline)
		endif

	t += 1
	endwhile
	t = 0

	while t < robotArray.Length
		if (robotArray[t] as actor).isDead()
			baseTerminal.addtextReplacementData("OnStatus", terminalTurretStatusDead)
			baseTerminal.addtextReplacementData("AIstatus", terminalTurretStatusDead)

			int ta = 0
			;ta = index for checking alive turrets
			while ta < robotArray.Length

				if (robotArray[ta] as actor).isDead() != 1
					baseTerminal.addtextReplacementData("OnStatus", terminalTurretStatusSomeDead)
					baseTerminal.addtextReplacementData("AIstatus", terminalTurretStatusDead)
					ta = robotArray.Length
				endif

			ta += 1
			endWhile

			t = robotArray.Length
		endif
	t += 1
	endwhile

endFunction

Function hackerHolotapeDoorSetup()
;All text replacement stuff to setup the terminal display ahead of any functions.
ObjectReference currentDoor = baseTerminal.GetLinkedRef(LinkTerminalDoor)

if currentDoor.GetOpenState() == 1 || currentDoor.GetOpenState() == 2
		baseTerminal.addtextreplacementData("DoorStatus", terminalHackedDoorStatusOpen)
	elseif currentDoor.GetOpenState() == 3 || currentDoor.GetOpenState() == 4
		baseTerminal.addtextreplacementData("DoorStatus", terminalHackedDoorStatusClosed)
endif

if currentDoor.IsLocked()
		baseTerminal.addtextreplacementData("LockStatus", terminalHackedDoorStatusLocked)
	else
		baseTerminal.addtextreplacementData("LockStatus", terminalHackedDoorStatusUnlocked)
endif

if currentDoor == none 
		baseTerminal.addtextreplacementData("DoorStatus", terminalHackedStatusError)
		baseTerminal.addtextreplacementData("LockStatus", terminalHackedStatusError)
endif

endFunction

Function hackerHolotapeSafeSetup()
;All text replacement for Safe hacking setup and seeing the contents of a safe.
form currentSafeObject
GlobalVariable currentSafeGlobal
int contentSize = terminalHackerSafeGlobalArray.Length

int i = 0
while i < contentSize
	currentSafeObject = terminalHackerSafeContentList.GetAt(i)
	currentSafeGlobal = terminalHackerSafeGlobalArray[i]
	int itemIndex = i + 1

	if currentSafeObject != none
		baseTerminal.addTextReplacementData("Item" + itemIndex, currentSafeObject)
		currentSafeGlobal.SetValueInt((baseTerminal.GetLinkedRef(LinkTerminalSafe).GetItemCount(currentSafeObject)))
		baseTerminal.addTextReplacementData("Item" + itemIndex + "Count", currentSafeGlobal)
		else
			baseTerminal.addTextReplacementData("Item" + itemIndex, blankmessage)
			baseTerminal.addTextReplacementData("Item" + itemIndex + "Count", blankmessage)
	endif

	i += 1
endWhile

endFunction

Function CanISeeFunction(ObjectReference turretArrayIndex, ObjectReference ArrayObjectsIndex, formlist CanISeeFormlist, String Node = "", String fromNode = "", String sState = "")
				;debug.trace(sState == "TrapFired")
			if turretArrayIndex.GetDistance(ArrayObjectsIndex) < 4096
				if (turretArrayIndex).HasDirectLOS(ArrayObjectsIndex, asSourceNode = fromNode, asTargetNode = Node)
					if CanISeeFormList.Find(ArrayObjectsIndex) < 0 && sState != "TrapFired" && ArrayObjectsIndex.IsDestroyed() != true && ArrayObjectsIndex.IsDisabled() == false
						CanISeeFormList.AddForm(ArrayObjectsIndex)
						debug.trace("Can see " + ArrayObjectsIndex)
					endif

				else
					debug.trace("Can't see " + Node +" on " + ArrayObjectsIndex + " Or already have in list")

				endif
				debug.trace("Too far for " + turretArrayIndex)

			endif

endFunction

