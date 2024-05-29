Scriptname DLC06:DLC06WorkshopParent extends WorkshopAddLocationsScript

FormList property WorkshopMenuMain auto const mandatory 
FormList property DLC06WorkshopMenu01Vault auto const mandatory 

WorkshopScript property VaultWorkshop auto const mandatory 

GlobalVariable property DLC06PlayerIsOverseer auto const mandatory 

ReferenceAlias property WorkshopBarber auto const mandatory 
Scene property DLC06WorkshopGenericBarberSurgeryScene auto const mandatory 

group controlBoard 
	Message property DLC06WorkshopInsertControlBoardMessage auto const mandatory 
	{ message box asking if player wants to insert control board into inactive workshop }

	Message property DLC06WorkshopNeedControlBoardMessage auto const mandatory 
	{ message telling player they need a control board to activate this }
endGroup 

struct BuildAreaData
	bool bActive = false
	DLC06:VaultWorkshopActivatorScript BuildAreaActivator
	{ "workshop" activator that activates this build area }
	ObjectReference BuildAreaRef 
	ObjectReference BuildAreaEdge
	{ enable this edge marker when this build area is active }
	ObjectReference BuildAreaEdgeInactive
	{ enable this edge marker when this build area is inactive }

	DLC06:VaultWorkshopActivatorScript AdjacentBuildAreaActivator
	{ adjacent build area activator - if this is not active, enable/disable additional edge marker}
	ObjectReference AdjacentBuildAreaEdge

	DLC06:VaultWorkshopActivatorScript AdjacentBuildAreaActivator02
	{ adjacent build area activator - if this is not active, enable/disable additional edge marker}
	ObjectReference AdjacentBuildAreaEdge02
endStruct

BuildAreaData[] property BuildAreas auto 
{ array of child build areas }

group caravanActors 
	RefCollectionAlias property CaravanActorOverride auto const mandatory 
	{ collection of caravan actors targeting the vault workshop }

	Faction Property workshopCaravanFaction Auto Const Mandatory
endGroup 

group Achievements 
	int property iAchievement01ID = 72 auto const 
	{ become Overseer}
	int property iAchievement01Stage = 500 auto const 

	int property iAchievement02ID = 73 auto const 
	{ unlock all build areas in Vault 88 }
	int property iAchievement02Stage = 510 auto const 

	int property iAchievement03ID = 74 auto const 
	{ equip vault suit and pipboy }
	int property iAchievement03Stage = 520 auto const 
endGroup

