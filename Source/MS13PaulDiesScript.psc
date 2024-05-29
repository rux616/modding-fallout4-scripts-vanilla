Scriptname MS13PaulDiesScript extends Quest Conditional

int Property startupTimerID = 1 const auto
int Property findPhotoTimerID = 2 const auto
int Property PaulLOSTimerID = 3 const auto

float startupHours = 72.0
float startupHoursDC = 24.0

float waitToFindPhotoHours = 120.0 ; 5 days
float waitToFindPhotoHoursReset = 12.0 ; if timer expires but ambush isn't done, wait another 12 hours

; called when quest starts
Event OnStoryKillActor(ObjectReference akVictim, ObjectReference akKiller, Location akLocation, int aiCrimeStatus, \
  int aiRelationshipRank)
	if aiCrimeStatus == 2
		DeathWitnessed = true
	endif
EndEvent

Event OnGainLOS(ObjectReference akViewer, ObjectReference akTarget)
	actor player = Game.GetPlayer()
	actor paul = Alias_PaulPembroke.GetActorRef()
	if akViewer == player && akTarget == paul && PlayerKnowsPaulIsDead == false
		debug.trace(self + " OnGainLOS on Paul's body")
		; start running timer
		StartTimer(1.0, PaulLOSTimerID)
		if !PlayerKnowsPaulIsDead
			RegisterForDetectionLOSLost(player, paul)
		endif
	endif
endEvent

Event OnLostLOS(ObjectReference akViewer, ObjectReference akTarget)
	actor player = Game.GetPlayer()
	actor paul = Alias_PaulPembroke.GetActorRef()
	if akViewer == player && akTarget == paul
		debug.trace(self + " OnLostLOS on Paul's body")
		CancelTimer(PaulLOSTimerID)
		if !PlayerKnowsPaulIsDead
			RegisterForDetectionLOSGain(player, paul)
		endif
	endif
endEvent

function Startup()
	actor killer = Alias_Killer.GetActorRef()
	actor paul = Alias_PaulPembroke.GetActorRef()
	actor cooke = Alias_HenryCooke.GetActorRef()
	actor player = Game.GetPlayer()
	Location deathLocation = Alias_DeathLocation.GetLocation()

	float waitHours = startupHours
	; if Paul dies in Diamond City, Darcy hears about it sooner
	if deathLocation == DiamondCityLocation || DiamondCityLocation.IsChild(deathLocation)
		DiedInDiamondCity = true
		waitHours = startupHoursDC
	endif

	; run timer for quest to really start
	StartTimerGameTime(waitHours, startupTimerID)

	if killer && (player.GetFactionReaction(killer) == 2 || killer == player)
		KilledByPlayer = true
		setStage(20) ; player knows paul is dead
	endif
	
	; how did Paul die?

	; killed in Taphouse by Cooke (offstage - player doesn't know)
	if MS13.GetStageDone(340)
		DarcyInvestigation = 1

	; kill in Taphouse during confrontation (player was there)
	elseif MS13.GetStageDone(250) && MS13.GetStage() < 400
		DarcyInvestigation = 2
		setStage(20) ; player knows paul is dead
		MS13.SetStage(280) ; update objective

	; killed during/before ambush
	elseif MS13.GetStageDone(450) && !MS13.GetStageDone(540) && MS13.GetStageDone(455)
		DarcyInvestigation = 3
		setStage(20) ; player knows paul is dead

	; killed after ambush by player/allies
	elseif MS13.GetStageDone(455) && MS13.GetStageDone(750) && MS13.GetStageDone(810) && KilledByPlayer && !DiedInDiamondCity
		DarcyInvestigation = 4
		setStage(20) ; player knows paul is dead

	; killed some other way
	else
		DarcyInvestigation = 5
	endif

	; register for LOS gain on Paul
	if !PlayerKnowsPaulIsDead
		RegisterForDetectionLOSGain(player, paul)
	endif

endFunction

function StartFindPhotoTimer(float timerHours = 0.0)
	; by default, use waitToFindPhotoHours
	if timerHours == 0
		timerHours = waitToFindPhotoHours
	endif
	; run timer for Darcy to find Paul's photo
	StartTimerGameTime(timerHours, findPhotoTimerID)
endFunction

Event OnTimer(int aiTimerID)
	if aiTimerID == PaulLOSTimerID
		actor player = Game.GetPlayer()
		actor paul = Alias_PaulPembroke.GetActorRef()

		debug.trace(self + " Paul LOS timer")
		; close enough to see Paul's body - flag that player knows he's dead
		if player.GetDistance(paul) < 800
			debug.trace(self + " Close enough - player knows paul is dead")
			setStage(20) ; player knows paul is dead
			CancelTimer(PaulLOSTimerID)
		endif
		; continue timer if still in LOS and player doesn't know
		if !PlayerKnowsPaulIsDead && player.HasDetectionLOS(paul)
			StartTimer(1.0, PaulLOSTimerID)
		endif
	endif
endEvent

Event OnTimerGameTime(int aiTimerID)
	if aiTimerID == startupTimerID
		SetStage(10)
	elseif aiTimerID == findPhotoTimerID
		; don't let Darcy find photo if Cooke is alive and ambush isn't done yet
		if Alias_HenryCooke.GetActorRef().IsDead() || ( MS13.GetStageDone(250) && MS13.GetStageDone(800) )
			setStage(200)
		else
			; run timer again (shorter)
			StartFindPhotoTimer(waitToFindPhotoHoursReset)
		endif
	endif
EndEvent

function UpdateDarcyLastGreetTimer()
	; set global to current time + 1 day, which is next time Darcy will ask about Paul
	MS13PaulDiesDarcyRegreetTimer.SetValue(Utility.GetCurrentGameTime() + 1.0)
endFunction

bool Property DeathWitnessed conditional auto
{ did anyone witness Paul's death?
}

bool Property KilledByPlayer conditional auto
{ did player kill Paul? }

bool Property PlayerKnowsPaulIsDead conditional auto
{ does player know Paul is dead? (best guess) }

bool Property DiedInDiamondCity conditional auto
{ true if Paul died in Diamond City
}

Int Property DarcyInvestigation = 0 Auto Conditional
{
	1 = killed in Taphouse during confrontation with Cooke
	2 = killed before/during ambush
	3 = killed while dividing spoils
	4 = died some other way
}

ReferenceAlias Property Alias_PaulPembroke Auto const
ReferenceAlias Property Alias_Killer Auto const
LocationAlias Property Alias_DeathLocation Auto const
ReferenceAlias Property Alias_DarcyPembroke Auto const
ReferenceAlias Property Alias_HenryCooke Auto const

MS13Script Property MS13 Auto const

Location Property DiamondCityLocation auto const

GlobalVariable Property MS13PaulDiesDarcyRegreetTimer Auto Const
