Scriptname WorkshopAddLocationsScript extends Quest

WorkshopParentScript property WorkshopParent auto const mandatory

RefCollectionAlias Property WorkshopsCollection Auto Const mandatory
{ pointer to ref collection of new workshops }

float property startingHappiness = 50.0 auto const

int property initializationIndex = -1 auto
{ this is a property so extended scripts can access if necessary }

int property InitializeDoneStage = 20 auto const
{ stage set when all new locations have been initialized }

Event OnQuestInit()
	; create array to pass to WorkshopParent
	WorkshopScript[] newWorkshops = new WorkshopScript[0]
	int i = 0
	while i < WorkshopsCollection.GetCount()
		WorkshopScript theWorkshop = WorkshopsCollection.GetAt(i) as WorkshopScript
		if theWorkshop
			newWorkshops.Add(theWorkshop)
		endif
		i += 1
	endWhile

	; add new workshops to main workshop arrays
	if WorkshopParent.ReinitializeLocationsPUBLIC(newWorkshops, self) == false
		; no locations to initialize - we're done (otherwise we wait for WorkshopInitializeLocation event sequence to complete)
		setStage(InitializeDoneStage)
	endif

	OnQuestInitCustom()
endEvent

; empty function for extended scripts to override
function OnQuestInitCustom()
endFunction

; NOTE: This mostly replicates the initialization process on main WorkshopParentScript
; modified here so that each DLC can handle initialization of its own locations separately

; BEGIN Initialize process code:

