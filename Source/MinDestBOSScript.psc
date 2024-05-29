Scriptname MinDestBOSScript extends Quest Conditional

MinutemenCentralScript property MinutemenCentralQuest auto const

Quest property MinDestBoSArtillery auto const
{ Quest that finds available artillery and fires it at the Prydwen }

bool initialized = false
WorkshopEventsQuestScript myWorkshopEvents

RefCollectionAlias Property CastleNPCs Auto Const
ReferenceAlias Property MinutemenRadioAnnouncer Auto Const

RefCollectionAlias Property CastleArtillery Auto Const
{ castle artillery - only filled once firing sequence starts }

RefCollectionAlias Property WatchMarkers Auto Const
Keyword Property RELinkTravel Auto Const

LocationAlias Property TheCastleLocation auto const
ReferenceAlias Property CastleWorkshop auto const
DN133CastleSpeakerControllerScript Property DN133CastleSpeakerControllerRef Auto

ObjectReference property PrydwenDestructionRef auto const

GlobalVariable Property MinDestBOSArtilleryCount Auto Const
GlobalVariable Property MinDestBOSArtilleryTotal Auto Const
GlobalVariable Property MinDestBOSArtilleryPercent Auto Const
GlobalVariable Property PlayerBOS_Destroyed Auto Const

GlobalVariable Property XPFactionFinal Auto Const

Keyword Property MinRadiantStart_BOS auto const

int artilleryObjective = 200
int doneObjective = 300

int triggerBOSattackCount = 2 ; when artillery settlement count hits this, trigger BOS attack
int triggerBOSattackTimerID = 1

int property triggerVertibirdAccessTimerID = 2 auto const

bool readyToAttack = false Conditional
bool awardedXP = false Conditional  ; set to true when player is awarded XP (so we only do it once)

WorkshopParentScript Property WorkshopParent Auto Const

; called once by startup stage
function InitializeQuest()
	if initialized
		return
	endif
	myWorkshopEvents = (self as Quest) as WorkshopEventsQuestScript

	; register for events
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")

	initialized = true
endFunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	debug.trace(self + " received OnLocationChange from " + akSender + " akOldLoc=" + akOldLoc + ", akNewLoc=" + akNewLoc)
	; watch for player OnLocationChange events:
	if akSender == Game.GetPlayer()
		; if leaving an artillery settlement
		if akOldLoc && akOldLoc.HasKeyword(WorkshopParent.LocTypeWorkshopSettlement)
			; artillery?
			WorkshopScript workshopRef = WorkshopParent.GetWorkshopFromLocation(akOldLoc)
			if workshopRef && workshopRef.GetValue(WorkshopParent.WorkshopRatingValues[WorkshopParent.WorkshopRatingArtillery]) > 0
				debug.trace(self + " player exited artillery location")
				if MinDestBOSArtilleryCount.GetValue() >= triggerBOSattackCount
					debug.trace(self + " run timer for BOS attack")
					; run timer for BOS story event
					StartTimerGameTime(2.0, triggerBOSattackTimerID)
				endif
			endif
		endif
	endif
EndEvent

Event OnTimerGameTime(int aiTimerID)
    debug.trace(self + "OnTimerGameTime")
    if aiTimerID == triggerBOSattackTimerID
		debug.trace(self + " try to trigger BOS attack")
    	; send BOS attack keyword with strength 100
    	MinRadiantStart_BOS.SendStoryEvent(aiValue1 = 100)
    elseif aiTimerID == triggerVertibirdAccessTimerID
		debug.trace(self + " trigger vertibird access")
		SetStage(800)
    endif
EndEvent

Event PrydwenDestructionScript.PrydwenDestructionDone(PrydwenDestructionScript akSender, Var[] akArgs)
	debug.trace(self + " received PrydwenDestructionDone event")
	SetStage(500)
endEvent

Event WorkshopParentScript.WorkshopObjectBuilt(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + "WorkshopObjectBuilt")
	CheckForArtilleryObject(akArgs)
EndEvent

Event WorkshopParentScript.WorkshopObjectMoved(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + "WorkshopObjectMoved")
	CheckForArtilleryObject(akArgs)
EndEvent

Event WorkshopParentScript.WorkshopObjectDestroyed(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + "WorkshopObjectDestroyed")
	CheckForArtilleryObject(akArgs)
EndEvent

Event WorkshopParentScript.WorkshopObjectRepaired(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + "WorkshopObjectRepaired")
	CheckForArtilleryObject(akArgs)
EndEvent

Event WorkshopParentScript.WorkshopActorAssignedToWork(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + "WorkshopActorAssignedToWork")
	CheckForArtilleryObject(akArgs)
EndEvent

Event WorkshopParentScript.WorkshopActorUnassigned(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + "WorkshopActorUnassigned")
	CheckForArtilleryObject(akArgs)
EndEvent

Event WorkshopParentScript.WorkshopObjectDestructionStageChanged(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + "WorkshopObjectDestructionStageChanged")
	CheckForArtilleryObject(akArgs)
EndEvent

Event WorkshopParentScript.WorkshopObjectPowerStageChanged(WorkshopParentScript akSender, Var[] akArgs)
	CheckForArtilleryObject(akArgs)
EndEvent

