Scriptname DLC02:DLC02WorkshopAttackStarterScript extends Quest

WorkshopParentScript Property WorkshopParent Auto Const mandatory
{ parent quest - holds most general workshop properties }

struct workshopAttackRatingItem
	ActorValue attackRating  ; workshop attack rating
	Faction attackFaction		; matching faction (for looking up ENC value)
endStruct

workshopAttackRatingItem[] Property WorkshopAttackRatings auto Const
{ array of workshop attack ratings - if > 0, means there's a filled cage at that workshop }

ActorValue property DLC02WorkshopRatingTame auto const mandatory
{ actor value to check for taming captured creatures }

ActorValue property DLC02WorkshopRatingTamedActorCount auto const mandatory
{ actor value resource from each tamed creature - used to track achievement }

Faction property DLC02WorkshopTamedCreatureFaction auto const mandatory
{ actor value to check for taming captured creatures }

Faction property WorkshopNPCFaction auto const mandatory
{ actor value to check for taming captured creatures }

Faction property DomesticAnimalFaction auto const mandatory
{ faction to check for whether to remove WorkshopNPCFaction or not }

ObjectReference property DLC02CageSpawnMarker auto const mandatory
{ marker to holding cell for spawning cage creatures }

EncounterZone property DLC02PlayerLevelZone auto const mandatory
{ used for placing leveled creatures to ensure LVL is based on player's level }

Group AchievementData
	int property TamedCreaturesForAchievement = 5 auto const
	int property TamedCreaturesAchievementID = 56 auto const
	bool property TamedCreaturesAchievementDone = false auto
	{ set to true to ignore further checks once achievement is done }

	int property ArenaFightAchievementID = 57 auto const

	int property CagesAchievementID = 58 auto const
	Form[] property CagesBuilt auto
	{ array of cages that have been built - base objects - added as player builds cages}

	Furniture[] property CagesForAchievement auto const
	{ array of all cages - when CagesBuilt includes all of these, award achievement }
endGroup

Group TutorialMessageData
	int property TutorialMessageStageCage = 10 auto const 
	int property TutorialMessageStageArena = 20 auto const 
	int property AchievementStageCages = 30 auto const 
endGroup

Event OnQuestInit()
	debug.trace(self + " OnQuestInit")
	; register for update events
	RegisterForCustomEvent(WorkshopParent, "WorkshopDailyUpdate")
	; register for build event for achievement
	RegisterForCustomEvent(WorkshopParent, "WorkshopObjectBuilt")
endEvent

Event WorkshopParentScript.WorkshopDailyUpdate(WorkshopParentScript akSender, Var[] akArgs)
	Debug.Trace(self + " WorkshopDailyUpdate event received")
	WorkshopScript[] Workshops = WorkshopParent.Workshops 
	WorkshopDataScript:WorkshopRatingKeyword[] WorkshopRatings = WorkshopParent.WorkshopRatings

	; find a workshop with a cage attack value
	bool bFoundAttackWorkshop = false
	WorkshopScript[] attackWorkshops = new WorkshopScript[0]
	int index = 0
	while index < Workshops.Length
		WorkshopScript workshopRef = workshops[index]
		debug.trace(self + " " + index + ": check " + workshopRef + " for attack rating")
		int ratingIndex = 0
		while ratingIndex < WorkshopAttackRatings.Length
			;debug.trace(self + "	" + WorkshopAttackRatings[ratingIndex] + "=" + workshopRef.GetValue(WorkshopAttackRatings[ratingIndex].attackRating))
			; get days since last attack
			float lastAttackDays = workshopRef.GetValue(WorkshopRatings[WorkshopParent.WorkshopRatingLastAttackDaysSince].resourceValue)
			; get enc value for this attacker
			FollowersScript:EncDefinition encDef = FollowersScript.GetScript().GetEncDefinition(factionToCheck = WorkshopAttackRatings[ratingIndex].attackFaction)
			float attackFactionID = -99.0
			float lastAttackFaction = 0.0
			if encDef
				attackFactionID = encDef.LocEncGlobal.GetValue()
				; get attacking faction ID
				lastAttackFaction = workshopRef.GetValue(WorkshopRatings[WorkshopParent.WorkshopRatingLastAttackFaction].resourceValue)
			endif
			; trigger automatic attack if valid attack rating, AND:
			;  * Last attack faction wasn't this faction
			;  * OR, last attack was 7 days ago
			if workshopRef.GetBaseValue(WorkshopAttackRatings[ratingIndex].attackRating) > 0 && ( lastAttackFaction != attackFactionID || lastAttackDays > 7 )
				bFoundAttackWorkshop = true
				debug.trace(self + " found attack workshop: " + workshopRef)
				attackWorkshops.Add(workshopRef)
				; bail out of loop once we find a valid attack rating
				ratingIndex = WorkshopAttackRatings.Length
			endif
			ratingIndex += 1
		endWhile

		index += 1
	endWhile

	; now, pick randomly from attack array and trigger an attack on it
	if bFoundAttackWorkshop == true 
		int randomAttackIndex = utility.RandomInt(0, attackWorkshops.Length - 1)
		WorkshopScript workshopRef = attackWorkshops[randomAttackIndex]
		debug.trace(self + " pick random workshop to attack: " + workshopRef)
		workshopRef.CheckForAttack(true)
	endif
EndEvent

Event WorkshopParentScript.WorkshopObjectBuilt(WorkshopParentScript akSender, Var[] akArgs)
	if (akArgs.Length > 0)
		WorkshopObjectScript newObject = akArgs[0] as WorkshopObjectScript
		if newObject
	;		WorkshopScript workshopRef = akArgs[1] as WorkshopScript
			if newObject is DLC02:WorkshopCageScript
				; tutorial message
				SetStage(TutorialMessageStageCage)

				Form baseObject = newObject.GetBaseObject()
				if CagesBuilt.Find(baseObject) == -1
					; new cage, add to array
					CagesBuilt.Add(baseObject)
					CheckForCagesBuiltAchievement()
				endif
			elseif newObject is DLC02:DLC02WorkshopArenaCombatantScript
				; tutorial message
				SetStage(TutorialMessageStageArena)
			endif
			; see if OK to unregister for build event
			CheckForUnregister()			
		endif

	endif
EndEvent

function CheckForCagesBuiltAchievement()
	; if size of arrays match, done (NOTE: gorilla cage starts in CagesBuilt array to make this work)
	if CagesBuilt.Length >= CagesForAchievement.Length
		SetStage(AchievementStageCages)
	endif
endFunction

function CheckForTamedCreaturesAchievement(WorkshopScript workshopRef)
	debug.trace(self + "CheckForTamedCreaturesAchievement at " + workshopRef)
	if TamedCreaturesAchievementDone == false
		; update resource values
		workshopRef.RecalculateWorkshopResources()
		; does this workshop have 5 tamed creatures?
		int tamedCount = workshopRef.GetValue(DLC02WorkshopRatingTamedActorCount) as int

		debug.trace(self + "CheckForTamedCreaturesAchievement: tamedCount=" + tamedCount)

		if tamedCount >= TamedCreaturesForAchievement
			Game.AddAchievement(TamedCreaturesAchievementID)
			TamedCreaturesAchievementDone = true
		endif
	endif
endFunction

; call to see if time to unregister for build event
function CheckForUnregister()
	; check if OK to turn off event registration
	if GetStageDone(AchievementStageCages) && GetStageDone(TutorialMessageStageCage) && GetStageDone(TutorialMessageStageArena)
		; no need for this event any more
		UnregisterForCustomEvent(WorkshopParent, "WorkshopObjectBuilt")
	endif
endFunction


