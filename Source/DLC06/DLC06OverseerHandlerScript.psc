Scriptname DLC06:DLC06OverseerHandlerScript extends Quest Conditional
{ This script handles the Overseer Personnel Terminal for DLC06 }

ObjectReference Property CurrentWorkshop Auto

Faction Property workshopCaravanFaction Auto Const Mandatory
Keyword Property WorkshopWorkObject Auto Const Mandatory

ActorValue Property Food Auto Const Mandatory
ActorValue Property WorkshopRatingScavengeGeneral Auto Const Mandatory
ActorValue Property Safety Auto Const Mandatory
ActorValue Property vendorIncome Auto Const Mandatory

GlobalVariable Property DLC06WorkshopCountNone Auto Const Mandatory
GlobalVariable Property DLC06WorkshopCountFarmers Auto Const Mandatory
GlobalVariable Property DLC06WorkshopCountScavengers Auto Const Mandatory
GlobalVariable Property DLC06WorkshopCountVendorArmor Auto Const Mandatory
GlobalVariable Property DLC06WorkshopCountVendorBar Auto Const Mandatory
GlobalVariable Property DLC06WorkshopCountVendorClothing Auto Const Mandatory
GlobalVariable Property DLC06WorkshopCountVendorDoctor Auto Const Mandatory
GlobalVariable Property DLC06WorkshopCountVendorJunk Auto Const Mandatory
GlobalVariable Property DLC06WorkshopCountVendorWeapons Auto Const Mandatory
GlobalVariable Property DLC06WorkshopCountGuard Auto Const Mandatory
GlobalVariable Property DLC06WorkshopCountCaravan Auto Const Mandatory

WorkshopParentScript Property WorkshopParent Auto Const mandatory
{ parent quest - holds most general workshop properties }

ActorValue[] Property WorkshopRatingValues Auto

Group WorkshopActors
	ObjectReference[] Property ActorsAll auto hidden
	ObjectReference[] Property ActorsNone auto hidden
	ObjectReference[] Property ActorsFarmers auto hidden
	ObjectReference[] Property ActorsScavengers auto hidden
	ObjectReference[] Property ActorsGuards auto hidden
	ObjectReference[] Property ActorsCaravaners auto hidden
	ObjectReference[] Property ActorsVendorArmor auto hidden
	ObjectReference[] Property ActorsVendorBar auto hidden
	ObjectReference[] Property ActorsVendorClothing auto hidden
	ObjectReference[] Property ActorsVendorDoctor auto hidden
	ObjectReference[] Property ActorsVendorJunk auto hidden
	ObjectReference[] Property ActorsVendorWeapons auto hidden
	ObjectReference[] Property ActorsMisc auto hidden
endGroup

Group WorkshopObjects
	ObjectReference[] Property ObjectsFarmers auto
	ObjectReference[] Property ObjectsScavengers auto
	ObjectReference[] Property ObjectsGuards auto
	ObjectReference[] Property ObjectsVendorArmor auto
	ObjectReference[] Property ObjectsVendorBar auto
	ObjectReference[] Property ObjectsVendorClothing auto
	ObjectReference[] Property ObjectsVendorDoctor auto
	ObjectReference[] Property ObjectsVendorJunk auto
	ObjectReference[] Property ObjectsVendorWeapons auto
endGroup

Group WorkshopAvailable
	Int Property WorkshopUnownedFood Auto Conditional
	Int Property WorkshopUnownedScavenge Auto Conditional
	Int Property WorkshopUnownedDefense Auto Conditional
	Int Property WorkshopUnownedVendorArmor Auto Conditional
	Int Property WorkshopUnownedVendorBar Auto Conditional
	Int Property WorkshopUnownedVendorClothing Auto Conditional
	Int Property WorkshopUnownedVendorDoctor Auto Conditional
	Int Property WorkshopUnownedVendorJunk Auto Conditional
	Int Property WorkshopUnownedVendorWeapons Auto Conditional
endGroup

Event OnQuestInit()

	FillVariables()

EndEvent

