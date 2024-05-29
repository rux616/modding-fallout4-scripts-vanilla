Scriptname DLC02:DLC02TamedActorScript extends Actor

DLC02:DLC02WorkshopAttackStarterScript property DLC02WorkshopAttackStarter auto const mandatory

bool property CanBeTamed = true auto const
{ false = can never be tamed 
  true = allow taming with taming siren
}

float property SafetyRating = 0.0 auto const
{ Safety rating to set on actor when tamed }

int originalAggression = -1

bool property bIsTamed = false auto hidden

int iOnLoadTimerID = 1
float fOnLoadTimerSeconds = 3.0

event OnLoad()
	debug.trace(self + " OnLoad bIsTamed=" + bIsTamed)
	if originalAggression == -1
		originalAggression = GetValue(Game.GetAggressionAV()) as int
		debug.trace(self + "  originalAggression=" + originalAggression)
	endif
endEvent

event OnUnload()
	; delete me if untamed (since all cage creatures are created as non-temp)
	if CanBeTamed == false || bIsTamed == false
		UnregisterForAllEvents()
		Delete()
	endif
endEvent

event ObjectReference.OnWorkshopMode(ObjectReference akSource, bool aStart)
	debug.trace(self + " OnWorkshopMode")
	if aStart == false
		CheckForTame()
	endif
endEvent

; return value is final tamed state:
;    FALSE - not tamed
; 	 TRUE - tamed
; cageWorkshop - pass in to assign to this workshop if tamed
bool function CheckForTame(WorkshopScript cageWorkshop = NONE)
	debug.trace(self + " CheckForTame: cageWorkshop=" + cageWorkshop + " bIsTamed=" + bIsTamed)

	bool bTameMe = false ; if this is set to true, we'll assign to new workshop if necessary and tame

	WorkshopScript workshopRef = cageWorkshop

	; if cageWorkshop not passed in, try to get it (only works if already assigned to a workshop)
	if workshopRef == NONE
		debug.trace(self + " CheckForTame: find workshop...")
		WorkshopNPCScript workshopNPC = ((self as Actor) as WorkshopNPCScript)
		if workshopNPC
			int workshopID = workshopNPC.GetWorkshopID()
			if workshopID > -1
				workshopRef = workshopNPC.WorkshopParent.GetWorkshop(workshopID)
				debug.trace(self + " CheckForTame: found workshop " + workshopRef)
			endif
		endif
	endif

	; current tame state of my workshop (if I have one)
	if workshopRef
		debug.trace(self + " CheckForTame: DLC02WorkshopRatingTame=" + workshopRef.GetValue(DLC02WorkshopAttackStarter.DLC02WorkshopRatingTame))
		bTameMe = (workshopRef.GetValue(DLC02WorkshopAttackStarter.DLC02WorkshopRatingTame) > 0) && CanBeTamed
	endif

	if cageWorkshop && bTameMe
		bIsTamed = true ; flag as tamed so TameMe will set me to tamed
		if (self as Actor) is WorkshopNPCScript
			debug.trace(self + " CheckForTame - workshopNPC - add to workshop")
			workshopRef.WorkshopParent.AddActorToWorkshop((self as Actor) as WorkshopNPCScript, workshopRef, bResetMode = true)
			; non-domestic creatures: remove from WorkshopNPCFaction so they aren't friends with arena combatants (tamed creature faction IS friends with WorkshopNPCFaction)
			if IsInFaction(DLC02WorkshopAttackStarter.DomesticAnimalFaction) == false
				RemoveFromFaction(DLC02WorkshopAttackStarter.WorkshopNPCFaction)
			endif
		endif
	endif

	TameMe(bTameMe, workshopRef)

	debug.trace(self + " CheckForTame DONE: bIsTamed=" + bIsTamed)
	return bIsTamed
endFunction

; utility function - keep tame or untame
; pass in workshopRef for speed since we already have it
function TameMe(bool bTameMe, WorkshopScript workshopRef)
	; only need to untame if currently tamed (otherwise, do nothing)
	if bIsTamed
		if bTameMe == false
			; untame me
			bIsTamed = false
			; otherwise, unregister and untame
			UnregisterForRemoteEvent(workshopRef, "OnWorkshopMode")
			debug.trace(self + " UNTAME!!!")
			workshopRef.WorkshopParent.RemoveActorFromWorkshopPUBLIC((self as Actor) as WorkshopNPCScript)
			; remove from tame faction
			RemoveFromFaction(DLC02WorkshopAttackStarter.DLC02WorkshopTamedCreatureFaction)
			; restore original aggression
			SetValue(Game.GetAggressionAV(), originalAggression)
			; clear tamed creature count resource value
			SetValue(DLC02WorkshopAttackStarter.DLC02WorkshopRatingTamedActorCount, 0)
			; clear Safety rating
			if SafetyRating > 0
				SetValue(DLC02WorkshopAttackStarter.WorkshopParent.WorkshopRatings[DLC02WorkshopAttackStarter.WorkshopParent.WorkshopRatingSafety].resourceValue, 0)
				workshopRef.RecalculateWorkshopResources()
			endif
		else
			; if still tamed, register for remote event
			RegisterForRemoteEvent(workshopref, "OnWorkshopMode")
			bIsTamed = true
			SetValue(Game.GetAggressionAV(), 1.0) ; set to Aggressive
			
			; set tamed creature count resource value
			SetValue(DLC02WorkshopAttackStarter.DLC02WorkshopRatingTamedActorCount, 1)

			; set safety value if any
			if SafetyRating > 0
				SetValue(DLC02WorkshopAttackStarter.WorkshopParent.WorkshopRatings[DLC02WorkshopAttackStarter.WorkshopParent.WorkshopRatingSafety].resourceValue, SafetyRating)
				workshopRef.RecalculateWorkshopResources()
			endif

			; check for achievement
			DLC02WorkshopAttackStarter.CheckForTamedCreaturesAchievement(workshopRef)			
		endif
	else
		; make sure removed from tame faction
		RemoveFromFaction(DLC02WorkshopAttackStarter.DLC02WorkshopTamedCreatureFaction)
	endif
endFunction