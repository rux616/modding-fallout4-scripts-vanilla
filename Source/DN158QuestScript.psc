Scriptname DN158QuestScript extends Quest Conditional

int property HullIntegrity = 80 auto hidden conditional
int property UUVsIntact = 3 auto hidden conditional
bool property UUVFightActive = false auto hidden conditional
int property ImpactCountdown = 4 auto hidden conditional

Scene property DN158ImpendingImpact auto
Scene property DN158ShipRudderJammedLoop auto

Function ModHullIntegrity(int change)
	HullIntegrity += change
	if HullIntegrity <= 0
		SubDestruction(0)
	endif
endFunction

objectReference Property DN158WakeUpMarker auto
referenceAlias property CaptainZao auto

;;;;;;;;;;;;; Sound Properties ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Sound Property QSTDN158UnderwaterMineExplosion auto
Sound Property QSTDN158SubLeakLPM  auto

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Travel Sequence
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;TimerIDs
;1 = Rudder Repair
;21 = LeaksPhase2 Start up timer
;22 = LeaksPhase2 Failure timer
;12 = LeaksPhase1 Failure timer
;31 = LeaksPhase3 Start up timer
;32 = LeaksPhase3 Failure Timer

bool property Phase1LeaksActive = false auto hidden conditional
bool property Phase2LeaksActive = false auto hidden conditional
bool property Phase3LeaksActive = false auto hidden conditional
bool FiringTimerActive = False

Function StartTravelSequence()
	StartTimer(60, 1)					;Set Rudder Repair Timer
	StartTimer(20, 2)
endFunction

