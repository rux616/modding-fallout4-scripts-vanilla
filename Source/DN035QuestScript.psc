Scriptname DN035QuestScript extends Quest Conditional
{Quest script for DN035 - Easy City Downs. Mainly handles reprogramming the racing robots, updating their package and text replacement variables.}

Group AutofillProperties
	ActorValue property Aggression Auto Const Mandatory
	{Aggression AV}

	ActorValue property DN035_ReserveRacersReleased Auto Const Mandatory
	{AV used to release the Reserve Racers from their initial packages.}

	Explosion property CarNuke Auto Const Mandatory
	{The explosion with which the robots self destruct. Big boom.}

	Faction property DN035_RoboRacerFaction Auto Const Mandatory
	{Robot racer faction.}

	Faction property RaiderFaction Auto Const Mandatory
	{Raider faction.}

	Faction property PlayerFaction Auto Const Mandatory
	{Player faction.}

	GlobalVariable property DN035_ReserveRacersCount Auto Const Mandatory
	{Global used to track the number of living reserve racers.}

	Sound property ObjTurretAlarmWarning Auto Const Mandatory
	{Alarm sound to play prior to self destruct.}

	;Quest announcement scenes. All of these autofill.
	Scene property DN035_Announcement01_Idle Auto Const Mandatory
	Scene property DN035_Announcement02_Hostiles Auto Const Mandatory
	Scene property DN035_Announcement03_CallInRobots Auto Const Mandatory
	Scene property DN035_Announcement04_Reprogramming Auto Const Mandatory

	;Scene played by the eyebot who leads the racers.
	Scene property DN035_EyebotRacer Auto Const Mandatory
EndGroup

Group QuestProperties
	RefCollectionAlias property EasyCityDownsRobots Auto Const Mandatory
	{The racing robots.}

	RefCollectionAlias property EasyCityDownsRobotReserve Auto Const Mandatory
	{The reserve racer robots.}

	RefCollectionAlias property EasyCityDownsTerminals Auto Const Mandatory
	{The terminals that control the robots.}

	Message[] property RaceStateMsg Auto Const Mandatory
	{Strings for the Race State field.}

	Message[] property RaceRouteMsg Auto Const Mandatory
	{Strings for the Race Route field.}

	Message[] property RaceTargetingMsg Auto Const Mandatory
	{Strings for the Race Targeting field.}

	Message[] property RaceCombatInhibitorsMsg Auto Const Mandatory
	{Strings for the Race Combat Inhibitors field.}

	Message[] property RaceSelfDestructMsg Auto Const Mandatory
	{Strings for the Race Self Destruct field.}
EndGroup

Group RaceConditionalProperties
	int property RaceState Auto Hidden Conditional
	{0=Active, 1=Shut Down}

	int property RaceRoute Auto Hidden Conditional
	{0-Not Started, 1-Normal, 2-Call In to Camp, 3-Scrambled}

	int property RaceTargeting Auto Hidden Conditional
	{0=Normal, 1=Raiders Only, 2=Scramble}

	int property RaceCombatInhibitors Auto Hidden Conditional
	{0-On, 1-Off, 2=Targeting Scrambled}

	int property RaceReserves Auto Hidden Conditional
	{0=Normal, 1=Activated}

	int property RaceSelfDestruct Auto Hidden Conditional
	{0=Off, 1-7=On & Beeping, 8=Destruct, 10=Destroyed}

	bool property ShouldResumeHostilesScene Auto Hidden Conditional
	{0=False, 1=True}
EndGroup

bool isUpdatePlayerDirected	;Is the next robot update player-directed?


Function SetRaceState(int newState, bool isPlayerDirected = False)
	RaceState = newState
	isUpdatePlayerDirected = isPlayerDirected
	StartTimer(0.25, 1)
EndFunction

Function SetRaceRoute(int newRoute, bool isPlayerDirected = False)
	RaceRoute = newRoute
	isUpdatePlayerDirected = isPlayerDirected
	StartTimer(0.25, 1)
EndFunction