group SettlerMortalityCheck 
	ActorValue property DLC06WorkshopRatingMortalityChance auto const mandatory
	ActorValue property DLC06WorkshopRatingMortalityChanceLastCheck auto const mandatory

	float property MortalityCheckInterval = 1.0 auto const 
	{ in game days - don't check more often than this }

	float property MortalityCheckMaxPercent = 10.0 auto const 
	{ don't go higher than this }
endGroup 

function OnQuestInitCustom()
	; register for events from vault workshop
	RegisterForRemoteEvent(VaultWorkshop, "OnWorkshopMode")
	; caravan events
	RegisterForCustomEvent(WorkshopParent, "WorkshopActorCaravanAssign")
	RegisterForCustomEvent(WorkshopParent, "WorkshopActorCaravanUnassign")
	; overseer desk tracking
	RegisterForRemoteEvent(VaultWorkshop, "OnWorkshopObjectPlaced")
	RegisterForRemoteEvent(VaultWorkshop, "OnWorkshopObjectDestroyed")
endFunction

; call once init process is done
function RegisterForLocationLoadedEvents()
	debug.trace(self + " RegisterForLocationLoadedEvents")
	; location loaded events
	RegisterForRemoteEvent(VaultWorkshop.myLocation, "OnLocationLoaded")
	; from all workshop locations
	int i = 0
	while i < WorkshopParent.Workshops.Length 
		RegisterForRemoteEvent(WorkshopParent.Workshops[i].myLocation, "OnLocationLoaded")
		i += 1
	endWhile 
endFunction 

function AddBuildArea(DLC06:VaultWorkshopActivatorScript newBuildAreaActivator)
	debug.trace(self + "AddBuildArea " + newBuildAreaActivator)
	int buildAreaIndex = BuildAreas.FindStruct("BuildAreaActivator", newBuildAreaActivator)
	if buildAreaIndex > -1
		debug.trace(self + "   found build area " + buildAreaIndex)
		BuildAreaData theBuildArea = BuildAreas[buildAreaIndex]
		theBuildArea.bActive = true
		; enable build areas
		theBuildArea.BuildAreaRef.Enable()
		debug.trace(self + "   new build area " + theBuildArea.BuildAreaRef + " enabled")
		; check for linked children
		ObjectReference[] children = theBuildArea.BuildAreaRef.GetLinkedRefChildren(NONE)
		int childIndex = 0
		while childIndex < children.Length 
			; enable each child also
			children[childIndex].Enable()
			debug.trace(self + "      child build area " + children[childIndex] + " enabled")
			childIndex += 1
		endWhile
		; add build budget values
		; initialize building budget actor values if necessary
		if newBuildAreaActivator.MaxTriangles > 0
			debug.trace(self + " adding build stats from " + newBuildAreaActivator + ": BEFORE max triangles " + vaultworkshop.Getvalue(WorkshopParent.WorkshopMaxTriangles))
			float newValue = VaultWorkshop.GetBaseValue(WorkshopParent.WorkshopMaxTriangles) + newBuildAreaActivator.MaxTriangles
			VaultWorkshop.SetValue(WorkshopParent.WorkshopMaxTriangles, newValue)
			debug.trace(self + " adding build stats from " + newBuildAreaActivator + ": AFTER max triangles " + vaultworkshop.Getvalue(WorkshopParent.WorkshopMaxTriangles))
		endif
		if newBuildAreaActivator.MaxDraws > 0
			float newValue = VaultWorkshop.GetBaseValue(WorkshopParent.WorkshopMaxDraws) + newBuildAreaActivator.MaxDraws
			VaultWorkshop.SetValue(WorkshopParent.WorkshopMaxDraws, newValue)
		endif
		if newBuildAreaActivator.CurrentTriangles > 0
			float newValue = VaultWorkshop.GetBaseValue(WorkshopParent.WorkshopCurrentTriangles) + newBuildAreaActivator.CurrentTriangles
			VaultWorkshop.SetValue(WorkshopParent.WorkshopCurrentTriangles, newValue)
		endif
		if newBuildAreaActivator.CurrentDraws > 0
			float newValue = VaultWorkshop.GetBaseValue(WorkshopParent.WorkshopCurrentDraws) + newBuildAreaActivator.CurrentDraws
			VaultWorkshop.SetValue(WorkshopParent.WorkshopCurrentDraws, newValue)
		endif

	endif

	; achievement - if all build areas are unlocked
	int i = 0
	bool bAllUnlocked = true
	while i < BuildAreas.Length && bAllUnlocked
		if BuildAreas[i].bActive == false 
			bAllUnlocked = false 
		endif
		i += 1
	endWhile

	if bAllUnlocked
		SetStage(iAchievement02Stage)
	endif 
endFunction

function SetPlayerOverseer()
	debug.trace(self + " SetPlayerOverseer")
	DLC06PlayerIsOverseer.SetValue(1)
	SetStage(iAchievement01Stage)
endFunction 

function AddVaultSuitAchievement()
	debug.trace(self + " AddVaultSuitAchievement")
	SetStage(iAchievement03Stage)	
endFunction

Event ObjectReference.OnWorkshopMode(ObjectReference akSource, bool aStart)
	if akSource == VaultWorkshop
		debug.trace(self + " OnWorkshopMode " + akSource + " " + aStart + ": BEGIN")
		int i = 0
		while i < BuildAreas.Length 
			BuildAreaData theBuildArea = BuildAreas[i]
			debug.trace(self + " 	checking build area  " + i + ":")
			ObjectReference edgeMarkerRef
			; which edge marker to use?
			if theBuildArea.bActive 
				edgeMarkerRef = theBuildArea.BuildAreaEdge
				debug.trace(self + " 	  ACTIVE - use edge marker " + edgeMarkerRef)
			else 
				edgeMarkerRef = theBuildArea.BuildAreaEdgeInactive
				debug.trace(self + " 	  INACTIVE - use edge marker " + edgeMarkerRef)
			endif
			if aStart 
				edgeMarkerRef.Enable()
			else 
				edgeMarkerRef.Disable()
			endif
			; adjacent build areas?
			if theBuildArea.AdjacentBuildAreaActivator
				debug.trace(self + " 	  found adjacent build area " + theBuildArea.AdjacentBuildAreaActivator)
				; if one is active, and one is not, need to enable/disable adjacent edge marker
				if ( theBuildArea.bActive && theBuildArea.AdjacentBuildAreaActivator.bActive == false )
					if aStart 
						debug.trace(self + " 	    adjacent build area inactive, enable " + theBuildArea.AdjacentBuildAreaEdge)
						theBuildArea.AdjacentBuildAreaEdge.Enable()
					else 
						debug.trace(self + " 	    adjacent build area inactive, disable " + theBuildArea.AdjacentBuildAreaEdge)
						theBuildArea.AdjacentBuildAreaEdge.Disable()
					endif
				endif
			endif
			; adjacent build areas?
			if theBuildArea.AdjacentBuildAreaActivator02
				debug.trace(self + " 	  found adjacent build area " + theBuildArea.AdjacentBuildAreaActivator02)
				; if one is active, and one is not, need to enable/disable adjacent edge marker
				if ( theBuildArea.bActive && theBuildArea.AdjacentBuildAreaActivator02.bActive == false )
					if aStart 
						debug.trace(self + " 	    adjacent build area inactive, enable " + theBuildArea.AdjacentBuildAreaEdge02)
						theBuildArea.AdjacentBuildAreaEdge02.Enable()
					else 
						debug.trace(self + " 	    adjacent build area inactive, disable " + theBuildArea.AdjacentBuildAreaEdge02)
						theBuildArea.AdjacentBuildAreaEdge02.Disable()
					endif
				endif
			endif

			i += 1
		endWhile 

		debug.trace(self + " OnWorkshopMode " + akSource + " " + aStart + ": DONE***************")
	endif
endEvent

; caravan events
Event WorkshopParentScript.WorkshopActorCaravanAssign(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + " WorkshopActorCaravanAssign")
	if (akArgs.Length > 0)
		WorkshopNPCScript caravanActor = akArgs[0] as WorkshopNPCScript
		WorkshopScript workshopRef = akArgs[1] as WorkshopScript
		if IsCaravanActorTargetingVault(caravanActor) 
			; add to override alias
			CaravanActorOverride.AddRef(caravanActor)
		endif		
	endif	
EndEvent

Event WorkshopParentScript.WorkshopActorCaravanUnassign(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + " WorkshopActorCaravanUnassign")
	if (akArgs.Length > 0)
		WorkshopNPCScript caravanActor = akArgs[0] as WorkshopNPCScript
		WorkshopScript workshopRef = akArgs[1] as WorkshopScript

		; if this actor is no longer targeting vault workshop, remove from alias
		if IsCaravanActorTargetingVault(caravanActor) == false
			int actorIndex = CaravanActorOverride.Find(caravanActor)
			if actorIndex > -1
				; remove from the collection
				CaravanActorOverride.RemoveRef(caravanActor)
			endif 
		endif
	endif	
EndEvent

; for mortality check from phoropter
Event Location.OnLocationLoaded(Location akSource)
	debug.trace(self + " OnLocationLoaded " + akSource)
    ; check for mortality
    WorkshopScript workshopRef = WorkshopParent.GetWorkshopFromLocation(akSource)
    if workshopRef
    	MortalityCheck(workshopRef)
    endif

EndEvent

function MortalityCheck(WorkshopScript workshopRef)
    if workshopRef
    	float mortalityChance = workshopRef.GetValue(DLC06WorkshopRatingMortalityChance)
    	if mortalityChance > 0
    		mortalityChance = Math.Min(MortalityCheckMaxPercent, mortalityChance)
    		debug.trace(self + " 	mortalityChance=" + mortalityChance)
    		float lastCheck = workshopRef.GetValue(DLC06WorkshopRatingMortalityChanceLastCheck)
    		float currentTime = Utility.GetCurrentGameTime()
    		float numberOfRolls = (currentTime - lastCheck) / MortalityCheckInterval
    		debug.trace(self + " 	numberOfRolls=" + numberOfRolls)
    		if numberOfRolls >= 1
				; time stamp this check
				workshopRef.SetValue(DLC06WorkshopRatingMortalityChanceLastCheck, currentTime)	
				int i = 0
				Actor deadPool
				; only kill 1 actor at a time
				while i < numberOfRolls && deadPool == NONE  		
	    			; roll for settler death - chance is for each settler
	    			int dieRoll = Utility.RandomInt()
		    		debug.trace(self + " 	dieRoll=" + dieRoll)
	    			if dieRoll <= mortalityChance 
	    				; kill someone
	    				ObjectReference[] workshopNPCs = WorkshopParent.GetWorkshopActors(workshopRef)
	    				int randomDeath = utility.RandomInt(0, workshopNPCs.Length -1)
	    				deadPool = workshopNPCs[randomDeath] as Actor
			    		debug.trace(self + " 	marked for death: " + deadPool)
	    				if deadPool && deadPool.IsEssential() == false && deadPool.Is3DLoaded()
	    					deadPool.SetProtected(false)
	    					deadPool.Kill()
	    				endif
	    			endif
	    			i += 1
	    		endWhile
    		endif
    	endif 
    endif
endFunction 


bool function IsCaravanActorTargetingVault(WorkshopNPCScript actorToCheck)
	; if this actor is no longer targeting vault workshop, remove from alias
	ObjectReference vaultCenterMarker = VaultWorkshop.GetLinkedRef(WorkshopParent.WorkshopLinkCenter)
	return ( actorToCheck.IsInFaction(WorkshopCaravanFaction) && ( actorToCheck.GetLinkedRef(WorkshopParent.WorkshopLinkCaravanStart) == vaultCenterMarker || actorToCheck.GetLinkedRef(WorkshopParent.WorkshopLinkCaravanEnd) == vaultCenterMarker ) )
endFunction 

function debugEnableAllBuildAreas()
	int i = 0
	while i < BuildAreas.Length 
		BuildAreaData theBuildArea = BuildAreas[i]
		AddBuildArea(theBuildArea.BuildAreaActivator)
		i += 1
	endWhile
endFunction

;*********** Overseer's Desk ***************

group OverseerDeskData
	ReferenceAlias Property Alias_Overseer Auto

	ReferenceAlias Property Alias_OverseerDesk Auto const Mandatory

	GlobalVariable Property DLC06OverseerDeskBuilt Auto Const Mandatory

	Form Property OverseerDeskBaseObject Auto

	Keyword Property DLC06WorkshopOverseerDeskKeyword auto const mandatory
endGroup

; custom event sent when raider settlement is created
CustomEvent DLC06OverseerDeskEvent

function AssignToDesk(WorkshopObjectScript newDesk)
	debug.trace(self + " AssignToDesk " + newDesk)
	WorkshopNPCScript overseer = Alias_Overseer.GetRef() as WorkshopNPCScript
	if newDesk
		; assign Overseer to the chair
		WorkshopParent.AssignActorToObjectPUBLIC(overseer, newDesk)		
	endif
endFunction 

Event ObjectReference.OnWorkshopObjectDestroyed(ObjectReference akSource, ObjectReference akActionRef)
	debug.trace(self + " OnWorkshopObjectDestroyed received")
	HandleWorkshopEvent(akSource as WorkshopScript, akActionRef, false)
EndEvent

Event ObjectReference.OnWorkshopObjectPlaced(ObjectReference akSource, ObjectReference akActionRef)
	debug.trace(self + " OnWorkshopObjectPlaced received")
	HandleWorkshopEvent(akSource as WorkshopScript, akActionRef, true)
EndEvent

function HandleWorkshopEvent(WorkshopScript workshopRef, ObjectReference akObject, bool bObjectBuilt)
	debug.trace(self + " HandleWorkshopEvent " + workshopRef + " " + akObject)
	if workshopRef == VaultWorkshop && akObject.HasKeyword(DLC06WorkshopOverseerDeskKeyword)
		if bObjectBuilt
			Alias_OverseerDesk.ForceRefTo(akObject)
			DLC06OverseerDeskBuilt.SetValueint(1)
			;AssignToDesk(akObject as WorkshopObjectScript)
		else
			Alias_OverseerDesk.Clear()
			DLC06OverseerDeskBuilt.SetValueint(0)
			;AssignToDesk(NONE)
		endif
		; send custom event
		Var[] kargs = new Var[0]
		SendCustomEvent("DLC06OverseerDeskEvent", kargs)		
	endif
endFunction

; generic barber/surgery
function StartGenericBarberSurgery(Actor akActor)
	WorkshopBarber.ForceRefTo(akActor)
endFunction