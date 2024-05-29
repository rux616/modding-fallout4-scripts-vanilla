Scriptname DLC03:FogCondenserCollectionAliasScript extends DefaultCollectionAliasOnActivate

GlobalVariable property CondenserCount auto const
{ global to increment when each condenser is repaired }

Int property ObjectiveID = 20 auto const
{ objective to update when condenser is repaired }

int property StartRepairStage = 110 auto const 
{ stage to set when first pylon is repaired }

float property fPlayerRepairTime = 8.0 auto const 
int iPlayerRepairTimerID = 1 const 

InputEnableLayer enableLayer 		; set when player is repairing a condenser
ObjectReference currentCondenser 	; player is repairing this condenser

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
	debug.Trace(self + ": OnActivate() Called on FogCondenserCollectionAliasScript script by " + akSenderRef + ".")
	if (DefaultScriptFunctions.CheckForMatches(RefToCheck = akActionRef, ReferenceArray = ActivatedByReferences, AliasArray = ActivatedByAliases, FactionArray = ActivatedByFactions, PlayerCheckOverride = PlayerActivateOnly) == TRUE)
		; repair the pylon
		if akSenderRef is DLC03:FogCondenserFurnitureScript
			; if player, lock controls briefly
			if akActionRef == Game.GetPlayer()
				DLC03:FogCondenserFurnitureScript condenserRef = akSenderRef as DLC03:FogCondenserFurnitureScript
				if condenserRef.bRepaired == false
					enableLayer = InputEnableLayer.Create()
					enableLayer.DisablePlayerControls(abMovement = true, abFighting = true, abCamSwitch = false, abLooking = false, abSneaking = false, abMenu = true, abActivate = true, abJournalTabs = false, abVATS = true, abFavorites = true, abRunning = false)
					currentCondenser = akSenderRef
					StartTimer(fPlayerRepairTime, iPlayerRepairTimerID)
				endif
			else 
				(akSenderRef as DLC03:FogCondenserFurnitureScript).RepairMe(true)
				HandleRepair(akSenderRef, akActionRef)
			endif
		endif

	endif
EndEvent

Function BreakAllCondensers()
	int i = 0
	while i < GetCount()
		DLC03:FogCondenserFurnitureScript condenser = GetAt(i) as DLC03:FogCondenserFurnitureScript
		if condenser
			condenser.RepairMe(false)
		endif
		i += 1
	endWhile
endFunction

Function RepairAllCondensers()
	int i = 0
	while i < GetCount()
		DLC03:FogCondenserFurnitureScript condenser = GetAt(i) as DLC03:FogCondenserFurnitureScript
		if condenser
			condenser.RepairMe(true)
		endif
		i += 1
	endWhile
endFunction

Event OnTimer(int aiTimerID)
	if aiTimerID == iPlayerRepairTimerID
		debug.trace(self + " OnTimer - get player out of condenser")
		; unlock player controls and remove from furniture
		if enableLayer
			(currentCondenser as DLC03:FogCondenserFurnitureScript).RepairMe(true)
			HandleRepair(currentCondenser, Game.GetPlayer())

			; get player out of furniture
			currentCondenser.Activate(Game.GetPlayer())
			currentCondenser = NONE ; clear variable
			; enable player controls
			enableLayer.Delete()
		endif
	endif
EndEvent

function HandleRepair(ObjectReference akCondenserRef, ObjectReference akActionRef)
	GetOwningQuest().ModObjectiveGlobal(1.0, CondenserCount, ObjectiveID)
	; set stage when first one repaired to give quest log
	debug.trace(self + " condenser repaired - setting stage " + StartRepairStage)
	GetOwningQuest().SetStage(StartRepairStage)

	TryToSetStage(TriggeredRef = akCondenserRef, setStageOnSingleTrigger = setStageWhenAnyRefActivated, PlayerCheckOverride = PlayerActivateOnly, RefToCheck = akActionRef, ReferenceArray = ActivatedByReferences, AliasArray = ActivatedByAliases, FactionArray = ActivatedByFactions)
endFunction