Function SetRaceTargeting(int newTargeting, bool isPlayerDirected = False)
	RaceTargeting = newTargeting
	isUpdatePlayerDirected = isPlayerDirected
	StartTimer(0.25, 1)
EndFunction

Function SetRaceCombatInhibitors(int newCombatInhibitors, bool isPlayerDirected = False)
	RaceCombatInhibitors = newCombatInhibitors
	isUpdatePlayerDirected = isPlayerDirected
	StartTimer(0.25, 1)
EndFunction

Function SetRaceReserves(int newReserves, bool isPlayerDirected = False)
	RaceReserves = newReserves
	isUpdatePlayerDirected = isPlayerDirected
	StartTimer(0.25, 1)
EndFunction

Function RaceSelfDestruct(int newSelfDestruct, bool isPlayerDirected = False)
	RaceSelfDestruct = newSelfDestruct
	if (newSelfDestruct == 1)
		SetStage(35)
	EndIf
	isUpdatePlayerDirected = isPlayerDirected
	StartTimer(0.25, 1)
EndFunction


Function UpdateRobots()
	;Debug.Trace("Update Robots called with " + RaceState + ", " + RaceRoute + ", " + RaceTargeting + ", " + RaceReserves + ", " + RaceSelfDestruct)

	;If this is a player-directed change (the player used one of the reprogramming terminals),
	;and the boss is still making announcements (he stops when he becomes hostile, stage 40):
	; - Stop the Idle/Hostiles/CallIn scenes and play the Reprogramming scene to adknowledge the player's action.
	; - If we were playing the Hostiles scene, note that and resume it once the Reprogramming scene is done (handled by the scene).
	if (isUpdatePlayerDirected && (!GetStageDone(40)))
		if (DN035_Announcement02_Hostiles.IsPlaying())
			ShouldResumeHostilesScene = True
		EndIf
		DN035_Announcement01_Idle.Stop()
		DN035_Announcement02_Hostiles.Stop()
		DN035_Announcement03_CallInRobots.Stop()
		DN035_Announcement04_Reprogramming.Start()
	EndIf

	;Clear the Player Directed flag for next time.
	isUpdatePlayerDirected = False

	;Handle Route.
	;Nothing to do here-- their packages reference the RaceRoute variable directly, and we EVP them later in this function.

	;Handle Targeting.
	if (RaceTargeting == 0) ;Allied with raider, hostile to Player.
		DN035_RoboRacerFaction.SetAlly(DN035_RoboRacerFaction)
		DN035_RoboRacerFaction.SetAlly(RaiderFaction)
		DN035_RoboRacerFaction.SetEnemy(PlayerFaction)
	ElseIf (RaceTargeting == 1) ;Allied with player, hostile to Raiders.
		DN035_RoboRacerFaction.SetAlly(DN035_RoboRacerFaction)
		DN035_RoboRacerFaction.SetEnemy(RaiderFaction)
		DN035_RoboRacerFaction.SetAlly(PlayerFaction)
	ElseIf (RaceTargeting == 2) ;Hostile to both Player and Raiders.
		DN035_RoboRacerFaction.SetEnemy(DN035_RoboRacerFaction)
		DN035_RoboRacerFaction.SetEnemy(RaiderFaction)
		DN035_RoboRacerFaction.SetEnemy(PlayerFaction)
	EndIf

	;Handle Self Destruct
	;Start a timer that manages the countdown and triggers the explosion.
	if (RaceSelfDestruct == 1)
		RaceSelfDestruct = 2
		StartTimer(1, 2)
	EndIf

	Actor robot
	int i = 0
	While (i < EasyCityDownsRobots.GetCount())
		robot = EasyCityDownsRobots.GetAt(i) as Actor
		robot.StopCombat()

		;Handle State & Reserves.
		;Robots should be unconscious if State=1 (Disabled) or if they're in the reserves and haven't been activated yet.
		if ((RaceState == 1) || ((RaceReserves == 0) && (EasyCityDownsRobotReserve.Find(robot) >= 0)))
			robot.SetUnconscious(True)
		Else
			robot.SetUnconscious(False)
			;Release Reserve Racers from their initial packages. This has no effect on the other robots.
			robot.SetValue(DN035_ReserveRacersReleased, 1)
		EndIf

		;Handle Targeting & Combat Inhibitors
		if (RaceTargeting < 2)
			if (RaceCombatInhibitors == 0)
				robot.SetValue(Aggression, 0)
				(EasyCityDownsRobots as DN035_RacingRobotsScript).RegisterForHitEvents(robot)
			Else
				robot.SetValue(Aggression, 2)
			EndIf
		Else
			robot.SetValue(Aggression, 3)
		EndIf

		;Handle Route (conditions on packages)
		robot.EvaluatePackage()
		i = i + 1
	EndWhile

	;Pause the Eyebot's scene if he's now unconscious.
	if (RaceState == 1)
		DN035_EyebotRacer.Pause(True)
	Else
		DN035_EyebotRacer.Pause(False)
	EndIf

	;--Terminal Text Replacement--
	;Select the terminal text replacement strings.
	Message myState = RaceStateMsg[RaceState]
	Message myRoute = RaceRouteMsg[RaceRoute]
	Message myTargeting = RaceTargetingMsg[RaceTargeting]

	;If RaceSelfDestruct>0, use message 1. Otherwise, use message 2.
	Message myAlert
	if (RaceSelfDestruct == 0)
		myAlert = RaceSelfDestructMsg[0]
	Else
		myAlert = RaceSelfDestructMsg[1]
	EndIf

	;If RaceTargeting=2, we report the Inhibitors, a dependent variable, as scrambled. [2]
	Message myInhibitors
	if (RaceTargeting == 2)
		myInhibitors = RaceCombatInhibitorsMsg[2]
	Else
		myInhibitors = RaceCombatInhibitorsMsg[RaceCombatInhibitors]
	EndIf

	;Update all of the terminals that use those strings.
	ObjectReference term
	i = 0
	While (i < EasyCityDownsTerminals.GetCount())
		term = EasyCityDownsTerminals.GetAt(i)
		term.AddTextReplacementData("DN035Status", myState)
		term.AddTextReplacementData("DN035Route", myRoute)
		term.AddTextReplacementData("DN035Targeting", myTargeting)
		term.AddTextReplacementData("DN035Inhibitors", myInhibitors)
		term.AddTextReplacementData("DN035Alert", myAlert)
		i = i + 1
	EndWhile

	;Update the reserve racer count, which is handled by a global.
	UpdateReserveRacerCount()
