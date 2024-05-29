Scriptname DLC04:DLC04_GZNukaGalaxyFactionTriggerScript Extends ObjectReference

Faction property DLC04GZNukaGalaxyAlienInvaderFaction Auto Const Mandatory
Faction property DLC04GZNukaGalaxyColonyRobotsFaction Auto Const Mandatory

ObjectReference property DLC04GZNukaGalaxy_PlanetscapeEMS01 Auto Const Mandatory
ObjectReference property DLC04GZNukaGalaxy_PlanetscapeEMS02 Auto Const Mandatory
ObjectReference property DLC04GZNukaGalaxy_PlanetscapeEMS03 Auto Const Mandatory
ObjectReference property DLC04GZNukaGalaxy_PlanetscapeEMS04 Auto Const Mandatory
Keyword property EMSystemLinkToTurf Auto Const Mandatory

bool FactionTriggerIsActive = False

Event OnTriggerEnter(ObjectReference akActionRef)
	Debug.Trace("I was entered by " + akActionRef)
	if (akActionRef == Game.GetPlayer())
		Debug.Trace("OnTriggerEnter by " + akActionRef + " toggles AI TRUE")
		ToggleCombatantAI(True)
		StartTimer(1, 1)
	EndIf
EndEvent

Event OnTimer(int timerID)
	if (Self.GetTriggerObjectCount() == 0)
		Debug.Trace("OnTimer sets AI False")
		ToggleCombatantAI(False)
	Else
		StartTimer(1, 1)
	EndIf
EndEvent

Event OnLoad()
	CancelTimer(1)
	Debug.Trace("OnLoad sets AI False")
	ToggleCombatantAI(False)
EndEvent

Event OnUnload()
	CancelTimer(1)
	Debug.Trace("OnUnload sets AI False")
	ToggleCombatantAI(False)
EndEvent

Function ToggleCombatantAI(bool shouldEnable)
	FactionTriggerIsActive = shouldEnable
	if (shouldEnable)
		DLC04GZNukaGalaxyAlienInvaderFaction.SetEnemy(DLC04GZNukaGalaxyColonyRobotsFaction)
		DLC04GZNukaGalaxyColonyRobotsFaction.SetEnemy(DLC04GZNukaGalaxyAlienInvaderFaction)
	Else
		DLC04GZNukaGalaxyAlienInvaderFaction.SetAlly(DLC04GZNukaGalaxyColonyRobotsFaction)
		DLC04GZNukaGalaxyColonyRobotsFaction.SetAlly(DLC04GZNukaGalaxyAlienInvaderFaction)
	EndIf
	ToggleCombatantAIHelper(DLC04GZNukaGalaxy_PlanetscapeEMS01.GetActorsLinkedToMe(EMSystemLinkToTurf, None), shouldEnable)
	ToggleCombatantAIHelper(DLC04GZNukaGalaxy_PlanetscapeEMS02.GetActorsLinkedToMe(EMSystemLinkToTurf, None), shouldEnable)
EndFunction

Function ToggleCombatantAIHelper(Actor[] actors, bool shouldEnable)
	if (actors != None)
		int i = 0
		While (i < actors.Length)
			Actor a = actors[i] as Actor
			if (a != None)
				Debug.Trace("Enabling AI on " + a)
				a.EnableAI(shouldEnable)
				a.EvaluatePackage()
			EndIf
			i = i + 1
		EndWhile
	EndIf
EndFunction