Event OnTimer(int aiTimerID)
	Debug.Trace(self + ": TIMER EVENT >> " + aiTimerID)

	;/
	if aiTimerID == 1 && !GetstageDone(600)			;Destruction due to Rudder
		SubDestruction(1)
	elseif aiTimerID == 12 && !GetstageDone(625)		;Destruction due to Phase 1 leaks
		SubDestruction(2)
	elseif aiTimerID == 22 && !GetstageDone(645)		;Destruction due to Phase 2 leaks
		SubDestruction(3)
	elseif aiTimerID == 32 && !GetstageDone(665)		;Destruction due to Phase 3 leaks
		SubDestruction(4)
	/;
	if aiTimerID == 1 && !GetstageDone(600)			;Destruction due to Rudder
		SubDestruction(1)
	elseif aiTimerID == 2 && !GetstageDone(600)
		Setstage(550)
	elseif aiTimerID ==  21								;Start up Phase 2 Leaks
		SetStage(640)
	elseif aiTimerID ==  31								;Start up Phase 2 Leaks
		SetStage(660)
	
	elseif aiTimerID == 50								;First Sonar Ping
		SetStage(650)
	elseif aiTimerID == 60								;Second Sonar Ping, time to go dark - this leads to torpedo battle
		SetStage(670)

	elseif aiTimerID == 80
			ImpactUpdate()								;Send update about impact
	elseif aiTimerID == 98 && !evasiveManeuversActive  	;Travel Sway
			TravelSway()
	elseif aiTimerID == 99 && evasiveManeuversActive  	;Evasive Maneuvers Timer
			EvasiveManeuvers()

	;Torpedo Hits and Firing Solution Timer
	elseif aiTimerID == 61	&&	UUVFightActive 			;Torpedo Impact!!
		HitByTorpedo()
		StartTimer(utility.randomInt(35,45), 61)	;Start Timer to next hit, may make this deterministic later
	elseif aiTimerID == 70	&&	UUVFightActive 			;PositiveFiringSolution
		Debug.Trace(self + "XXXXX FIRING SOLUTION TIMER XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
		if !PositiveFiringSolution
			FiringTimerActive = True
			StartFiringSolution()
			;PositiveFiringSolution = True
			;Debug.Notification("Positive Firing Solution")
			;startTimer(utility.randomInt(4, 10), 70)		;FiringSolutionTimer

		else ;PositiveFiringSolution
			FiringTimerActive = False
			StopFiringSolution()
			;PositiveFiringSolution = False
			;Debug.Notification("Firing Solution Lost")
			;startTimer(utility.randomInt(3, 10), 70)		;FiringSolutionTimer
		endif
	

	;Radar Blips
	elseif aiTimerID == 201								;Radar Blip 001 Timer	Small movements
		if !BlipBusy001 && UUVIntact001
			BlipPickRadarPosition(1,  Blip_CurrentRadarZone001,  DN158_RadarBlip001)
		endif
	elseif aiTimerID == 202								;Radar Blip 002 Timer	Small movements
		if !BlipBusy002 && UUVIntact002
			BlipPickRadarPosition(2,  Blip_CurrentRadarZone002,  DN158_RadarBlip002)
		endif
	elseif aiTimerID == 203								;Radar Blip 003 Timer	Small movements
		if !BlipBusy003 && UUVIntact003
			BlipPickRadarPosition(3,  Blip_CurrentRadarZone003,  DN158_RadarBlip003)
		endif

	elseif aiTimerID == 211								;Radar Blip 001 Timer	Zone Move
		if BlipBusy001 || !UUVIntact001							;Busy or destroyed
		elseif UUVInFiringPosition == 1 && FiringTimerActive	;Currently slated for firing solution
		else
			BlipBusy001 = True
			BlipPickNewRadarZone(1, Blip_CurrentRadarZone001, DN158_RadarBlip001)
			BlipBusy001 = false
		endif
	elseif aiTimerID == 212								;Radar Blip 002 Timer	Zone Move
		if BlipBusy002 || !UUVIntact002							;Busy or destroyed
		elseif UUVInFiringPosition == 2 && FiringTimerActive	;Currently slated for firing solution
		else
			BlipBusy002 = True
			BlipPickNewRadarZone(3, Blip_CurrentRadarZone002, DN158_RadarBlip002)
			BlipBusy002 = false
		endif
	elseif aiTimerID == 213								;Radar Blip 003 Timer	Zone Move
		if BlipBusy003 || !UUVIntact003							;Busy or destroyed
		elseif UUVInFiringPosition == 3 && FiringTimerActive	;Currently slated for firing solution
		else
			BlipBusy003 = True
			BlipPickNewRadarZone(3, Blip_CurrentRadarZone002, DN158_RadarBlip003)
			BlipBusy003 = false
		endif
	endif
endEvent

Function StartLeaksTimers()
	;;;;;StartTimer(60, 12)					;Leaks Phase 1 Failure Timer
	StartTimer(30, 21)					;Leaks Phase 2 Start Timer
	;;;;;StartTimer(120, 22)					;Leaks Phase 2 Failure Timer
	StartTimer(80, 31)					;Leaks Phase 3 Start Timer
	;;;;;StartTimer(180, 32)					;Leaks Phase 3 Failure Timer

	StartTimer(90, 50)					;Sonar Ping Timer 1
	StartTimer(130, 60)					;Sonar Ping Timer 2 - go to stealth mode - leads to torpedo event
	;StartTimer(175, 61)					;Timed Torpedo Hits		-	These will eventually kill the ship if the UUVs are not destroyed
										;This starts a loop that updates the time to next hit
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Rudder
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

int property RudderFixedStage = 0 auto

;Function is called by rudder when hit an appropriate number of times
Function RudderFixed()
	SetStage(RudderFixedStage)
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Leaks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
int property Phase1LeaksToBeFixed = 0 auto hidden
{default = 3}
int property Phase2LeaksToBeFixed = 0 auto hidden
{default = 3}
int property Phase3LeaksToBeFixed = 0 auto hidden
{default = 3}

int property DamagePerLeak = -5 auto

int property Phase1LeaksFixed = 0 auto hidden
int property Phase2LeaksFixed = 0 auto hidden
int property Phase3LeaksFixed = 0 auto hidden

int property LeaksPhase1Stage = 0 auto
int property LeaksPhase2Stage = 0 auto
int property LeaksPhase3Stage = 0 auto
RefCollectionAlias property Phase1Leaks auto
RefCollectionAlias property Phase2Leaks auto
RefCollectionAlias property Phase3Leaks auto
;RefCollectionAlias property CurrentRefCollectionAlias auto hidden

ObjectReference[] property Phase1LeakRefs auto
ObjectReference[] property Phase2LeakRefs auto
ObjectReference[] property Phase3LeakRefs auto
ObjectReference property DN158Leak101 auto
ObjectReference property DN158Leak201 auto
ObjectReference property DN158Leak301 auto

float[] property Phase1LeakTimers auto
float[] property Phase2LeakTimers auto
float[] property Phase3LeakTimers auto

Function SpringLeaksPhase1()
	int i = 0
	Phase1LeakRefs = CollectLeaks(DN158Leak101, 1)
	debug.Trace(self + ": Phase 1 Leaks Started")
	debug.Trace (self + " i = " + i + " :: LeaksLength = " + Phase1LeakRefs.Length + " :: LeaksTimerLength = " + Phase1LeakTimers.Length)
	Phase1LeaksActive = True
	While i < (Phase1LeakRefs.Length - 1)
		StartLeak(Phase1LeakRefs[i], Phase1Leaks)
		if i < Phase1LeakTimers.Length
			utility.wait(Phase1LeakTimers[i])
		endif
		i += 1
	endWhile
endFunction

Function SpringLeaksPhase2()
	int i = 0
	Phase2LeakRefs = CollectLeaks(DN158Leak201, 2)
	debug.Trace(self + ": Phase 2 Leaks Started")
	debug.Trace (self + " i = " + i + " :: LeaksLength = " + Phase2LeakRefs.Length + " :: LeaksTimerLength = " + Phase2LeakTimers.Length)
	Phase2LeaksActive = True
	While i < (Phase2LeakRefs.Length - 1)
		StartLeak(Phase2LeakRefs[i], Phase2Leaks)
		if i < Phase2LeakTimers.Length
			utility.wait(Phase2LeakTimers[i])
		endif
		i += 1
	endWhile
endFunction

Function SpringLeaksPhase3()
	int i = 0
	Phase3LeakRefs = CollectLeaks(DN158Leak301, 3)
	debug.Trace(self + ": Phase 3 Leaks Started")
	debug.Trace (self + " i = " + i + " :: LeaksLength = " + Phase3LeakRefs.Length + " :: LeaksTimerLength = " + Phase3LeakTimers.Length)
	Phase3LeaksActive = True
	While i < (Phase3LeakRefs.Length -1)
		StartLeak(Phase3LeakRefs[i], Phase3Leaks)
		if i < Phase3LeakTimers.Length
			utility.wait(Phase3LeakTimers[i])
		endif
		i += 1
	endWhile
endFunction
	

Function StartLeak(objectReference Leak, RefCollectionAlias CurrentRefCollectionAlias)
	CurrentRefCollectionAlias.AddRef(Leak)
	Leak.Enable() 
	(Leak as DN158LeakScript).StartLeakFX()
	ModHullIntegrity(DamagePerLeak)
endFunction

;Leak will pass which phase it is a part of in the function call
Function LeakFixed(int phaseNumber, objectReference Leak)
	ModHullIntegrity(-DamagePerLeak)
	if PhaseNumber == 1
		Phase1LeaksFixed += 1
		Phase1Leaks.RemoveRef(Leak)
		if Phase1LeaksFixed >= Phase1LeaksToBeFixed 
			Phase1LeaksActive = False
			setstage(LeaksPhase1Stage)
		endif
	elseif PhaseNumber == 2
		Phase2LeaksFixed += 1
		Phase2Leaks.RemoveRef(Leak)
		if Phase2LeaksFixed >= Phase2LeaksToBeFixed 
			Phase2LeaksActive = False
			setstage(LeaksPhase2Stage)
		endif
	elseif PhaseNumber == 3
		Phase3LeaksFixed += 1
		Phase3Leaks.RemoveRef(Leak)
		if Phase3LeaksFixed >= Phase3LeaksToBeFixed 
			Phase3LeaksActive = False
			setstage(LeaksPhase3Stage)
		endif
	else
		debug.trace(self + ": DANGER! DANGER! Phase " + PhaseNumber + " is not valid!")
	endif

endFunction


ObjectReference[] Function CollectLeaks(objectReference FirstLeak, int WhichPhase)
	int i = 0
	int newLength = 1 + FirstLeak.CountLinkedRefChain()
	ObjectReference[] LeakArray = new ObjectReference[newLength]
	LeakArray[i] = FirstLeak
	While FirstLeak
		i += 1
		FirstLeak = FirstLeak.getLinkedRef()
		LeakArray[i] = FirstLeak
	endWhile
	if WhichPhase == 1
		Phase1LeaksToBeFixed = i
	elseif WhichPhase == 2
		Phase2LeaksToBeFixed = i
	elseif WhichPhase == 3
		Phase3LeaksToBeFixed = i
	endif
	debug.Trace(self +": COLLECTING LEAKS " + WhichPhase + " >> Total = " + newLength + " :: i = " + i)
	Return LeakArray
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Win/Failure
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Failure State
Function SubDestruction(int DestructionType)
	if DestructionType == 1	
		Debug.Notification("SUBMARINE DESTROYED DUE TO RUDDER")
	elseif DestructionType == 2
		Debug.Notification("SUBMARINE DESTROYED DUE TO LEAKS PHASE 1")
	elseif DestructionType == 3
		Debug.Notification("SUBMARINE DESTROYED DUE TO LEAKS PHASE 2")
	elseif DestructionType == 4
		Debug.Notification("SUBMARINE DESTROYED DUE TO LEAKS PHASE 3")
	endif
endFunction

InputEnableLayer DN158

;False Failure sequence for when the sub crashes into Vault120
Function CrashIntoVault()
	InputEnableLayer DN158InputLayer = InputEnableLayer.Create()
	SubmarineHit("FinalImpact")
		
		;abMovement ;abFighting  ;abCamSwitch ;abLooking ;abSneaking ;abMenu ;abActivate ;abJournalTabs 
		
	DN158InputLayer.DisablePlayerControls(abMovement = true, abFighting = true, abCamSwitch = true, \
		abLooking = true, abSneaking = true, abMenu = true, abActivate = true, \
 		abJournalTabs = true)
	game.GetPlayer().Moveto(DN158WakeUpMarker)
	if !CaptainZao.getActorRef().isDead()
		CaptainZao.getReference().Moveto(DN158WakeUpMarker)
	endif
	DN158InputLayer.EnablePlayerControls(abMovement = true, abFighting = true, abCamSwitch = true, \
 		 abLooking = true, abSneaking = true, abMenu = true, abActivate = true, \
 		 abJournalTabs = true)
	;
	SetStage(925)
endFunction

Function BeginCountdownToImpact()
	ImpactCountdown -= 1
	StartTimer(10, 80)						;Timer for updates on impact
endFunction

Function ImpactUpdate()
	DN158ShipRudderJammedLoop.stop()
	utility.wait(0.25)
	DN158ImpendingImpact.Start()
EndFunction
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			UUV and Torpedos
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

bool property PositiveFiringSolution = false auto hidden

int property TorpedoDamage = -10 auto
	{This should be negative
		Default = -10}
int property TorpedoHitChancePlayer = 100 auto hidden
	{Chance that a torpedo launched by the player hits
		Default = 100}
int UUVHits001
int UUVHits002
int UUVHits003
int UUVHitsTillDestruction = 2
int UUVInFiringPosition = 1
bool UUVIntact001 = True
bool UUVIntact002 = True
bool UUVIntact003 = True
Scene property DN158TorpedoBattleEnemyDestroyed auto
Scene property DN158TorpedoBattleEnemyHit auto
Scene property DN158ShipStatusLoop auto

Function StartFiringSolutionTimer()
	UUVFightActive = True
	TurnOnRadarBlibs()
	SetFiringSolutionTimer(true)							;FiringSolutionTimer
	StartTimer(utility.randomInt(15,30), 61)							;Timer For Next Torpedo hit
EndFunction

;Player Launched Torpedo, First shot is always a hit
;	Each hit Reduces the chance that the next shot is a hit
Function LaunchTorpedo(int TorpedoTubeNumber)
	int HitValue
	if PositiveFiringSolution
		HitValue = utility.RandomInt(1, 100)
		if TorpedoHitChancePlayer >= HitValue
			FireTorpedoBlip(TorpedoTubeNumber, hit = true)
			UUVhit()
			TorpedoHitChancePlayer -= 100
		else
			FireTorpedoBlip(TorpedoTubeNumber, hit = false)
			TorpedoHitChancePlayer += 25
			Debug.Notification("Torpedo Missed")
		endif
	else
		FireTorpedoBlip(TorpedoTubeNumber, hit = false)
		Debug.Notification("Torpedo Missed")
	endif
endFunction

Function ReadyFiringBlip(int TorpedoTubeNumber)
	objectReference correctBlip
	if TorpedoTubeNumber == 1
		correctBlip = DN158_TorpedoBlip001
		correctBlip.PlayAnimation("Fire01")
	elseif TorpedoTubeNumber == 2
		correctBlip = DN158_TorpedoBlip002
		correctBlip.PlayAnimation("Fire02")
	elseif TorpedoTubeNumber == 3
		correctBlip = DN158_TorpedoBlip003
		correctBlip.PlayAnimation("Fire03")
	elseif TorpedoTubeNumber == 4
		correctBlip = DN158_TorpedoBlip004
		correctBlip.PlayAnimation("Fire04")
	endif
endFunction

;Pass the correct blip
Function FireTorpedoBlip(int TorpedoTubeNumber, bool Hit = false)
	objectReference correctBlip
	string AnimToPlay
	if TorpedoTubeNumber == 1
		correctBlip = DN158_TorpedoBlip001
	elseif TorpedoTubeNumber == 2
		correctBlip = DN158_TorpedoBlip002
	elseif TorpedoTubeNumber == 3
		correctBlip = DN158_TorpedoBlip003
	elseif TorpedoTubeNumber == 4
		correctBlip = DN158_TorpedoBlip004
	endif
	if hit
		AnimToPlay = "hit"
	else
		if TorpedoTubeNumber == 1 || TorpedoTubeNumber == 2
			AnimToPlay = "missRight"
		else
			AnimToPlay = "missLeft"
		endIf
	endif
	correctBlip.PlayAnimationAndWait(AnimToPlay, "done")
endFunction

;For when the submarine is hit by an enemy Torpedo
Function HitByTorpedo()
	SubmarineHit("Medium")
	ModHullIntegrity(TorpedoDamage)
endFunction

;For when the player hits a UUV with a Torpedo
Function UUVHit()
	int UUVHits
	if UUVInFiringPosition == 1
		UUVHits001	+=1
		UUVHits = UUVHits001	
	elseif UUVInFiringPosition == 2
		UUVHits002	+=1
		UUVHits = UUVHits002
	elseif UUVInFiringPosition == 3
		UUVHits003	+=1
		UUVHits = UUVHits003	
	endif	
	if UUVHits == UUVHitsTillDestruction							;UUV Destroyed
		Debug.Notification("UUV # " + UUVInFiringPosition + " - Destroyed!")
		UUVHits = 0
		UUVsIntact -= 1
		if UUVsIntact <= 0
			EndTorpedoBattle()
		endif
		if UUVInFiringPosition == 1
			DN158_RadarBlip001.disable()
			UUVIntact001 = False
		elseif UUVInFiringPosition == 2
			DN158_RadarBlip002.disable()
			UUVIntact002 = False
		elseif UUVInFiringPosition == 3
			DN158_RadarBlip003.disable()
			UUVIntact003 = False
		endif
		DN158ShipStatusLoop.Stop()
		DN158TorpedoBattleEnemyDestroyed.Start()
	elseif UUVHits < UUVHitsTillDestruction && UUVHits >0		;UUV Damaged
		Debug.Notification("UUV # " + UUVInFiringPosition + " - Hit!")
		if UUVInFiringPosition == 1
			DN158_RadarBlip001.PlayAnimation("Hit")
		elseif UUVInFiringPosition == 2
			DN158_RadarBlip002.PlayAnimation("Hit")
		elseif UUVInFiringPosition == 3
			DN158_RadarBlip003.PlayAnimation("Hit")
		endif
		DN158ShipStatusLoop.Stop()
		DN158TorpedoBattleEnemyHit.Start()
	elseif UUVHits <=0											;WFTBBQ!? Fix the int! This should never occur.
		UUVHits = 1
	endif
EndFunction

Function EndTorpedoBattle()
	UUVFightActive = false
EndFunction

Function StartFiringSolution()
	Debug.Trace(Self + ": Starting Firing Solution")
	objectReference blip
	bool blipSelected = false
	int NewUUVToFiringSolution
	while !blipSelected
		NewUUVToFiringSolution= utility.randomInt(1,3)
		if NewUUVToFiringSolution == 1 && UUVIntact001 && !BlipBusy001
			BlipBusy001 = true
			blipSelected = True
			UUVInFiringPosition = NewUUVToFiringSolution 
			blip = DN158_RadarBlip001
			BlipBusy001 = False
		elseif NewUUVToFiringSolution == 2 && UUVIntact002 && !BlipBusy002
			BlipBusy002 = true
			blipSelected = True
			UUVInFiringPosition = NewUUVToFiringSolution
			blip = DN158_RadarBlip002
			BlipBusy002 = False
		elseif NewUUVToFiringSolution == 3 && UUVIntact003 && !BlipBusy003
			BlipBusy003 = true
			blipSelected = True
			UUVInFiringPosition = NewUUVToFiringSolution
			blip = DN158_RadarBlip003
			BlipBusy003 = False
		endIf
	EndWhile
	Debug.Trace(Self + ": Firing solution locked > Target = " + UUVInFiringPosition)
	BlipGoToFiringPosition(Blip)
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Radar Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ObjectReference Property DN158_RadarBlip001 auto
ObjectReference Property DN158_RadarBlip002 auto
ObjectReference Property DN158_RadarBlip003 auto

ObjectReference Property DN158_TorpedoBlip001 auto
ObjectReference Property DN158_TorpedoBlip002 auto
ObjectReference Property DN158_TorpedoBlip003 auto
ObjectReference Property DN158_TorpedoBlip004 auto


bool BlipBusy001 = false
bool BlipBusy002 = false
bool BlipBusy003 = false

int UUVToEnterRadar = 1

int property Blip_CurrentRadarZone001 = 8 auto hidden
int property Blip_CurrentRadarZone002 = 2 auto hidden
int property Blip_CurrentRadarZone003 = 5 auto hidden
			;;;;;;;;;;;;;;;;;;;;;;
			;;	8	1	2	;;	8 = 5-8 ; 1 = x-x ; 2 = x-x
			;;	7	0	3	;;	7 = x-x ; 0 = 0-4 ; 3 = x-x
			;;	6	5	4	;;	6 = x-x ; 5 = x-x ; 4 = x-x
			;;;;;;;;;;;;;;;;;;;;;;
;;;;Events- ;;;;
;Target00-20 -  moves the blip around. Targets00-04 are in the hit zone. 
;Hit - plays the white flash hit animation and continues to loop to indicate a target that has been hit once.

Function TurnOnRadarBlibs()
	DN158_RadarBlip001.Enable()
	DN158_RadarBlip002.Enable()
	DN158_RadarBlip003.Enable()

	;startTimer(utility.randomInt(2, 5), 201)		;Start random movement timer for Blip 001
	;startTimer(utility.randomInt(2, 5), 202)		;Start random movement timer for Blip 002
	;startTimer(utility.randomInt(2, 5), 203)		;Start random movement timer for Blip 003

	;startTimer(utility.randomInt(8,15), 211)		;Start Zone movement timer for Blip 001
	;startTimer(utility.randomInt(8,15), 212)		;Start Zone movement timer for Blip 002
	;startTimer(utility.randomInt(8,15), 213)		;Start Zone movement timer for Blip 003

	BlipPickNewRadarZone(1, Blip_CurrentRadarZone001, DN158_RadarBlip001)
	BlipPickNewRadarZone(2, Blip_CurrentRadarZone002, DN158_RadarBlip002)
	BlipPickNewRadarZone(3, Blip_CurrentRadarZone003, DN158_RadarBlip003)
EndFunction

Function SetBlipRapidMovementTimer(int BlipNumber)
	startTimer(utility.RandomFloat(0.5,3), (200 + BlipNumber))
EndFunction

Function SetFiringSolutionTimer(bool BetweenFiring)
	;if between firing use the longer timer
	if BetweenFiring
		startTimer(utility.randomFloat(3.0,5.0), 70)
	else
		startTimer(utility.randomFloat(5.0,7.5), 70)
	endif
EndFunction

Function BlipPickNewRadarZone(int BlipNumber, int CurrentRadarZone, objectReference Blip)
	;Pick offset from current zone, up to 2 away
	int NewRadarZone
	if CurrentRadarZone == 0
		NewRadarZone = utility.randomInt(1,8)
	else
		NewRadarZone = utility.randomInt(-2,2)
	
		;Add current zone number to new resulting in offset	
		NewRadarZone += CurrentRadarZone

		; if new is greater than 8, subtract 8; This keeps the "Zone Clock" working
		if NewRadarZone > 8
			NewRadarZone -= 8
		elseif NewRadarZone <1
			NewRadarZone +=8
		endif
	endif
	
	;Start timer for new zone pick
	int TimerNumber = 210 + BlipNumber	
	startTimer(utility.randomInt(8,15), TimerNumber)

	;Return NewRadarZone
	if BlipNumber == 1
		Blip_CurrentRadarZone001 = NewRadarZone
	elseif BlipNumber == 2
		Blip_CurrentRadarZone002 = NewRadarZone
	elseif BlipNumber == 3
		Blip_CurrentRadarZone003 = NewRadarZone
	endif

	debug.Trace(Self + ": Blip # " + Blip + " Has Picked Zone " + NewRadarZone)
	BlipPickRadarPosition(BlipNumber, NewRadarZone, Blip)
EndFunction

;This function picks the minor positions of the blib, gross zone movement is handled before this
Function BlipPickRadarPosition(int BlipNumber, int radarZone, objectReference Blip)
	int newPosition
	string newAnim = "Target"
	debug.Trace(Self + ": Blip # " + Blip + " Picking Position in Zone # " + radarZone)
	;Pick the new position randomly based on the zone, each zone has 4-5 positions it can move between
	if radarZone == 0
		newPosition = utility.randomInt(0,4)
	elseif radarZone == 8							;7 - 8; 6 - 5
		newPosition = utility.randomInt(5,8)
	elseif radarZone == 1							;8 - 9; 5 - 12
		newPosition = utility.randomInt(1,4)
		;Replace with appropriate numbers
		if newPosition == 1
			newPosition = 8
		elseif newPosition == 2
			newPosition = 9
		elseif newPosition == 3
			newPosition = 5
		elseif newPosition == 4
			newPosition = 12
		endif
	elseif radarZone == 2							;9 - 10; 12 - 11
		newPosition = utility.randomInt(9,12)
	elseif radarZone == 3							;12 - 11; 13 - 14
		newPosition = utility.randomInt(11,14)
	elseif radarZone == 4							;13 - 14; 16 - 15
		newPosition = utility.randomInt(13,16)
	elseif radarZone == 5							;20 - 13; 17 - 16
		newPosition = utility.randomInt(1,4)
		;Replace with appropriate numbers
		if newPosition == 1
			newPosition = 20
		elseif newPosition == 2
			newPosition = 13
		elseif newPosition == 3
			newPosition = 17
		elseif newPosition == 4
			newPosition = 16
		endif
	elseif radarZone == 6							;19 - 20; 18 - 17
		newPosition = utility.randomInt(17,20)
	elseif radarZone == 7							; 6 - 5; 19 - 20
		newPosition = utility.randomInt(1,4)
		;Replace with appropriate numbers
		if newPosition == 1
			newPosition = 6
		elseif newPosition == 2
			newPosition = 5
		elseif newPosition == 3
			newPosition = 19
		elseif newPosition == 4
			newPosition = 20
		endif
	endif
	Debug.Trace(Self + ": NewPosition = " + NewPosition)
	;If new position is less than 10 add the 0 to maintain proper place
	if newPosition < 10
		newAnim = "Target0"
	endif

	;Append the anim number to the end of the string
	newAnim += (newPosition as string)
	Debug.Trace(Self + ": NewAnim = " + NewAnim)
	;PlayAnimation
	debug.Trace(Self + ": Blip # " + Blip + " Should be going to " + NewAnim)
	Blip.PlayAnimation(newAnim)

	;SetNewTimers

	;Start timer for minor movements
	SetBlipRapidMovementTimer(BlipNumber)

EndFunction

Function BlipGoToFiringPosition(objectReference Blip)
	Debug.Trace(Self + ": BLIP GO TO FIRING POSITION >> BLIP = " + Blip)
	int newPosition
	string newAnim = "Target0"

	if UUVInFiringPosition == 1
		Blip_CurrentRadarZone001 = 0
	elseif UUVInFiringPosition == 2
		Blip_CurrentRadarZone002 = 0
	elseif UUVInFiringPosition == 3
		Blip_CurrentRadarZone003 = 0
	endif

	newPosition = utility.randomInt(0,4)
	newAnim += (newPosition as String)
	
	Debug.Trace(Self + ": Blip should be going to " + NewAnim)
	RegisterForAnimationEvent(Blip, "Aim")
	Blip.PlayAnimation(newPosition)
	SetBlipRapidMovementTimer(UUVInFiringPosition)

	;startTimer(utility.RandomInt(2,5), (200 + UUVInFiringPosition))
	;Animation Event calls the new timer
EndFunction

Function StopFiringSolution()
	objectReference Blip
	if UUVInFiringPosition == 1 && UUVIntact001
		Blip = DN158_RadarBlip001
		RegisterForAnimationEvent(Blip, "Miss")
		BlipPickNewRadarZone(1, Blip_CurrentRadarZone001, DN158_RadarBlip001)
		BlipBusy001 = false
	elseif UUVInFiringPosition == 2 && UUVIntact002
		Blip = DN158_RadarBlip002
		RegisterForAnimationEvent(Blip, "Miss")
		BlipPickNewRadarZone(2, Blip_CurrentRadarZone002, DN158_RadarBlip002)
		BlipBusy002 = false
	elseif UUVInFiringPosition == 3 && UUVIntact003
		Blip = DN158_RadarBlip003
		RegisterForAnimationEvent(Blip, "Miss")
		BlipPickNewRadarZone(3, Blip_CurrentRadarZone003, DN158_RadarBlip003)
		BlipBusy003 = false
	else 		;Current UUV was destroyed, just set the timer
		;Debug.Notification("Negative Firing Solution")
		PositiveFiringSolution = False
		SetFiringSolutionTimer(true)
	endif
	;PositiveFiringSolution = False
	Debug.Trace(self + ": Starting Firing Solution Lost - Blip = " + Blip)
	;SetFiringSolutionTimer()
EndFunction
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Bombs and Hit Reactions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SubmarineHit(string hitStrength)
		float afStrength
		float afRightStrength 
		float afLeftStrength 
		float afDuration  

	if hitStrength == "Strong"
		;Camera Shake Properties
		afStrength  = 1.0

		;Controller Shake Properties
		afRightStrength = 1.0
		afLeftStrength = 1.0

		afDuration  = 3.0

	elseif hitStrength == "Medium"
		;Camera Shake Properties
		afStrength  = 0.6

		;Controller Shake Properties
		afRightStrength = 0.6
		afLeftStrength = 0.6

		afDuration  = 2.0

	elseif hitStrength == "Weak"
		;Camera Shake Properties
		afStrength  = 1.0

		;Controller Shake Properties
		afRightStrength = 0.3
		afLeftStrength = 0.3

		afDuration  = 1.0

	elseif hitStrength == "FinalImpact"
		;Camera Shake Properties
		afStrength  = 1.0

		;Controller Shake Properties
		afRightStrength = 1.0
		afLeftStrength = 1.0

		afDuration  = 6.0
	
	endif
	QSTDN158UnderwaterMineExplosion.Play(game.getPlayer())
	game.ShakeCamera(akSource = None, afStrength = afStrength, afDuration = afDuration)
	game.ShakeController(afLeftStrength, afRightStrength, afDuration)
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Bearing Controls
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

bool property evasiveManeuversActive = false auto hidden

Function StartEvasiveManeuvers()
	evasiveManeuversActive = true
	EvasiveManeuvers()
endFunction

Function EndEvasiveManeuvers()
	evasiveManeuversActive = false
	TravelSway()
endFunction

Function EvasiveManeuvers()
	int ud
	int lr
	string newPitch
	string newRoll
	;ud = utility.randomInt(-3, 3)
	ud = PickNewAngleWithClamps(GetCurrentAngle(CurrentPitch), 3, -3, 3)
	;lr = utility.randomInt(-6,6)
	lr = PickNewAngleWithClamps(GetCurrentAngle(CurrentRoll), 6, -6, 6)
	newPitch = ud as string
	newRoll = lr as string
	SetBearing(NewPitch, NewRoll)
	if evasiveManeuversActive 
		StartTimer(utility.randomInt(3,7), 99)
	endif
endFunction

Function TravelSway()
	int ud
	int lr
	string newPitch
	string newRoll
	;ud = utility.randomInt(-2, 1)
	ud = PickNewAngleWithClamps(GetCurrentAngle(CurrentPitch), 2, -2, 1)
	;lr = utility.randomInt(-3,3)
	lr = PickNewAngleWithClamps(GetCurrentAngle(CurrentRoll), 4, -3, 3)
	newPitch = ud as string
	newRoll = lr as string
	SetBearing(NewPitch, NewRoll)
	if !evasiveManeuversActive 
		StartTimer(utility.randomInt(3,7), 98)
	endif
endFunction

int Function PickNewAngleWithClamps(int currentAngle, int maxAngleChange, int Min, int Max)
	int angleChange = utility.RandomInt(-maxAngleChange, maxAngleChange)
	angleChange += currentAngle
	if angleChange > Max
		angleChange = Max
	elseif angleChange < Min
		angleChange = Min
	endIf
	return angleChange
endFunction

ObjectReference property DN158PitchControl auto
ObjectReference property DN158RollControl auto
;ObjectReference property DN158NorthMarkerControl auto

string property CurrentPitch = "Level" auto hidden
string property CurrentRoll = "Straight" auto hidden

Function SetBearing(string NewPitch, string NewRoll)
	string pitchAnim
	string rollAnim
	debug.Trace(self + ": Bearing Changed >> " + NewPitch + " :: " + NewRoll)
	if NewPitch != CurrentPitch
		pitchAnim = PickTiltAnim(NewPitch)
		CurrentPitch = NewPitch
		DN158PitchControl.PlayAnimation(pitchAnim)
	endif
	if NewRoll != CurrentRoll
		rollAnim = PickTiltAnim(NewRoll)
		CurrentRoll = NewRoll
		DN158RollControl.PlayAnimation(rollAnim)
	endif
endFunction

string Function PickTiltAnim(string newTilt)
	if newTilt == "Level" || newTilt == "Straight" || newTilt == "0"
		return "0Deg"

	elseif newTilt == "Up1" || newTilt == "Right1" || newTilt == "1"
		return "1DegCW"
	elseif newTilt == "Up2" || newTilt == "Right2" || newTilt == "2"
		return "2DegCW"
	elseif newTilt == "Up3" || newTilt == "Right3" || newTilt == "3"
		return "3DegCW"
	elseif newTilt == "Up4" || newTilt == "Right4" || newTilt == "4"
		return "4DegCW"
	elseif newTilt == "Up5" || newTilt == "Right5" || newTilt == "5"
		return "5DegCW"
	elseif newTilt == "Up6" || newTilt == "Right6" || newTilt == "6"
		return "6DegCW"

	elseif newTilt == "Down1" || newTilt == "Left1" || newTilt == "-1"
		return "1DegCCW"
	elseif newTilt == "Down2" || newTilt == "Left2" || newTilt == "-2"
		return "2DegCCW"
	elseif newTilt == "Down3" || newTilt == "Left3" || newTilt == "-3"
		return "3DegCCW"
	elseif newTilt == "Down4" || newTilt == "Left4" || newTilt == "-4"
		return "4DegCCW"
	elseif newTilt == "Down5" || newTilt == "Left5" || newTilt == "-5"
		return "5DegCCW"
	elseif newTilt == "Down6" || newTilt == "Left6" || newTilt == "-6"
		return "6DegCCW"
	else
		debug.Trace(self + ": ERROR invalid Angle chosen>> " + newTilt)
	endif
endFunction

int Function GetCurrentAngle(String CurrentAngle)
	Debug.Trace (Self + ": GetCurrentAngle = " + CurrentAngle)
	if CurrentAngle == "Level" || CurrentAngle == "Straight" || CurrentAngle == "0"
		return 0
	elseif CurrentAngle == "Up1" || CurrentAngle == "Right1" || CurrentAngle == "1"
		return 1
	elseif CurrentAngle == "Up2" || CurrentAngle == "Right2" || CurrentAngle == "2"
		return 2
	elseif CurrentAngle == "Up3" || CurrentAngle == "Right3" || CurrentAngle == "3"
		return 3
	elseif CurrentAngle == "Up4" || CurrentAngle == "Right4" || CurrentAngle == "4"
		return 4
	elseif CurrentAngle == "Up5" || CurrentAngle == "Right5" || CurrentAngle == "5"
		return 5
	elseif CurrentAngle == "Up6" || CurrentAngle == "Right6" || CurrentAngle == "6"
		return 6
	elseif CurrentAngle == "Down1" || CurrentAngle == "Left1" || CurrentAngle == "-1"
		return -1
	elseif CurrentAngle == "Down2" || CurrentAngle == "Left2" || CurrentAngle == "-2"
		return -2
	elseif CurrentAngle == "Down3" || CurrentAngle == "Left3" || CurrentAngle == "-3"
		return -3
	elseif CurrentAngle == "Down4" || CurrentAngle == "Left4" || CurrentAngle == "-4"
		return -4
	elseif CurrentAngle == "Down5" || CurrentAngle == "Left5" || CurrentAngle == "-5"
		return -5
	elseif CurrentAngle == "Down6" || CurrentAngle == "Left6" || CurrentAngle == "-6"
		return -6
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Animation Events
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Event onAnimationEvent(ObjectReference akSource, string asEventName)
	Debug.Trace(Self + ": ANIMATION EVENT > " + asEventName + " < recieved from > "+ akSource)
	if asEventName == "Aim" && !PositiveFiringSolution
		UnRegisterForAnimationEvent(akSource, "Aim")
		;Debug.Notification("Positive Firing Solution")
		PositiveFiringSolution = True
		SetFiringSolutionTimer(false)		;FiringSolutionTimer
	elseif asEventName == "Miss" && PositiveFiringSolution
		;Debug.Notification("Negative Firing Solution")
		UnRegisterForAnimationEvent(akSource, "Miss")
		PositiveFiringSolution = False
		SetFiringSolutionTimer(true)
	endif

EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Debug Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function BypassTorpedoFight()
	UUVsIntact = 0
	EndTorpedoBattle()
EndFunction














