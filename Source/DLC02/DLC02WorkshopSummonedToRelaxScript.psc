Scriptname DLC02:DLC02WorkshopSummonedToRelaxScript extends Quest

group Quests
	workshopparentscript Property WorkshopParent Auto Const mandatory

	DLC02:DLC02WorkshopAttackStarterScript property DLC02WorkshopAttackStarter auto const mandatory
endGroup

group aliases
	RefCollectionAlias Property Alias_WorkshopNPCs Auto Const mandatory

	ReferenceAlias Property Alias_Workshop Auto Const mandatory

	ReferenceAlias Property Alias_Bell Auto Const mandatory
endGroup

group packages
	Package property DLC02WorkshopSummonedToRelaxObserveCombatOverride auto const mandatory

	Package property DLC02WorkshopSummonedToRelaxPackage auto const mandatory
endGroup

group cheeringData
	Action Property ActionCustomCheering Auto Const mandatory

	Idle Property DLC02_Idle_BeingCocky Auto Const mandatory

	Idle Property DLC02_IdleHandsUp Auto Const mandatory

	Topic property DLC02WorkshopSummonedToRelaxCheering auto const mandatory

	ActorValue property DLC02WorkshopRatingArenaPlatform auto const mandatory

	ActorValue Property DLC02WorkshopCheering auto const mandatory
	{ set on actors when cheering to prevent repeating too often }
endGroup


int iCheckPackageTimerID = 1 const ; timer to periodically check for observe combat override package (since OnPackage events don't work for override packages)

float minTimerSeconds = 3.0 const
float randomTimerSecondsMax = 2.0 const

float cheerChance = 0.70 Const ; % chance for an NPC to cheer on any pass

float arenaIdleDistance = 20.0 const ; used for distance check for an arena combatant to play cheer idles

bool bArenaFightAchievementDone = false ; set to true once achievement is awarded

function Startup()
	; report startup to siren
	WorkshopSirenScript siren = Alias_Bell.GetRef() as WorkshopSirenScript
	if siren
		siren.SetAlarmQuest(self)
	endif

	ObjectReference[] workshopNPCs = WorkshopParent.GetWorkshopActors(Alias_Workshop.GetRef() as WorkshopScript)
	; add all tamed creatures to the collection
	int i = 0
	while i < workshopNPCs.Length
		ObjectReference theNPC = workshopNPCs[i]
		DLC02TamedActorScript tamedActor = (theNPC as Actor) as DLC02TamedActorScript
		if tamedActor
			Alias_WorkshopNPCs.AddRef(tamedActor)
		endif
		i += 1
	endWhile

	; start timer
	StartTimer(2.0, iCheckPackageTimerID)
endFunction

Event OnTimer(int aiTimerID)
	if aiTimerID == iCheckPackageTimerID
	    float currentTimerSeconds = CheckForObserveCombat()
	    if IsRunning()
	    	; how long to wait: 5 seconds max, or reduce the time based on how much time was spent waiting during CheckForObserveCombat
	    	float waitTimer = minTimerSeconds
	    	if currentTimerSeconds < minTimerSeconds
	    		waitTimer = minTimerSeconds - currentTimerSeconds
	    	endif
	    	; add in random factor
	    	waitTimer += utility.RandomFloat(0.0, randomTimerSecondsMax)
		    debug.trace(self + " OnTimer: currentTimerSeconds=" + currentTimerSeconds + ", waitTimer=" + waitTimer)
	    	StartTimer(Math.Max(minTimerSeconds, waitTimer), iCheckPackageTimerID)
	    endif
	endif
EndEvent

float function CheckForObserveCombat()
	debug.trace(self + " CheckForObserveCombat:")
	int relaxCount = 0 ; how many NPCs are in relax package
	Actor[] arenaCombatants = new Actor[0] ; create an array of arena combatants in the array

	float currentTimerSeconds = 0.0

	int i = 0
	while i < Alias_WorkshopNPCs.GetCount()
		Actor theNPC = Alias_WorkshopNPCs.GetAt(i) as Actor
		if theNPC
			Package thePackage = theNPC.GetCurrentPackage()
			if thePackage == DLC02WorkshopSummonedToRelaxPackage || thePackage == DLC02WorkshopSummonedToRelaxObserveCombatOverride
				relaxCount += 1
				if theNPC.GetCurrentPackage() == DLC02WorkshopSummonedToRelaxObserveCombatOverride && utility.RandomFloat() <= cheerChance
					if bArenaFightAchievementDone == false
						; award achievement
						Game.AddAchievement(DLC02WorkshopAttackStarter.ArenaFightAchievementID)
						bArenaFightAchievementDone = true
					endif
					Cheer(theNPC)
					float randomTimer = utility.RandomFloat(0.0, 1.0)
					currentTimerSeconds += randomTimer
					utility.wait(randomTimer)
				endif
			endif
		endif
		i += 1
	endWhile

	; if there are spectators, arena platform NPCs play idles
	if relaxCount > 1
		debug.trace(self + " 	" + relaxCount + " observers - check for arena combatant idles")
		; run through arena platforms, random idle for anyone sitting in them
		ObjectReference[] arenaPlatforms = Alias_Workshop.GetRef().GetWorkshopResourceObjects(DLC02WorkshopRatingArenaPlatform)
		i = 0
		while i < arenaPlatforms.Length
			ObjectReference thePlatform = arenaPlatforms[i]
			if thePlatform && thePlatform.HasActorRefOwner()
				; get owner
				Actor theNPC = thePlatform.GetActorRefOwner() as Actor
				debug.trace(self + " 	platform " + thePlatform + " owned by " + theNPC)
				if theNPC && theNPC.GetDistance(thePlatform) < arenaIdleDistance
					ArenaIdle(theNPC)
					float randomTimer = utility.RandomFloat(1.0, 3.0)
					currentTimerSeconds += randomTimer
					utility.wait(randomTimer)
				endif
			endif
			i += 1
		endWhile
	endif

	return currentTimerSeconds
endFunction

function Cheer(Actor theActor)
	debug.trace(self + "Cheer: " + theActor)
	; if already cheering, clear flag
	if theActor.GetValue(DLC02WorkshopCheering) > 0
		debug.trace(self + "     " + theActor + ": clear cheering flag")
		theActor.SetValue(DLC02WorkshopCheering, 0)
	else
	; otherwise, cheer
		debug.trace(self + "     " + theActor + ": voicetype=" + theActor.GetVoiceType() + " play idle=" + ActionCustomCheering)
		theActor.SetValue(DLC02WorkshopCheering, 1)
		theActor.Say(DLC02WorkshopSummonedToRelaxCheering)
		theActor.PlayIdleAction(ActionCustomCheering)
	endif
endFunction

function ArenaIdle(Actor theActor)
	debug.trace(self + "ArenaIdle: " + theActor)
	; if already idling, clear flag
	if theActor.GetValue(DLC02WorkshopCheering) > 0
		debug.trace(self + "     " + theActor + ": clear cheering flag")
		theActor.SetValue(DLC02WorkshopCheering, 0)
	else
		; otherwise play loose idle
		theActor.SetValue(DLC02WorkshopCheering, 1)
		if utility.RandomInt() > 40
			debug.trace(self + " 	play idle " + DLC02_Idle_BeingCocky + " on " + theActor)
			theActor.PlayIdle(DLC02_Idle_BeingCocky)
		else
			debug.trace(self + " 	play idle " + DLC02_IdleHandsUp + " on " + theActor)
			theActor.PlayIdle(DLC02_IdleHandsUp)
		endif
	endif
endFunction