; VALUES FOR JOBS
; 0 - None
; 1 - Farmers
; 2 - Scavengers
; 3 - Guards
; 4 - Caravans
; 5 - Armorer
; 6 - Bar
; 7 - Clothing
; 8 - Doctor
; 9 - Junk
; 10 - Weapons
Group InternalTracking
	Int Property nCurrentJob Auto Conditional
	Int Property nNewJob Auto Conditional
	Int Property nNewJobOpenings Auto Conditional
	ObjectReference[] Property oCurrentPeople Auto
EndGroup

Function FillVariables(objectReference akTerminalRef = NONE)
	debug.trace(self + " FillVariables:")
;Function FillVariables()

	CurrentWorkshop = WorkshopParent.GetWorkshop((akTerminalREF as WorkshopObjectScript).WorkshopID)

	ActorsAll.Clear()
	ActorsAll = CurrentWorkshop.GetWorkshopResourceObjects(WorkshopParent.WorkshopRatingValues[2])

	ActorsNone.Clear()
	ActorsFarmers.Clear()
	ActorsScavengers.Clear()
	ActorsGuards.Clear()
	ActorsCaravaners.Clear()
	ActorsVendorArmor.Clear()
	ActorsVendorBar.Clear()
	ActorsVendorClothing.Clear()
	ActorsVendorDoctor.Clear()
	ActorsVendorJunk.Clear()
	ActorsVendorWeapons.Clear()
	ActorsMisc.Clear()

	ObjectsFarmers.Clear()
	ObjectsScavengers.Clear()
	ObjectsGuards.Clear()
	ObjectsVendorArmor.Clear()
	ObjectsVendorBar.Clear()
	ObjectsVendorClothing.Clear()
	ObjectsVendorDoctor.Clear()
	ObjectsVendorJunk.Clear()
	ObjectsVendorWeapons.Clear()

	oCurrentPeople.Clear()

	WorkshopUnownedFood = 0
	WorkshopUnownedScavenge = 0
	WorkshopUnownedDefense = 0
	WorkshopUnownedVendorArmor = 0
	WorkshopUnownedVendorBar = 0
	WorkshopUnownedVendorClothing = 0
	WorkshopUnownedVendorDoctor = 0
	WorkshopUnownedVendorJunk = 0
	WorkshopUnownedVendorWeapons = 0	

	int i = 0
	while i < ActorsAll.Length
		WorkshopNPCScript theActor = ActorsAll[i] as WorkShopNPCScript
		if theActor
			debug.trace(self + "FillVariables: checking " + theActor)
			if ( theActor.IsInFaction(workshopCaravanFaction) )		; If they are in this faction, they're caravan folk
				debug.trace(self + "FillVariables:    adding " + theActor + " to ActorsCaravaners array")
				ActorsCaravaners.Add(theActor)
			elseif ( theActor.bIsWorker == FALSE ) 
				; need some additional checks before we assign them as unemployed:
				if ( theActor.bCommandable && theActor.bWorkshopStatusOn )
					debug.trace(self + "FillVariables:    adding " + theActor + " to ActorsNone array")
					ActorsNone.Add(theActor)
				else 
					debug.trace(self + "FillVariables:    SKIPPING " + theActor + " - either not commandable or workshop status is off")
				endif
			endif
		endif
		i += 1
	endWhile

	; Get all of the resources objects and then count what's unowned (and also assign Workshop actors to their respective buckets)
	ObjectReference[] PotentialFood = CurrentWorkshop.GetWorkshopResourceObjects(Food)
	WorkshopUnownedFood = CountUnowned(PotentialFood, ActorsFarmers, ObjectsFarmers)

	ObjectReference[] PotentialScavenge = CurrentWorkshop.GetWorkshopResourceObjects(WorkshopRatingScavengeGeneral)
	WorkshopUnownedScavenge = CountUnowned(PotentialScavenge, ActorsScavengers, ObjectsScavengers)

	ObjectReference[] PotentialDefense = CurrentWorkshop.GetWorkshopResourceObjects(Safety)
	WorkshopUnownedDefense = CountUnowned(PotentialDefense, ActorsGuards, ObjectsGuards)

	ObjectReference[] PotentialStores = CurrentWorkshop.GetWorkshopResourceObjects(VendorIncome)
	CountVendors(PotentialStores)
	
	DLC06WorkshopCountNone.SetValue(ActorsNone.Length)
	DLC06WorkshopCountFarmers.SetValue(ActorsFarmers.Length)
	DLC06WorkshopCountScavengers.SetValue(ActorsScavengers.Length)
	DLC06WorkshopCountGuard.SetValue(ActorsGuards.Length)
	DLC06WorkshopCountCaravan.SetValue(ActorsCaravaners.Length)
	DLC06WorkshopCountVendorArmor.SetValue(ActorsVendorArmor.Length)
	DLC06WorkshopCountVendorBar.SetValue(ActorsVendorBar.Length)
	DLC06WorkshopCountVendorClothing.SetValue(ActorsVendorClothing.Length)
	DLC06WorkshopCountVendorDoctor.SetValue(ActorsVendorDoctor.Length)
	DLC06WorkshopCountVendorJunk.SetValue(ActorsVendorJunk.Length)
	DLC06WorkshopCountVendorWeapons.SetValue(ActorsVendorWeapons.Length)

	if ( akTerminalRef )	; If a terminal was selected then put in tokens
		akTerminalRef.AddTextReplacementData("ClassNone", DLC06WorkshopCountNone)	
		akTerminalRef.AddTextReplacementData("ClassFarmers", DLC06WorkshopCountFarmers)	
		akTerminalRef.AddTextReplacementData("ClassScavengers", DLC06WorkshopCountScavengers)	
		akTerminalRef.AddTextReplacementData("ClassGuard", DLC06WorkshopCountGuard)	
		akTerminalRef.AddTextReplacementData("ClassCaravan", DLC06WorkshopCountCaravan)	
		akTerminalRef.AddTextReplacementData("ClassArmor", DLC06WorkshopCountVendorArmor)	
		akTerminalRef.AddTextReplacementData("ClassBar", DLC06WorkshopCountVendorBar)	
		akTerminalRef.AddTextReplacementData("ClassClothing", DLC06WorkshopCountVendorClothing)	
		akTerminalRef.AddTextReplacementData("ClassDoctor", DLC06WorkshopCountVendorDoctor)	
		akTerminalRef.AddTextReplacementData("ClassJunk", DLC06WorkshopCountVendorJunk)	
		akTerminalRef.AddTextReplacementData("ClassWeapons", DLC06WorkshopCountVendorWeapons)	
	endif
 