function InitializeLocation(WorkshopScript workshopRef, RefCollectionAlias SettlementNPCs, ReferenceAlias theLeader, ReferenceAlias theMapMarker)
	debug.trace(self + " Initializing location START: " + workshopRef.myLocation)

	; create local pointer to WorkshopRatings array to speed things up
	WorkshopDataScript:WorkshopRatingKeyword[] ratings = WorkshopParent.WorkshopRatings

	workshopRef.myMapMarker = theMapMarker.GetRef()

	; force recalc (unloaded workshop)
	workshopRef.RecalculateWorkshopResources(true)
	
	int workshopRatingPopulation = WorkshopParent.WorkshopRatingPopulation
	int initPopulation = workshopRef.GetBaseValue(ratings[WorkshopRatingPopulation].resourceValue) as int
	int initPopulationVal = workshopRef.GetValue(ratings[WorkshopRatingPopulation].resourceValue) as int
	debug.trace(self + " 		initPopulation (before)=" + initPopulation)
	debug.trace(self + " 		initPopulationVal (before)=" + initPopulationVal)
	if SettlementNPCs
		WorkshopParent.AddCollectionToWorkshopPUBLIC(SettlementNPCs, workshopRef, true)
	endif
	if theLeader && theLeader.GetActorRef()
		WorkshopParent.AddActorToWorkshopPUBLIC(theLeader.GetActorRef() as WorkshopNPCScript, workshopRef, true)
	endif 

	initPopulation = workshopRef.GetBaseValue(ratings[WorkshopRatingPopulation].resourceValue) as int
	initPopulationVal = workshopRef.GetValue(ratings[WorkshopRatingPopulation].resourceValue) as int
	debug.trace(self + " 		initPopulation (after)=" + initPopulation)
	debug.trace(self + " 		initPopulationVal (before)=" + initPopulationVal)
	int robotPopulation = 0
	if workshopRef.myLocation.HasKeyword(WorkshopParent.LocTypeWorkshopRobotsOnly)
		; this means everyone here (at game start) is a robot
		robotPopulation = initPopulation
	endif
	WorkshopParent.ModifyResourceData(ratings[WorkshopParent.WorkshopRatingPopulationRobots].resourceValue, workshopRef, robotPopulation)

	; initialize ratings if it has population
	if initPopulation > 0
		debug.trace(self + " 		init population = " + initPopulation)
		; happiness
		WorkshopParent.SetResourceData(ratings[WorkshopParent.WorkshopRatingHappiness].resourceValue, workshopRef, startingHappiness)
		; set food, water, beds equal to population (this will be corrected to reality the first time the player visits the location)
		WorkshopParent.SetResourceData(ratings[WorkshopParent.WorkshopRatingFood].resourceValue, workshopRef, initPopulation)
		WorkshopParent.SetResourceData(ratings[WorkshopParent.WorkshopRatingWater].resourceValue, workshopRef, initPopulation)
		WorkshopParent.SetResourceData(ratings[WorkshopParent.WorkshopRatingBeds].resourceValue, workshopRef, initPopulation - robotPopulation)
		; set "last attacked" to a very large number (so they don't act like they were just attacked)
		WorkshopParent.SetResourceData(ratings[WorkshopParent.WorkshopRatingLastAttackDaysSince].resourceValue, workshopRef, 99)
	endif

	InitializeLocationCustom()

	debug.trace(self + " Initializing location DONE: " + workshopRef.myLocation + ": population=" + initPopulation)

	; send "done" event
	Var[] kargs = new Var[1]
	kargs[0] = workshopRef
	debug.trace(self + " 	sending WorkshopInitializeLocation event")
	WorkshopParent.SendCustomEvent("WorkshopInitializeLocation", kargs)		
endFunction

; empty function for extended scripts to override
function InitializeLocationCustom()
endFunction


Event WorkshopParentScript.WorkshopInitializeLocation(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + "WorkshopInitializeLocation event received " + initializationIndex)
	WorkshopScript nextWorkshopRef = NONE
	if (akArgs.Length > 0)
		WorkshopScript workshopRef = akArgs[0] as WorkshopScript
		if workshopRef
			; this is the location that was just initialized - find the next
			if initializationIndex == -1
				; start with the next one if this is the first
				initializationIndex = workshopRef.GetWorkshopID() + 1
			else
				; otherwise, just go to next in array
				initializationIndex += 1
			endif

			int newWorkshopIndex = initializationIndex
			if newWorkshopIndex >= WorkshopParent.Workshops.Length
				debug.trace(self + " WorkshopInitializeLocation: Finished all locations")

				setStage(InitializeDoneStage) ; way to easily track when this is done
			else
				debug.trace(self + " 	workshop done: " + workshopRef.myLocation + "(" + workshopRef.GetWorkshopID() + ")")
				; send story event for next workshop location
				nextWorkshopRef = WorkshopParent.workshops[newWorkshopIndex]
			endif

		else
			debug.trace(self + " WARNING: WorkshopInitializeLocation event received with invalid args")
		endif
	else
		debug.trace(self + " 	ERROR: No parameters- something went wrong")
	endif

	; send event if we found next workshop
	if nextWorkshopRef
		debug.trace(self + " 	send story event for next workshop: " + nextWorkshopRef.myLocation + "(" + nextWorkshopRef.GetWorkshopID() + ")")
		; wait a bit for quest to finish shutting down
		int maxWait = 5
		int i = 0
		while i < maxWait && WorkshopParent.WorkshopInitializeLocation.IsStopped() == false
			debug.trace(self + "	waiting for WorkshopInitializeLocation to shut down..." + i)
			utility.wait(1.0)
			i += 1
		endWhile
		bool bSuccess = WorkshopParent.WorkshopEventInitializeLocation.SendStoryEventAndWait(nextWorkshopRef.myLocation)
		if !bSuccess
			; quest failed to start for this location - skip it and move on
			debug.trace(self + "	WARNING: WorkshopInitializeLocation quest failed to start for " + nextWorkshopRef.myLocation)
			; send "done" event
			Var[] kargs = new Var[1]
			kargs[0] = nextWorkshopRef
			debug.trace(self + " 	sending WorkshopInitializeLocation event")
			WorkshopParent.SendCustomEvent("WorkshopInitializeLocation", kargs)		
		endif
	endif
EndEvent

; END Initialize process code:
