Scriptname MS13CookeDiesScript extends Quest Conditional

int Property startupTimerID = 1 const auto
int Property investigationTimerID = 2 const auto
int Property CookeLOSTimerID = 3 const auto
int Property cleanupBodyTimerID = 4 const auto

float cleanupBodyHours = 12.0
float startupHours = 150.0
float investigationHours = 150.0

; called when quest starts
Event OnStoryKillActor(ObjectReference akVictim, ObjectReference akKiller, Location akLocation, int aiCrimeStatus, \
  int aiRelationshipRank)
	debug.trace(self + "OnStoryKillActor: aiCrimeStatus=" + aiCrimeStatus)
	if aiCrimeStatus > 0
		DeathWitnessed = true
	endif
EndEvent

Event OnGainLOS(ObjectReference akViewer, ObjectReference akTarget)
	actor player = Game.GetPlayer()
	actor cooke = Alias_HenryCooke.GetActorRef()
	if akViewer == player && akTarget == cooke && PlayerKnowsCookeIsDead == false
		debug.trace(self + " OnGainLOS on Cooke's body")
		; start running timer
		StartTimer(1.0, CookeLOSTimerID)
		if !PlayerKnowsCookeIsDead
			RegisterForDetectionLOSLost(player, cooke)
		endif
	endif
endEvent

Event OnLostLOS(ObjectReference akViewer, ObjectReference akTarget)
	actor player = Game.GetPlayer()
	actor cooke = Alias_HenryCooke.GetActorRef()
	if akViewer == player && akTarget == cooke
		debug.trace(self + " OnLostLOS on Cooke's body")
		CancelTimer(CookeLOSTimerID)
		if !PlayerKnowsCookeIsDead
			RegisterForDetectionLOSGain(player, cooke)
		endIf
	endif
endEvent

function Startup()
	actor killer = Alias_Killer.GetActorRef()
	actor Cooke = Alias_HenryCooke.GetActorRef()
	actor paul = Alias_PaulPembroke.GetActorRef()
	actor player = Game.GetPlayer()
	Location deathLocation = Alias_DeathLocation.GetLocation()

	float waitHours = startupHours

	; run timer for quest to really start
	StartTimerGameTime(waitHours, startupTimerID)

	; run timer for cleaning up body
	StartTimerGameTime(cleanupBodyHours, cleanupBodyTimerID)

	if killer 
		if killer == paul
			KilledByPaul = true
			MS13.PaulBreaksBad()
		elseif (player.GetFactionReaction(killer) == 2 || killer == player)
			KilledByPlayer = true
			setStage(20)
		endif
	endif
	
	; how did Cooke die?

	; killed in Taphouse during confrontation (player was there)
	if MS13.GetStageDone(305) && MS13.GetStage() < 400
		ColetteInvestigation = 1
		setStage(20) ; player knows Cooke is dead

	; killed during/before ambush
	elseif MS13.GetStageDone(450) && !MS13.GetStageDone(540) && MS13.GetStageDone(455)
		ColetteInvestigation = 2
		setStage(20) ; player knows Cooke is dead

	; killed some other way
	else
		ColetteInvestigation = 3
	endif

	; fail MS13?
	if MS13.GetStageDone(250) == false
		MS13.SetStage(2000)
	endif

	; register for LOS gain on Cooke
	if !PlayerKnowsCookeIsDead
		RegisterForDetectionLOSGain(player, cooke)
	endif

endFunction

function StartInvestigationTimer()
	debug.trace(self + " StartInvestigationTimer")
	; start initial investigation timer
	StartTimerGameTime(investigationHours, investigationTimerID)
endFunction


; Colette's initial investigation is done
function InvestigationDone()
	debug.trace(self + " InvestigationDone")
	; in case set by something else
	CancelTimer(investigationTimerID)
	; what did she learn?
	actor paul = Alias_PaulPembroke.GetActorRef()
	actor player = Game.GetPlayer()

	; if Paul is alive and mad at player, she comes to find you
	if paul.IsDead() == false && ( MS13.GetStageDone(815) || MS13.GetStageDone(820) || MS13.GetStageDone(830) )
		setStage(110)
	endif

	; if she's suspicious of you already (from first conversation), she'll come talk to you again
	if GetStageDone(30) && !GetStageDone(70)
		setStage(120)
	endif

	; otherwise, she leaves town (if player isn't already planning to kill her)
	if !GetStageDone(110) && !GetStageDone(120) && !GetStageDone(330)
		setStage(150)
	endif
endFunction

Event OnTimer(int aiTimerID)
	if aiTimerID == CookeLOSTimerID
		actor player = Game.GetPlayer()
		actor cooke = Alias_HenryCooke.GetActorRef()

		debug.trace(self + " Cooke LOS timer")
		; close enough to see body - flag that player knows he's dead
		if player.GetDistance(Cooke) < 800
			debug.trace(self + " Close enough - player knows Cooke is dead")
			setStage(20) ; player knows Cooke is dead
			CancelTimer(CookeLOSTimerID)
		endif
		; continue timer if still in LOS and player doesn't know
		if !PlayerKnowsCookeIsDead && player.HasDetectionLOS(Cooke)
			StartTimer(1.0, CookeLOSTimerID)
		endif
	endif
endEvent

Event OnTimerGameTime(int aiTimerID)
	if aiTimerID == startupTimerID
		SetStage(10)
	elseif aiTimerID == investigationTimerID
		; Colette finished with initial investigation
		SetStage(100)
	elseif aiTimerID == cleanupBodyTimerID
		; disable body if he died in confrontation
		if ColetteInvestigation == 1
			Actor cooke = Alias_HenryCooke.GetActorRef()
			if cooke.Is3DLoaded() == 0
				cooke.disable()
			else
				; run short timer again
				StartTimerGameTime(1.0, cleanupBodyTimerID)
			endif
		endif
	endif
EndEvent

bool Property DeathWitnessed conditional auto
{ did anyone witness Cooke's death?
}

bool Property KilledByPlayer conditional auto
{ did player kill Cooke? }

bool Property KilledByPaul conditional auto
{ did Paul kill Cooke? }

bool Property PlayerKnowsCookeIsDead conditional auto
{ does player know Cooke is dead? (best guess) }

Int Property ColetteInvestigation = 0 Auto Conditional
{
	1 = killed in Taphouse during confrontation (player was there)
	2 = killed during/before ambush
	3 = killed some other way
}

ReferenceAlias Property Alias_PaulPembroke Auto const
ReferenceAlias Property Alias_Killer Auto const
LocationAlias Property Alias_DeathLocation Auto const
ReferenceAlias Property Alias_HenryCooke Auto const

MS13Script Property MS13 Auto const

Location Property DiamondCityLocation auto const