EndFunction

; ArrayStorage = array of actors
int Function CountUnowned(ObjectReference[] WorkshopResources, ObjectReference[] ArrayStorage, ObjectReference[] ObjectStorage)
	Actor aTarg
	int iCount = 0
	int iRunningTotal = 0

	while iCount < WorkshopResources.length
		aTarg = WorkshopResources[iCount].GetActorRefOwner()
	   	if ( aTarg == NONE && WorkshopResources[iCount].HasKeyword(WorkshopWorkObject) )
	    	iRunningTotal += 1
	    	ObjectStorage.Add(WorkshopResources[iCount])
	    elseif ( aTarg != NONE && !aTarg.IsDead() )   ; If there is a living valid owner (thus a settler)
			; If the actor isn't in the array, add him there
	   		if ( !CommonArrayFunctions.CheckObjectReferenceAgainstArray(aTarg, ArrayStorage) )
	   			ArrayStorage.Add(aTarg)
	   		endif
	   	endif
	   	iCount += 1
	endwhile

	return iRunningTotal	
EndFunction

Function CountVendors(ObjectReference[] WorkshopResources)
	int iCount
	int iInternalCounter

	int iVendorType

	while iCount < WorkshopResources.length
		iVendorType = (WorkshopResources[iCount] as WorkshopObjectScript).VendorType

		if ( iVendorType == 0 )			; 0 is for Misc Vendor (Junk)
			iInternalCounter = VendorSorting(WorkshopResources, iCount, ActorsVendorJunk, ObjectsVendorJunk)
			WorkshopUnownedVendorJunk += iInternalCounter
		elseif ( iVendorType == 1 )		; 1 is for Armor
			iInternalCounter = VendorSorting(WorkshopResources, iCount, ActorsVendorArmor, ObjectsVendorArmor)
			WorkshopUnownedVendorArmor += iInternalCounter
		elseif ( iVendorType == 2 )		; 2 is for Weapons
			iInternalCounter = VendorSorting(WorkshopResources, iCount, ActorsVendorWeapons, ObjectsVendorWeapons)
			WorkshopUnownedVendorWeapons += iInternalCounter
		elseif ( iVendorType == 3 )		; 3 is for Bar
			iInternalCounter = VendorSorting(WorkshopResources, iCount, ActorsVendorBar, ObjectsVendorBar)
			WorkshopUnownedVendorBar += iInternalCounter
		elseif ( iVendorType == 4 )		; 4 is for Clinic/Doctor
			iInternalCounter = VendorSorting(WorkshopResources, iCount, ActorsVendorDoctor, ObjectsVendorDoctor)
			WorkshopUnownedVendorDoctor += iInternalCounter
		elseif ( iVendorType == 5 )		; 5 is for Clothing
			iInternalCounter = VendorSorting(WorkshopResources, iCount, ActorsVendorClothing, ObjectsVendorClothing)
			WorkshopUnownedVendorClothing += iInternalCounter
		endif 

	   	iCount += 1
	endwhile