Event WorkshopParentScript.WorkshopPlayerOwnershipChanged(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + "WorkshopPlayerOwnershipChanged")
	; always update objective when player ownership changes
	UpdateArtilleryObjective()
EndEvent

; called by object-related events - if artillery object then update objective
function CheckForArtilleryObject(Var[] akArgs)
	debug.trace(self + "CheckForArtilleryObject")
	if (akArgs.Length > 0)
		WorkshopObjectScript newObject = akArgs[0] as WorkshopObjectScript
		if newObject.HasResourceValue(WorkshopParent.WorkshopRatingValues[WorkshopParent.WorkshopRatingArtillery])
			WorkshopScript workshopRef = akArgs[1] as WorkshopScript
			workshopRef.WaitForWorkshopResourceRecalc()		
			UpdateArtilleryObjective()
		endif
	endif
endFunction

function UpdateArtilleryObjective()
	debug.trace(self + "UpdateArtilleryObjective")
	float currentRating =  WorkshopParent.GetWorkshopRatingLocations(WorkshopParent.WorkshopRatingArtillery)
	; update objective count if the current rating has increased by at least 1
	float objectiveCount = MinDestBOSArtilleryCount.GetValue()
	int diff = Math.Floor(currentRating - objectiveCount)
	debug.trace(self + " diff=" + diff)
	if diff != 0 || IsObjectiveDisplayed(artilleryObjective) == false
		float percentComplete = (currentRating/MinDestBOSArtilleryTotal.GetValue()) * 100
		debug.trace(self + " currentRating=" + currentRating + ", maxCount=" + MinDestBOSArtilleryTotal.GetValue() + ", percentComplete=" + percentComplete)
		MinDestBOSArtilleryPercent.SetValue(percentComplete)
		UpdateCurrentInstanceGlobal(MinDestBOSArtilleryPercent)
		if ModObjectiveGlobal(diff, MinDestBOSArtilleryCount, artilleryObjective, MinDestBOSArtilleryTotal.GetValue())
			debug.trace(self + " objective complete")
			readyToAttack = true
			;SetObjectiveCompleted(artilleryObjective)
			SetObjectiveDisplayed(doneObjective)
		else
			debug.trace(self + " objective NOT complete")
			readyToAttack = false
			if isObjectiveCompleted(artilleryObjective)
				SetObjectiveCompleted(artilleryObjective, false)
			endif
			;SetObjectiveDisplayed(aiObjective = artilleryObjective, abForce = true)
			if isObjectiveDisplayed(doneObjective)
				SetObjectiveDisplayed(doneObjective, false)
			endif
		endif
		debug.trace(self + "		readyToAttack=" + readyToAttack)
	endif
endFunction

; call this when player orders strike
function InitializeAttackSequence()
	(PrydwenDestructionRef as PrydwenDestructionScript).SwapPrydwen()
	
	MinDestBoSArtillery.SetStage(10)	
	UpdateCastleNPCs()

	; turn on speakers
    DN133CastleSpeakerControllerRef.SetOn()
endFunction

; update list of castle NPCs
function UpdateCastleNPCs()
	debug.trace(self + " UpdateCastleNPCs: START")
	CastleNPCs.RemoveAll()
    ;add everyone to the CastleNPCs alias
    ObjectReference[] defenderRefs = WorkshopParent.GetWorkshopActors(CastleWorkshop.GetRef() as WorkshopScript)
    CastleNPCs.AddArray(defenderRefs)
	; remove radio guy - we want him to stay on the radio
	CastleNPCs.RemoveRef(MinutemenRadioAnnouncer.GetRef())
	; remove artillery gunners
	int i = 0
	while i < CastleArtillery.GetCount()
		ObjectReference artilleryRef = CastleArtillery.GetAt(i)
		ObjectReference artilleryOwner = artilleryRef.GetActorRefOwner()
		debug.trace(self + " UpdateCastleNPCs: remove " + artilleryOwner + " from CastleNPCs list")
		if artilleryOwner
			CastleNPCs.RemoveRef(artilleryOwner)
		endif
		i += 1
	endWhile

	; link npcs to markers so they don't all stand in the same spot		    
	CastleNPCs.LinkCollectionTo(WatchMarkers, RELinkTravel, wrapLinks = true)
	debug.trace(self + " UpdateCastleNPCs: DONE")
endFunction

function AimArtillery()
	MinDestBoSArtillery.SetStage(20)
endFunction

function StartFiringArtillery()
	MinDestBoSArtillery.SetStage(50)
endFunction

InputEnableLayer destructionEnableLayer

function StartDestructionCountdown(bool bBeginCountdown)
	; disable/enable some player controls during the sequence
	if bBeginCountdown
		destructionEnableLayer = InputEnableLayer.Create()
		destructionEnableLayer.EnableFastTravel(false)
	else
		if destructionEnableLayer
			destructionEnableLayer.Delete()
		endif
	endif

endFunction

function DestroyBOS()
	; register for destruction event
	RegisterForCustomEvent(PrydwenDestructionRef as PrydwenDestructionScript, "PrydwenDestructionDone")

	; initiate destruction sequence
	(PrydwenDestructionRef as PrydwenDestructionScript).StartCrash(false)
endFunction

function RegisterForWorkshopEvents(bool bRegister = true)
	; register for build events from workshop
	WorkshopParent.RegisterForWorkshopEvents(self, bRegister)
endFunction


