Scriptname DLC03:DLC03MQ06_WindFarmHandlingScript extends Quest Conditional

RefcollectionAlias Property FHNPCs Auto Mandatory
{RefCollection on MQ06_WindFarm quest that contains members of Far Harbor}

RefcollectionAlias Property FHInnNPCs Auto Mandatory
{RefCollection on MQ06_WindFarm quest that contains members of Far Harbor in the Last Plank}

RefcollectionAlias Property FarHarborFogCondensors Auto Mandatory
{RefCollection on MQ06_WindFarm quest that contains Far Harbor Settlement's fog condensors}

RefcollectionAlias Property FarHarborWorldFogCondensors Auto Mandatory
{RefCollection on MQ06_WindFarm quest that contains Far Harbor World's fog condensors}

RefcollectionAlias Property FHLastPlankAttackers Auto Mandatory
{RefCollection on MQ06_WindFarm quest that contains attackers spawned in Last Plank}

RefcollectionAlias Property FHAttackers Auto Mandatory
{RefCollection on MQ06_WindFarm quest that contains attackers spawned in Far Harbor town}

ReferenceAlias Property SmallBertha Auto Mandatory
{Reference for one of the kids in Far Harbor}

ReferenceAlias Property Tony Auto Mandatory
{Reference for other kid in Far Harbor}

ReferenceAlias Property OldLongfellow Auto Mandatory
{Reference for Old Longfellow}

ReferenceAlias Property FarHarborCat Auto Mandatory
{Reference for Far Harbor Cat}

ObjectReference Property FarHarborAttackFXMarker Auto Const Mandatory
{Marker responsible to handling the fire FX during the Far Harbor attack}

ObjectReference Property LastPlankAttackFXMarker Auto Const Mandatory
{Marker responsible to handling the fire FX in the Last Plank during the Far Harbor attack}

ObjectReference Property FarHarborLightsMarker Auto Const Mandatory
{Marker responsible to handling the town lights. Shut everything down once folks are out the door}

ObjectReference Property FarHarborAttackMarker Auto Const Mandatory
{Marker in Far Harbor to check to see if Far Harbor's loaded}

Location Property DLC03FarHarborSettlementLocation Auto Const Mandatory
{Far Harbor location object. Used to ensure we're not disabling/killing characters right in front of the player}

float Property fFarHarborKillTimer = 24.0 Auto Const
{Number of hours before everyone in Far Harbor is automatically killed}

float Property fFarHarborDisableTimer = 24.0 Auto Const
{Number of hours before everyone in Far Harbor is automatically turned off}

int Property iAveryExtortion = 0 Auto Conditional
{Number of successes for player while extorting Captain Avery}

ActorValue Property Confidence Auto Const Mandatory
{Used to keep Far Harbor folks from running away}

ActorValue Property Aggression Auto Const Mandatory
{Used to keep Far Harbor folks from running away}

;LOCAL VARS
int iFarHarborKillTimerID = 887 Const
;ID for Far Harbor kill timer

int iFarHarborDisableTimerID = 886 Const
;ID for Far Harbor disable body timer

bool bCheckForDisable = false
;Used to change the change locaiton event to start trying to disable the bodies in Far Harbor

bool bFarHarborFiresDisabled = false
;Ensure the final state change for Far Harbor is set

bool bFarHarborAttackersDisabled = false
;Ensure the Far Harbor attackers have been disabled

bool bFarHarborCitizensDead = false
;Used to stop processing is all citizens of Far Harbor are dead

Event OnQuestInit()
	;Roll through the Last Plank NPCs and add them to the general ref collection
	int i = 0
	int iCount = FHInnNPCs.GetCount()

	while i < iCount
		ObjectReference obj = FHInnNPCs.GetAt(i)

		FHNPCs.AddRef(obj)

		i += 1
	endwhile

	;Get all the Fog Condensors in Far Harbor into a single collection
   FarHarborFogCondensors.AddRefCollection(FarHarborWorldFogCondensors)

   ;Get all the attackers in a single collection
   FHAttackers.AddRefCollection(FHLastPlankAttackers)

EndEvent

Event OnTimerGameTime(int aiTimerID)
	;When enough time has passed, register player for Change Location event
	if aiTimerID == iFarHarborKillTimerID
		SetStage(100)
		RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")

		;Start up the timer to manage disabling the bodies
		StartTimerGameTime(fFarHarborDisableTimer, iFarHarborDisableTimerID)
	elseif aiTimerID == iFarHarborDisableTimerID
		
		;Have the player's change location event start trying to disable the bodies in Far Harbor
		bCheckForDisable = true
	endif
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	;Empty state definition
EndEvent

Auto State LocationCheckActive
	Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
		;Close off the location check until processing this one has completed
		GoToState("LocationCheckBusy")
		Actor PA = Game.GetPlayer()
		if akSender == PA && !PA.IsInLocation(DLC03FarHarborSettlementLocation) && akOldLoc != DLC03FarHarborSettlementLocation

			;Roll through FHNPC ref collection to see if NPCs have 3d. If they don't, kill/disable them, depending on 
			;how much time has passed
			int i = 0
			bool iActiveNPCs = false
			int iRefCount = FHNPCs.GetCount()

			debug.trace(self + "Begin Far Harbor Citizen Check. ")

			if !bCheckForDisable
				;If everyone's not already dead, check to kill them
				if !bFarHarborCitizensDead
					bool iLivingNPCs = false

					while i < iRefCount

						Actor act = (FHNPCs.GetAt(i) as Actor)

						;If 24 - 47 hours have passed, kill any living NPCs that aren't currently loaded
						;debug.trace(self + "Attempting to kill: " + act)
						if !act.Is3dLoaded() && !act.IsDead()
							act.Kill()
						endif
						
						if !iLivingNPCs && !act.IsDead()
							;debug.trace(self + "NPC still alive: " + act)
							iLivingNPCs = true
						endif

						i += 1
					endwhile

					;If everyone's dead, we don't need to process for this anymore
					if !iLivingNPCs
						;debug.trace(self + "All NPCs dead!")
						bFarHarborCitizensDead = true
					endif
				endif
			else
				while i < iRefCount

					Actor act = (FHNPCs.GetAt(i) as Actor)

					;If 48+ hours have passed, if any NPCs aren't disable, disable them if they're unloaded
					;debug.trace(self + "Attempting to disable: " + act)
					if !act.Is3dLoaded() && !act.IsDisabled()
						act.Disable()
					endif
		
					;debug.trace("Checking " + act+". IsEssential: " + act.IsEssential() + ". IsProtected: " + act.GetActorBase().IsProtected())
					if !iActiveNPCs && !act.IsDisabled()
						;debug.trace(self + "NPC still not disabled: " + act)
						iActiveNPCs = true
					endif

					i += 1
				endwhile

			endif

			;If the second timer has finished and all the NPCs in Far Harbor have been dealt with, attempt to disable the town attackers
			if bCheckForDisable && !iActiveNPCs
				int m = 0
				int iAttCount = FHAttackers.GetCount()
				bool bActiveAttackers = false

				while m < iAttCount
					Actor Att = (FHAttackers.GetAt(m) as Actor)

					if !Att.Is3dLoaded()
						Att.Disable()
					endif

					if !bActiveAttackers && !Att.IsDisabled()
						bActiveAttackers = true
					endif

					m += 1
				endwhile

				;All attackers disabled. Mark attackers cleared
				if !bActiveAttackers
					;debug.trace("All Far Harbor attackers disabled!")
					bFarHarborAttackersDisabled = true
				endif

				;Check to see if the Far Harbor marker isn't loaded. If is isn't, change town state
				if !bFarHarborFiresDisabled && !FarHarborAttackMarker.Is3dLoaded()
				
					;Toggle the destruction fires in Far Harbor off again		
					if FarHarborAttackFXMarker.IsDisabled()
						FarHarborAttackFXMarker.Enable()
					endif

					if LastPlankAttackFXMarker.IsDisabled()
						LastPlankAttackFXMarker.Enable()
					endif

					;And turn out the town's lights
					if !FarHarborLightsMarker.IsDisabled()
						FarHarborLightsMarker.Disable()
					endif

					if !LastPlankAttackFXMarker.IsDisabled() && !FarHarborAttackFXMarker.IsDisabled() && FarHarborLightsMarker.IsDisabled()
						;debug.trace("Far Harbor Fires okay to shut down!")
						bFarHarborFiresDisabled = true
					endif
				endif
			endif

			;If there are no active NPCs, our time has shut down and the final state change for Far Harbor is done, shut down
			if !iActiveNPCs && bCheckForDisable && bFarHarborFiresDisabled && bFarHarborAttackersDisabled
				debug.trace(self + "Shut everything down!")
				SetStage(1000)
			endif

	
		endif
		;If we aren't shut down, allow the location check to become active again
		GoToState("LocationCheckActive")
	EndEvent
EndState

State LocationCheckBusy
	Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
		;Do nothing
	EndEvent
EndState

Function TriggerFarHarborAttack()
	;Disable the kids and cat
	ObjectReference TonyRef =	Tony.GetRef()
	ObjectReference BerthaRef = SmallBertha.GetRef()
	ObjectReference CatRef = FarHarborCat.GetRef()

	if !CatRef.IsDisabled()
		CatRef.Disable()
	endif

	if !TonyRef.IsDisabled()
		TonyRef.Disable()
	endif

	if !BerthaRef.IsDisabled()
		BerthaRef.Disable()
	endif

	;Roll through all Fog Condensors in Far Harbor, shut them down
	int n = 0
	int iFCCount = FarHarborFogCondensors.GetCount()

	while n < iFCCount
		ObjectReference tmp = FarHarborFogCondensors.GetAt(n)

		(tmp as FogCondenserFurnitureScript).DestroyMe()

		n += 1
	endwhile

	int i = 0	
	int iRefCount = FHNPCs.GetCount()
	int iRand = 0
	while i < iRefCount

		Actor act = (FHNPCs.GetAt(i) as Actor)

		iRand = Utility.RandomInt(0, 1)

		;Randomly choose some unloaded folks to be dead. Otherwise, change their confidence/aggression to keep them fighting
		if iRand > 0 && !act.Is3dLoaded()
			;debug.trace(self + "Actor to kill: " + act)
			act.Kill()
		else
			act.SetValue(Confidence, 4)
			act.SetValue(Aggression, 1)
		endif

		i += 1
	endwhile

	;Enable attackers
	FHAttackers.EnableAll()

	;Toggle fire effects
	FarHarborAttackFXMarker.Disable()
	LastPlankAttackFXMarker.Disable()

	;Start countdown timer for Far Harbor shut down
	StartTimerGameTime(fFarHarborKillTimer, iFarHarborKillTimerID)
EndFunction