EndFunction

Int Function VendorSorting(ObjectReference[] WorkshopResources, int iCount, ObjectReference[] ActorArray, ObjectReference[] ObjectArray)
	int iReturn = 0
	Actor aTarg = WorkshopResources[iCount].GetActorRefOwner()

	if (aTarg == NONE )     
		ObjectArray.Add(WorkshopResources[iCount])
		iReturn = 1
	else
		if ( !CommonArrayFunctions.CheckObjectReferenceAgainstArray(aTarg, ActorArray) )
			ActorArray.Add(aTarg)
		endif
	endif

	return iReturn
EndFunction

; This passes to the script which class of people is currently being moved around
Function CurrentJob(int nJob)
	nCurrentJob = nJob	

	; Grab the collection of people that may be moved
	if ( nJob == 0 )	
		oCurrentPeople = ActorsNone
	ElseIf ( nJob == 1 )
		oCurrentPeople = ActorsFarmers
	ElseIf ( nJob == 2 )
		oCurrentPeople = ActorsScavengers
	ElseIf ( nJob == 3 )
		oCurrentPeople = ActorsGuards
	ElseIf ( nJob == 4 )
		oCurrentPeople = ActorsCaravaners
	ElseIf ( nJob == 5 )
		oCurrentPeople = ActorsVendorArmor
	ElseIf ( nJob == 6 )
		oCurrentPeople = ActorsVendorBar
	ElseIf ( nJob == 7 )
		oCurrentPeople = ActorsVendorClothing
	ElseIf ( nJob == 8 )
		oCurrentPeople = ActorsVendorDoctor
	ElseIf ( nJob == 9 )
		oCurrentPeople = ActorsVendorJunk
	ElseIf ( nJob == 10 )
		oCurrentPeople = ActorsVendorWeapons
	endif
EndFunction