EndFunction

;Updates the Reserve Racer count based on its global.
Function UpdateReserveRacerCount()
	if (RaceReserves == 1)
		DN035_ReserveRacersCount.SetValue(0)
	Else
		int i = 0
		int count = 0
		Actor current
		While (i < EasyCityDownsRobotReserve.GetCount())
			current = EasyCityDownsRobotReserve.GetAt(i) as Actor
			if ((current != None) && (!current.IsDead()))
				count = count + 1
			EndIf
			i = i + 1
		EndWhile
		DN035_ReserveRacersCount.SetValue(count)		
	EndIf
	Self.UpdateCurrentInstanceGlobal(DN035_ReserveRacersCount)
EndFunction

Event OnTimer(int timerID)
	if (timerID == 1)
		;This is a normal robot update.
		UpdateRobots()
	ElseIf (timerID == 2)
		Actor robot
		int i = 0
		if (RaceSelfDestruct < 8)
			While (i < EasyCityDownsRobots.GetCount())
				robot = EasyCityDownsRobots.GetAt(i) as Actor
				ObjTurretAlarmWarning.Play(robot)
				i = i + 1
			EndWhile
			RaceSelfDestruct = RaceSelfDestruct + 1
			StartTimer(1, 2)
		Else
			While (i < EasyCityDownsRobots.GetCount())
				robot = EasyCityDownsRobots.GetAt(i) as Actor
				robot.PlaceAtMe(CarNuke)
				robot.Kill()
				Utility.Wait(Utility.RandomFloat(0.5, 1))
				i = i + 1
			EndWhile
			RaceSelfDestruct = 10
		EndIf
	EndIf
EndEvent