Scriptname DLC04:DLC04RaidTrackNearbyOutpostsScript extends Quest

WorkshopParentScript Property WorkshopParent Auto Const Mandatory
{Workshop Parent quest script}

DLC04WorkshopParentScript Property DLC04WorkshopParent Auto Const Mandatory
{DLC04 Workshop Parent script}

ReferenceAlias Property Workshop Auto Const Mandatory
{Alias for target settlement's workshop}

; nearby raider settlement tracking
RefCollectionAlias Property NearbyRaiderWorkshops Auto Const Mandatory
{Alias collection of nearby raider workshops } 

GlobalVariable Property DLC04RaidVassalDistance Auto Const Mandatory
{Distance used to calc effect of nearby Raider settlements for intimidation}

bool Property bIsChaseOffQuest Auto Const
{Bool used to determine which quest this should be handing off to (Chase Off or Coerce)}

DLC04:DLC04RaidCoerceScript Property DLC04RaidCoerce Auto Const Mandatory
{Coerce quest script}

DLC04:DLC04RaidChaseOffScript Property DLC04RaidChaseOff Auto Const Mandatory
{Chase off quest script}

float Property fRadioIntimidationTimerLength = 0.4 Auto Const
{Length of time to wait between }

;Local vars
int iRadioBeaconCount = 0
int iRadioIntimidationTimerID = 1 Const

Event OnQuestInit()
	; keep nearby raider settlements collection up to date
	RegisterForCustomEvent(DLC04WorkshopParent, "DLC04WorkshopRaiderSettlementEvent")
endEvent

; raider radio transmitter tracking
function StartRadioTransmitterTracking(bool bStart = true)
	int i = 0
	while i < NearbyRaiderWorkshops.GetCount()
		WorkshopScript nearbyWorkshopRef = NearbyRaiderWorkshops.GetAt(i) as WorkshopScript 
		if nearbyWorkshopRef
			if bStart
				RegisterForCustomEvent(WorkshopParent, "WorkshopObjectPowerStageChanged")
				RegisterForCustomEvent(WorkshopParent, "WorkshopObjectDestroyed")
				RegisterForCustomEvent(DLC04WorkshopParent, "DLC04WorkshopRaiderTransmitterEvent")
			else 
				UnregisterForCustomEvent(WorkshopParent, "WorkshopObjectPowerStageChanged")
				UnregisterForCustomEvent(WorkshopParent, "WorkshopObjectDestroyed")
				UnregisterForCustomEvent(DLC04WorkshopParent, "DLC04WorkshopRaiderTransmitterEvent") 
			endif
		endif
		i += 1
	endWhile
	if bStart 
		; do an intial update, but don't update any intimdation objectives just yet
		UpdateRadioIntimidationValue(false)
	endif
endFunction 

Event DLC04:DLC04WorkshopParentScript.DLC04WorkshopRaiderSettlementEvent(DLC04:DLC04WorkshopParentScript akSender, Var[] akArgs)
	WorkshopScript workshopRef = akArgs[0] as WorkshopScript
	bool bCreated = akArgs[1] as bool
	int raiderGangValue = akArgs[2] as int
 
	if bCreated
		; is this close enough to the raid target to qualify as "nearby"?
		if workshopRef.GetDistance(Workshop.GetRef()) <= DLC04RaidVassalDistance.GetValue()
			; add it to collection
			NearbyRaiderWorkshops.AddRef(workshopRef)

			;Update the variable on the quest to reflect the change (used for dialogue variations)
			UpdateQuestRaiderSettlementCount(true)
		endif
	else 
		; remove it
		NearbyRaiderWorkshops.RemoveRef(workshopRef)
		UpdateQuestRaiderSettlementCount(false)
	endif

	;Update the intimidation value for the base quest
	UpdateQuestIntimidationValue()
EndEvent

Event DLC04:DLC04WorkshopParentScript.DLC04WorkshopRaiderTransmitterEvent(DLC04:DLC04WorkshopParentScript akSender, Var[] akArgs)
	WorkshopScript workshopRef = akArgs[0] as WorkshopScript
	if workshopRef && NearbyRaiderWorkshops.Find(workshopRef) > -1
		StartTimer(fRadioIntimidationTimerLength, iRadioIntimidationTimerID)
		debug.trace(self + "DLC04 Track Nearby Outposts Script: Starting timer from transmitter event.")
	endif
endEvent 

Event WorkshopParentScript.WorkshopObjectPowerStageChanged(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + " WorkshopObjectPowerStageChanged received")
	HandleWorkshopEvent(akArgs)
EndEvent

Event WorkshopParentScript.WorkshopObjectDestroyed(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + " WorkshopObjectDestroyed received")
	HandleWorkshopEvent(akArgs)
EndEvent

Event OnTimer(int aiTimerID)
	;Once the timer has completed, update the quest values
	if aiTimerID == iRadioIntimidationTimerID
		UpdateRadioIntimidationValue()
		UpdateQuestRadioObjective()
	endif
EndEvent

function HandleWorkshopEvent(Var[] akArgs)
	if (akArgs.Length > 0)
		WorkshopObjectScript newObject = akArgs[0] as WorkshopObjectScript
		if newObject.GetBaseValue(DLC04WorkshopParent.DLC04WorkshopRatingRaiderRadio) > 0
			;Throw a timer to prevent the player spamming the system
			StartTimer(fRadioIntimidationTimerLength, iRadioIntimidationTimerID)
			debug.trace(self + "DLC04 Track Beacons Script: Starting timer from handle workshop event.")
		endif
	endif
endFunction 

function UpdateRadioIntimidationValue(bool bShowMessages = true)
	; run through all nearby raider outposts to update intimidation value for current radio transmitter status
	; 1. clear current radio intimidation value
	iRadioBeaconCount = 0

	; 2. recalculate radio intimidation value
	int i = 0
	while i < NearbyRaiderWorkshops.GetCount()
		WorkshopScript nearbyWorkshopRef = NearbyRaiderWorkshops.GetAt(i) as WorkshopScript 
		if nearbyWorkshopRef && nearbyWorkshopRef.GetValue(DLC04WorkshopParent.DLC04WorkshopRatingRaiderRadio)
			; add to radio intimidation value
			iRadioBeaconCount += 1
			debug.trace(self+ "DLC04 Track Nearby Outposts: Updating Radio Intimidation Value on workshop: " + nearbyWorkshopRef + ". Beacon count: " + iRadioBeaconCount)
		endif
		i += 1
	endWhile

	debug.trace(self+ "DLC04 Track Nearby Outposts: Total Beacon count: " + iRadioBeaconCount)
	PassRadioValueToQuestScript(iRadioBeaconCount, bShowMessages)
endFunction

Function PassRadioValueToQuestScript(int iRadioBeacons, bool bShowMessages = true)
	if bIsChaseOffQuest
		DLC04RaidChaseOff.iRaiderRadioBeaconCount = iRadioBeacons
	else
		DLC04RaidCoerce.iRaiderRadioBeaconCount = iRadioBeacons
	endif

	;Update the intimidation value on the quest
	UpdateQuestIntimidationValue(bShowMessages)
EndFunction

Function UpdateQuestIntimidationValue(bool bShowMessages = true)
	if bIsChaseOffQuest
		DLC04RaidChaseOff.CalculateIntimidationValue(bShowMessages)
	else
		DLC04RaidCoerce.CalculateIntimidationValue(bShowMessages)
	endif
EndFunction

Function UpdateQuestRadioObjective()
	if bIsChaseOffQuest
		DLC04RaidChaseOff.UpdateRadioBeaconObjective()
	else
		DLC04RaidCoerce.UpdateRadioBeaconObjective()
	endif
EndFunction

Function UpdateQuestRaiderSettlementCount(bool bIncrement = true)
	if bIsChaseOffQuest
		DLC04RaidChaseOff.UpdateNewRaiderSettlementVar(bIncrement)
	else
		DLC04RaidCoerce.UpdateNewRaiderSettlementVar(bIncrement)
	endif
EndFunction