; This passes to the script what's the destination job
Function NewJob(int nJob)
	nNewJob = nJob

	Debug.Trace(self + ": NewJob was passed " + nJob)

	if ( nJob == 1 )
		nNewJobOpenings = WorkshopUnownedFood
	elseif ( nJob == 2 )
		nNewJobOpenings = WorkshopUnownedScavenge
	elseif ( nJob == 3 )
		nNewJobOpenings = WorkshopUnownedDefense
	elseif ( nJob == 5 )
		nNewJobOpenings = WorkshopUnownedVendorArmor
	elseif ( nJob == 6 )
		nNewJobOpenings = WorkshopUnownedVendorBar
	elseif ( nJob == 7 )
		nNewJobOpenings = WorkshopUnownedVendorClothing
	elseif ( nJob == 8 )
		nNewJobOpenings = WorkshopUnownedVendorDoctor
	elseif ( nJob == 9 )
		nNewJobOpenings = WorkshopUnownedVendorJunk
	elseif ( nJob == 10 )
		nNewJobOpenings = WorkshopUnownedVendorWeapons
	endif

	Debug.Trace(self + ": NewJob has nNewJobOpenings at " + nNewJobOpenings)

	; Only allow legal numbers of people to be moved
	if ( nNewJobOpenings > oCurrentPeople.Length )
		nNewJobOpenings = oCurrentPeople.length
	endif

	Debug.Trace(self + ": NewJob has nNewJobOpenings at " + nNewJobOpenings)

	if ( nJob == 99 )
		nNewJobOpenings = oCurrentPeople.length		; If you're firing people, you can fire everyone
	endif

EndFunction


; This is the function that actually assigns jobs
Function AssignJob(int nNumberOfPeople, objectReference akTerminalRef = NONE)

	ObjectReference[] oWorkStations

	if ( nNewJob == 1 )
		oWorkStations = ObjectsFarmers
	ElseIf ( nNewJob == 2 )
		oWorkStations = ObjectsScavengers
	ElseIf ( nNewJob == 3 )
		oWorkStations = ObjectsGuards
	ElseIf ( nNewJob == 5 )
		oWorkStations = ObjectsVendorArmor
	ElseIf ( nNewJob == 6 )
		oWorkStations = ObjectsVendorBar
	ElseIf ( nNewJob == 7 )
		oWorkStations = ObjectsVendorClothing
	ElseIf ( nNewJob == 8 )
		oWorkStations = ObjectsVendorDoctor
	ElseIf ( nNewJob == 9 )
		oWorkStations = ObjectsVendorJunk
	ElseIf ( nNewJob == 10 )
		oWorkStations = ObjectsVendorWeapons
	EndIf

	int iCount = 0
	int nPeopleMoving = nNumberOfPeople
	if ( nNumberOfPeople == 99 )   ; This means you're moving all of them
		if ( nNewJob == 99 )   ; Are you firing them?
			nPeopleMoving = oCurrentPeople.Length
		elseif ( oCurrentPeople.Length < oWorkStations.Length )
			nPeopleMoving = oCurrentPeople.Length
		else
			nPeopleMoving = oWorkStations.Length
		endif
	endif

	Debug.Trace(self + "AssignJob: Assigning " + nPeopleMoving + " jobs")

	; Then iterate through and assign everyone
	while iCount < nPeopleMoving
		WorkshopNPCScript theNPC = oCurrentPeople[iCount]as WorkshopNPCScript
		if theNPC && theNPC.bCommandable && theNPC.bWorkshopStatusOn
			if ( nNewJob == 99 )		; This means they're being fired
				Debug.Trace(self + "AssignJob: Unassigning " + theNPC)
				WorkshopParent.UnassignActor(theNPC)
			Else 						; Otherwise give them the new job
				WorkshopObjectScript theWorkshopObject = (oWorkStations[iCount] as WorkshopObjectScript)
				Debug.Trace(self + "AssignJob: Assigning " + iCount + ": " + theNPC + " to " + theWorkshopObject)
				WorkshopParent.AssignActorToObjectPUBLIC(theNPC, theWorkshopObject, TRUE )
			endif
		else 
			Debug.Trace(self + "AssignJob: " + theNPC + " is invalid: bCommandable=" + theNPC.bCommandable + ", bWorkshopStatusOn=" + theNPC.bWorkshopStatusOn)
		endif
	   	iCount += 1
	endwhile
	
	if ( nNewJob == (1 || 3) )   ; If you're a farmer or guard, fill up the rest of the work objects
		WorkshopParent.TryToAssignResourceObjectsPUBLIC(CurrentWorkshop as WorkshopScript)
	endif

	FillVariables(akTerminalRef)	; Then refresh everything afterwards

EndFunction

