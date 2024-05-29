Scriptname DLC04:DLC04RaidParentScript extends Quest Conditional

LocationAlias Property myLocation Auto Const Mandatory
{Alias for target settlements's location}

ReferenceAlias Property Workshop Auto Const Mandatory
{Alias for target settlements's workshop}

ReferenceAlias Property Shank Auto Const Mandatory
{Reference alias for Shank}

ReferenceAlias Property MapMarker Auto Const Mandatory
{Alias for target settlements's map marker}

ActorValue Property Safety Auto Const Mandatory
{Workshop safety value}

ActorValue Property DLC04PlayerAttemptedIntimidate Auto Const Mandatory
{Actor value for NPCs who player has attempted to intimidate}

Keyword Property WorkshopItemKeyword Auto Const Mandatory
{Workshop object linked ref keyword}

int Property iDefenderCount = 0 Auto Conditional
{int to handle how many defenders are present. Used for line variations in intial scene}

int Property iChosenGang = 0 Auto Conditional
{int to track which gang we're doing this with}

float Property iIntimidateValue = 0.0 Auto Conditional
{int to track the player's reputation. Calculated on:
1. Start of quest
2. When the player starts the convo with this settler
3. When player successfully succeeds in early speech challenge with NPC

Value are equivalent to:
0 <= - Hard speech challenge, 1000 cap buyout
5 - Medium, 500 cap buyout
15 - Easy, 200 cap buyout
20 - Always succeeds, 50 cap buyout}

int Property iIntimidateSuccesses = 0 Auto Conditional
{Player successfully intimidated an NPC in the initial conversation. Make convincing the NPCs easier to run off}

int Property iRaiderRadioBeaconCount = 0 Auto Conditional
{Number of raider radio beacons nearby. Passed in from TrackNearbyOutposts script and used to cal intimidation value}

int Property iCapsBuyoutLevel = 0 Auto Conditional
{int used to track how many caps the player needs to have in order to buy out this location}

int Property iRaiderSettlementCount = 0 Auto Conditional
{Int to track how many Raider settlements are near target location}

GlobalVariable Property DLC04IntimidationSuccessValue Auto Const Mandatory
{How much nearby raider settlements add to value}

GlobalVariable Property DLC04IntimidationGasValue Auto Const Mandatory
{How much intimidation grenade effect adds to value}

GlobalVariable Property DLC04IntimidateMediumChallengeThreshold Auto Const Mandatory
{Intimidation score required for medium speech challenge}

GlobalVariable Property DLC04IntimidateEasyChallengeThreshold Auto Const Mandatory
{Intimidation score required for easy speech challenge}

GlobalVariable Property DLC04IntimidateAlwaysSucceedsChallengeThreshold Auto Const Mandatory
{Intimidation score required for always succeeds speech challenge}

GlobalVariable Property DLC04RaidVassalDistance Auto Const Mandatory
{Distance used to calc effect of nearby Raider settlements for intimidation}

GlobalVariable Property DLC04IntimidationNearbySettlementValue Auto Const Mandatory
{How much nearby raider settlements add to value}

GlobalVariable Property DLC04IntimidationRadioBeaconValue Auto Const Mandatory
{How much nearby raider radio beacons add to value}

GlobalVariable Property DLC04IntimidateReductionMaxThreshold Auto Const Mandatory
{The max penalty intimidation checks will take}

MagicEffect Property DLC04IntimidationGrenadeEffect Auto Const Mandatory
{Intimidation magic effect. Used to improve player's chances of intimidating local settlements}

Message Property DLC04RaidChaseOffIntimidationSuccessfulMessage Auto Const Mandatory
{Message to inform the player if the location is now easier to intimidate than it was previously}

Message Property DLC04RaidChaseOffIntimidationHarderMessage Auto Const Mandatory
{Message to inform the player if the location is now harder to intimidate than it was previously}

Message Property DLC04RaidChaseOffIntimidationPositiveProgressMessage Auto Const Mandatory
{Message to inform the player if the location is now more intimidated than it was previously}

Message Property DLC04RaidChaseOffIntimidationNegativeProgressMessage Auto Const Mandatory
{Message to inform the player if the location is now less intimidated than it was previously}

Message Property DLC04RaidChaseOffMaxIntimidationMessage Auto Const Mandatory
{Message to inform the player they've reached the peak intimidation level for this location}

Message Property DLC04RaidCoerceIntimidationSuccessfulMessage Auto Const Mandatory
{Message to inform the player if the location is now easier to intimidate than it was previously}

Message Property DLC04RaidCoerceIntimidationHarderMessage Auto Const Mandatory
{Message to inform the player if the location is now harder to intimidate than it was previously}

Message Property DLC04RaidCoerceIntimidationPositiveProgressMessage Auto Const Mandatory
{Message to inform the player if the location is now more intimidated than it was previously}

Message Property DLC04RaidCoerceIntimidationNegativeProgressMessage Auto Const Mandatory
{Message to inform the player if the location is now less intimidated than it was previously}

Message Property DLC04RaidCoerceMaxIntimidationMessage Auto Const Mandatory
{Message to inform the player they've reached the peak intimidation level for this location}

bool Property bCalculatingIntimidation = false Auto Conditional
{Boolean to let game know if intimidation is being calculated}

bool Property bIntimidationResolved = false Auto Conditional
{Boolean to let game know that the intimidation sequence has been resolved, so we don't care about additional messages}

bool Property bRaidActive = false Auto Conditional
{Bool used to track if this or any of the raids are active (to turn Shank's QT in DLC04 on and off)}

RefCollectionAlias Property NearbyRaiderWorkshops Auto Const
{Ref collection of nearby Raider workshops (used to determine intimidation value)}

ReferenceAlias Property SettlementSpokesperson Auto Const
{Alias for settlement spoeksperson (used to check them for intimidate grenade effect)}

ActorValue Property WorkshopRatingPopulation Auto Const Mandatory
{Workshop population value}

ActorValue Property Health Auto Const Mandatory
{Health actor value}

int Property iCurrentRaidIndex Auto Conditional
{Index for the current raid (used to know which intimidation messages to show):
1 - Chase off
2 - Wipe Out
3 - Coerce
4 - Subdue}

GlobalVariable Property DLC04RaidDefenderQTThreshold Auto Const Mandatory
{The number of defenders that need to be remaining before the QTs show up over them in attack missions}

Location Property TheSlogLocation Auto Const Mandatory
{The Slog location (used to see if the player is targeting the Slog so we can have Arlen Glass react to player's actions)}

Quest Property DN154 Auto Const Mandatory
{Quest used to know state of Arlen Glass' quest}

ReferenceAlias Property ArlenGlass Auto Const Mandatory
{Reference alias for Arlen Glass. Used to add him to attacks}

Scene Property DN154_Arlen_000_WorkingLoop Auto Const Mandatory
{Arlen Glass' work scene. Used to kill scene if he's dismissed via Chase Off quest}

bool Property bArlenGlassActive = false Auto Conditional
{bool used to track if Arlen Glass is active during this quest}

Faction Property DLC04GangDisciplesFaction Auto Const Mandatory
{Disciples crime faction}

Faction Property DLC04GangOperatorsFaction Auto Const Mandatory
{Operators crime faction}

Faction Property DLC04GangPackFaction Auto Const Mandatory
{Pack crime faction}

Faction Property fcSettlementFaction Auto
{Local workshop faction}

GlobalVariable Property DLC04MQ04FinalOutpostsCount Auto Mandatory
{Global used to track the state of the final MQ04 objective}

Quest Property DLC04MQ04 Auto Const Mandatory
{DLC04MQ04 quest}

DLC04WorkshopParentScript Property DLC04WorkshopParent Auto Const Mandatory
{DLC04 Workshop parent quest}

bool Property bDisabledMapMarker = false Auto Conditional
{Flag used to know if settlement map marker has been toggled on or off}

WorkshopParentScript Property WorkshopParent Auto Const Mandatory
{Workshop Parent quest script}

float Property iStartupFailSafeTimerLength = 3.0 Auto Const
{How long scene failsafe timer should wait between checks}

;Local vars
float fDLC04IntimidationNearbySettlementValue = 0.0
float fDLC04IntimidationRadioBeaconValue = 0.0
float fDLC04IntimidationGasValue = 0.0
float fDLC04IntimidationSuccessValue = 0.0
float fDLC04IntimidateAlwaysSucceedsChallengeThreshold = 0.0
float fDLC04IntimidateEasyChallengeThreshold = 0.0
float fDLC04IntimidateMediumChallengeThreshold = 0.0
float fDLC04IntimidateReductionMaxThreshold = 0.0
bool bProcessingCalculation = false
int iStartUpFailsafeCount = 0

Function MakeSafetyResourceHostile(RefCollectionAlias aiRefCollection, Faction fcSettlementFaction = none, bool bSetNewCrimeFaction = true)
	;This function grabs all the safety objects (turrets) at a given workshop and adds it to a collection (if loaded)
	if myLocation.getLocation().IsLoaded()
		;When this location loads in, get all the safety objects in this area again in case anyone's showed up
		ObjectReference WorkshopRef = Workshop.GetRef()
		ObjectReference[] NewRefs = WorkshopRef.GetWorkshopResourceObjects(Safety)

		if NewRefs != none
			int i = 0
			int iCount = NewRefs.Length

			;Loop through everyone we got, confirm they're at the proper workshop, add them to the proper collection, and throw the local crime faction on them
			while i < iCount
				Actor currentRef = (NewRefs[i] as Actor)
				if currentRef != none && !currentRef.IsDead()
					if currentRef.GetLinkedRef(WorkshopItemKeyword) == WorkshopRef
						aiRefCollection.AddRef(NewRefs[i])

						if bSetNewCrimeFaction
							currentRef.AddtoFaction(fcSettlementFaction)
							currentRef.SetCrimeFaction(fcSettlementFaction)
						endif
					endif
				endif
				i += 1
			endwhile
		endif
	endif
EndFunction

Function AssignFactionToSafetyObjects(RefCollectionAlias aiCollection, Faction fcSettlementFaction = none)
	int i = 0
	int iCount = aiCollection.GetCount()
	Faction newCrimeFaction

	;Determine the appropriate crime faction to add
	if iChosenGang == 1
		newCrimeFaction = DLC04GangDisciplesFaction
	elseif iChosenGang == 2
		newCrimeFaction = DLC04GangOperatorsFaction
	elseif iChosenGang == 3
		newCrimeFaction = DLC04GangPackFaction
	endif

	;Loop through all turrets and remove the settlement crime faction and add the gang crime faction
	while i < iCount
		Actor act = aiCollection.GetAt(i) as Actor

		if !act.IsDead()
			;If the turret is in the settlement faction, remove them
			if fcSettlementFaction != none && act.IsInFaction(fcSettlementFaction)
				act.RemoveFromFaction(fcSettlementFaction)
			endif

			if newCrimeFaction != none
				act.AddToFaction(newCrimeFaction)
				act.SetCrimeFaction(newCrimeFaction)
			endif
		endif
		i += 1
	endwhile
EndFunction

Function CleanUpRefCollection(RefCollectionAlias aiCollection)
	;Roll through a ref collection, delete everyone, then kick 'em to the curb
	int i = 0
	int iCount = aiCollection.GetCount()

	while i < iCount
		aiCollection.GetAt(i).Delete()
		i += 1
	endwhile 

	;Empty ref collection
	aiCollection.RemoveAll()
EndFunction

Function SetUpDefenders(RefCollectionAlias aiDefenders,  RefCollectionAlias aiTargetCollection, Faction fcSettlementFaction, bool bInitialize, bool bAssignCrimeFaction)
	int l = 0
	int lCount = aiDefenders.GetCount()
	iDefenderCount = Utility.RandomInt(2, 5)

	;Loop through all mercs and get them added to target ref collection or delete them
	while (l < lCount)
		if bInitialize && l <= iDefenderCount
			Actor Def = aiDefenders.GetAt(l) as Actor
			Def.Enable()

			;Only add defenders to crime faction if they're not Minutemen
			if bAssignCrimeFaction
				Def.AddToFaction(fcSettlementFaction)
				Def.SetCrimeFaction(fcSettlementFaction)
			endif 

			aiTargetCollection.AddRef(Def)
			debug.trace("DLC04 Subdue: Setting up defender: " + Def)
		else
			debug.trace("DLC04 Subdue: Deleting defender: " + l)
			aiDefenders.GetAt(l).Delete()
		endif

		l += 1
	endwhile

	;If we're deleted folks, clear out the ref collection on your way out the door
	if !bInitialize
		aiDefenders.RemoveAll()
	endif
EndFunction

Function MoveDistantRefsToMarker(RefCollectionAlias aiRefCollection, ObjectReference aiMoveTarget)
	int i = 0
	int iCount = aiRefCollection.GetCount()
	Location myLoc = myLocation.GetLocation()

	;Loop through all the NPCs in a ref collection and move them to a specific point
	while i < iCount
		ObjectReference obj = aiRefCollection.GetAt(i)

		;If the NPC is unloaded and not in the target location, teleport them back to the target location
		if !obj.Is3dLoaded() && !obj.IsInLocation(myLoc)
			obj.Moveto(aiMoveTarget)
			debug.trace("DLC04 Raid Parent: Moving NPC " + obj + " to " + myLoc)
		endif

		i += 1
	endwhile
EndFunction

Function SetIntimidationValues()
	;Assign all the values for the various intimidate checks to local vars (since these won't be changing between rounds)
	fDLC04IntimidationNearbySettlementValue = DLC04IntimidationNearbySettlementValue.GetValue()
	fDLC04IntimidationRadioBeaconValue = DLC04IntimidationRadioBeaconValue.GetValue()
	fDLC04IntimidationGasValue = DLC04IntimidationGasValue.GetValue()
	fDLC04IntimidationSuccessValue = DLC04IntimidationSuccessValue.GetValue()
	fDLC04IntimidateAlwaysSucceedsChallengeThreshold = DLC04IntimidateAlwaysSucceedsChallengeThreshold.GetValue()
	fDLC04IntimidateEasyChallengeThreshold = DLC04IntimidateEasyChallengeThreshold.GetValue()
	fDLC04IntimidateMediumChallengeThreshold = DLC04IntimidateMediumChallengeThreshold.GetValue()
	fDLC04IntimidateReductionMaxThreshold = DLC04IntimidateReductionMaxThreshold.GetValue()
EndFunction

Function CalculateIntimidationValue(bool bShowMessages = true)
	;Value used to determine the difficulty of the speech challenges in this conversation
	while bProcessingCalculation
		;Lock this thread until the calculation is complete
		debug.trace(self + " waiting for intimidation thread lock to clear...")
		Utility.Wait(0.3)
	endwhile
	bProcessingCalculation = true

	;debug.trace(self + "DLC04 Raid: Calculating Intimidation.")
	ObjectReference WorkshopRef = Workshop.GetRef()

	;Record previous intimidate value and the current value
	float iPreviousIntimidateValue = iIntimidateValue
	float fCurrentIntimidate = 0

	;Store off the old Caps Buy Out level to compare to see if it has changed since last time we checked
	int iPreviousBuyoutLevel = iCapsBuyoutLevel

	;STAGE ONE - Get nearby Raider settlements. If there's more than one, add its value  
	if NearbyRaiderWorkshops.GetCount() - 1 > 0
		int iSettlements = NearbyRaiderWorkshops.GetCount() - 1
		fCurrentIntimidate = iSettlements * fDLC04IntimidationNearbySettlementValue
	endif
	debug.trace("DLC04 Raid: Adding nearby raider settlements. Intim Value: " + fCurrentIntimidate)

	;STAGE TWO - Check nearby radio beacon count
	if iRaiderRadioBeaconCount > 0
		fCurrentIntimidate = fCurrentIntimidate + fDLC04IntimidationRadioBeaconValue
	endif
	debug.trace("DLC04 Raid: Adding nearby radio beacons. Intim Value: " + fCurrentIntimidate)

	;STAGE THREE - Check NPC for intimidation effects
	Actor SSP = SettlementSpokesperson.GetActorRef()
	if SSP.HasMagicEffect(DLC04IntimidationGrenadeEffect)
		fCurrentIntimidate = fCurrentIntimidate + fDLC04IntimidationGasValue
	endif
	debug.trace("DLC04 Raid: Adding gas effect. Intim Value: " + fCurrentIntimidate)

	;STAGE FOUR - Add in any temp effects (scene intimidation, etc.)
	fCurrentIntimidate = fCurrentIntimidate + (fDLC04IntimidationSuccessValue * iIntimidateSuccesses)
	debug.trace("DLC04 Raid: Adding Intimidate successes. Intim Value: " + fCurrentIntimidate)

	;STAGE FIVE - Sum location population and Safety rating, then cap it if it's too much
	float fReductionSum = WorkshopRef.GetValue(WorkshopRatingPopulation) + WorkshopRef.GetValue(Safety)
	debug.trace("DLC04 Raid: Checking sum of safety and population: " + fReductionSum)

	if fReductionSum > fDLC04IntimidateReductionMaxThreshold
		fReductionSum = fDLC04IntimidateReductionMaxThreshold
	endif

	fCurrentIntimidate = fCurrentIntimidate - fReductionSum
	debug.trace("DLC04 Raid: Subtracting safety/population penalty value. Intim Value: " + fCurrentIntimidate)

	;Determine the buyout level for this location
	if fCurrentIntimidate >= fDLC04IntimidateAlwaysSucceedsChallengeThreshold
		;50 caps
		iCapsBuyoutLevel = 3
	elseif fCurrentIntimidate >= fDLC04IntimidateEasyChallengeThreshold
		;200 caps
		iCapsBuyoutLevel = 2
	elseif fCurrentIntimidate >= fDLC04IntimidateMediumChallengeThreshold
		;500 caps
		iCapsBuyoutLevel = 1 
	else
		;1000 caps
		iCapsBuyoutLevel = 0
	endif

	;Assign the calculated intimdate variable to the iIntimidateValue property
	iIntimidateValue = fCurrentIntimidate

	debug.trace("DLC04 Raid: Buyout level set to: " + iCapsBuyoutLevel + ". Previous level: " + iPreviousBuyoutLevel)
	debug.trace("DLC04 Raid: Intim value: " + iIntimidateValue + ". Previous value: " + iPreviousIntimidateValue)

	;If we've changed buyout levels, inform the player this place is now more intimidated. 
	;If there's only been a numeric change, show the lesser messages
	if bShowMessages && !bIntimidationResolved

		;Player's increased the intimidation level	
		if iPreviousBuyoutLevel < iCapsBuyoutLevel
			;Decide which raid this is
			if iCurrentRaidIndex == 1
				;Check to see if this is the max intimidation level
				if iCapsBuyoutLevel == 3
					DLC04RaidChaseOffMaxIntimidationMessage.Show()
				else
					DLC04RaidChaseOffIntimidationSuccessfulMessage.Show()
				endif
			elseif iCurrentRaidIndex == 3
				;Check to see if this is the max intimidation level
				if iCapsBuyoutLevel == 3
					DLC04RaidCoerceMaxIntimidationMessage.Show()
				else
					DLC04RaidCoerceIntimidationSuccessfulMessage.Show() 
				endif
			endif

		;Intimidation level has dropped
		elseif iPreviousBuyoutLevel > iCapsBuyoutLevel
			;Decide which raid this is
			if iCurrentRaidIndex == 1
				DLC04RaidChaseOffIntimidationHarderMessage.Show()
			elseif iCurrentRaidIndex == 3
				DLC04RaidCoerceIntimidationHarderMessage.Show()
			endif

		;Progress made towards increasing the intimidation value
		elseif iPreviousIntimidateValue < iIntimidateValue
			;Decide which raid this is
			if iCurrentRaidIndex == 1
				;If the player's already reached the max level, show that message again
				;Otherwise, show standard progress message
				if iCapsBuyoutLevel == 3
					DLC04RaidChaseOffMaxIntimidationMessage.Show()
				else
					DLC04RaidChaseOffIntimidationPositiveProgressMessage.Show()
				endif
			elseif iCurrentRaidIndex == 3
				;If the player's already reached the max level, show that message again
				;Otherwise, show standard progress message
				if iCapsBuyoutLevel == 3
					DLC04RaidCoerceMaxIntimidationMessage.Show()
				else
					DLC04RaidCoerceIntimidationPositiveProgressMessage.Show() 
				endif
			endif

		;Intimidation level falling, but hasn't dropped to a new level
		elseif iPreviousIntimidateValue > iIntimidateValue
			;Decide which raid this is
			if iCurrentRaidIndex == 1
				DLC04RaidChaseOffIntimidationNegativeProgressMessage.Show()
			elseif iCurrentRaidIndex == 3
				DLC04RaidCoerceIntimidationNegativeProgressMessage.Show()
			endif
		endif
	endif

	;Unlock the thread
	bProcessingCalculation = false
EndFunction

Function SetIntimidateActorValue(RefCollectionAlias aiCollection)
	;Function used to set the DLC04PlayerAttemptedIntimidate actor value on folks at this location
	int i = 0
	int iCount = aiCollection.GetCount()

	while i < iCount
		Actor act = (aiCollection.GetAt(i) as Actor)

		act.SetValue(DLC04PlayerAttemptedIntimidate, 1)

		i += 1 
	endwhile
EndFunction

bool Function AllDefendersBleedingOut(RefCollectionAlias aiCollection)
	;Loop through all the NPCs in this ref collection and check to see if they're still any not bleeding out
	int i = 0
	int iCount = aiCollection.GetCount()
	bool bActiveNPCs = false

	while i < iCount && !bActiveNPCs
		Actor act = (aiCollection.GetAt(i) as Actor)
		;Ignore actors that are dead
		if !act.IsDead() && !act.IsDisabled()
			if !act.IsBleedingOut()
				bActiveNPCs = true
			endif
		endif
		i += 1
	endwhile

	return !bActiveNPCs
EndFunction

bool Function AllDefendersDead(RefCollectionAlias aiCollection)
	;Loop through all the NPCs in this ref collection and check to see if they're still any alive
	int i = 0
	int iCount = aiCollection.GetCount()
	bool bActiveNPCs = false

	while i < iCount && !bActiveNPCs
		Actor act = (aiCollection.GetAt(i) as Actor)

		if !act.IsDisabled() && !act.IsEssential()
			if !act.IsDead()
				bActiveNPCs = true
			endif
		endif

		i += 1
	endwhile

	return !bActiveNPCs
EndFunction

int Function GetNumBleedoutInCollection(RefCollectionAlias aiCollection)
	int i = 0 
	int iCount = aiCollection.GetCount()
	int iBleedingOutCount = 0

	;Loop through all the actors in a ref collection and let the script
	;know how many are bleedingout or dead
	while i < iCount
		Actor act = (aiCollection.GetAt(i) as Actor)

		if act.IsBleedingOut() || act.IsDead()
			iBleedingOutCount += 1
		endif

		i += 1
	endwhile

	return iBleedingOutCount
EndFunction

Function CheckAddArlenGlassToNPCCollections(RefCollectionAlias aiCollection, RefCollectionAlias aiCollection02 = none)
	;This function is, right now, to handle Arlen Glass at the Slog getting added to the correct collections
	;Could be expanded in the future

	;If this attack is taking place at the Slog
	if myLocation.GetLocation() == TheSlogLocation

		;Check to see if Arlen's quest is still active, he's alive, and he's not disabled
		Actor ArlenREF = (ArlenGlass.GetRef() as Actor)
		if !DN154.GetStageDone(255) && !ArlenREF.IsDead() && !ArlenREF.IsDisabled()

			;If all that's true, add him to the expected ref collection for this quest
			bArlenGlassActive = true
			aiCollection.AddRef(ArlenREF)

			if aiCollection02 != none
				aiCollection02.AddRef(ArlenREF)
			endif
		endif
	endif
EndFunction

Function RestoreCollectionHealthIfNegative(RefCollectionAlias aiCollection)
	int i = 0
	int iCount = aiCollection.GetCount()
	float fCurrentHealth = 0.0

	while i < iCount
		Actor act = (aiCollection.GetAt(i) as Actor)
		fCurrentHealth = act.GetValue(Health)

		debug.trace("DLC04 Raid Parent: Checking health for actor " + act + ". Current health: " + fCurrentHealth)	

		if fCurrentHealth <= 0.0
			float fHealthToRestore = ((fCurrentHealth * -1.0) + 1.0)
			act.RestoreValue(Health, fHealthToRestore)
			;debug.trace("DLC04 Raid Parent: Restoring health for actor " + act + " by: " + fHealthToRestore + ". Current health: " + act.GetValue(Health))
		endif

		i += 1
	endwhile
EndFunction

Function UpdateMQ04OutpostCount()
	;Update objectives on MQ04 and 
	if DLC04MQ04.ModObjectiveGlobal(1, DLC04MQ04FinalOutpostsCount, 330, 3)
		DLC04MQ04.SetStage(500)
	endif
EndFunction

bool Function CheckForNearbyRaiderBeacons()
	int i = 0
	int iCount = NearbyRaiderWorkshops.GetCount()
	bool bRaiderBeaconNearby = false

	;Loop through all the nearby raider outposts
	while i < iCount && !bRaiderBeaconNearby
	
		;Return if any of the nearby outposts already has a beacon
		WorkshopScript nearbyWorkshopRef = NearbyRaiderWorkshops.GetAt(i) as WorkshopScript 
		if nearbyWorkshopRef.GetValue(DLC04WorkshopParent.DLC04WorkshopRatingRaiderRadio)
			bRaiderBeaconNearby = true
		endif
		i += 1
	endwhile

	return bRaiderBeaconNearby
EndFunction

ObjectReference Function GetNearbyOutpostWithoutBeacons()
	int i = 0
	int iCount = NearbyRaiderWorkshops.GetCount()
	ObjectReference RaiderOutpost

	;Loop through all the nearby outposts and find the first one that doesn't have a Raider radio beacon
	while i < iCount && RaiderOutpost == none
	
		ObjectReference nearbyWorkshopRef = NearbyRaiderWorkshops.GetAt(i) 
		if nearbyWorkshopRef.GetValue(DLC04WorkshopParent.DLC04WorkshopRatingRaiderRadio) <= 0
			RaiderOutpost = nearbyWorkshopRef
		endif
		i += 1
	endwhile

	return RaiderOutpost
EndFunction

Function ToggleMapMarkerFastTravel(bool bToggle)
	ObjectReference MM = MapMarker.GetRef()
	
	if MM != none
		;Turn off fast travel to settlement map marker if the player can already travel there 
		if bToggle
			MM.AddToMap()
			if MM.CanFastTravelToMarker()
  				MM.EnableFastTravel(false)
  				bDisabledMapMarker = true
  			endif
		else
			;If fast travel has been disabled here, enable it
			if bDisabledMapMarker
				MM.EnableFastTravel()
			endif
		endif
	endif 
EndFunction

function TryToSendHome(actor theActor)
    WorkshopNPCScript workshopNPC = theActor as WorkshopNPCScript
    if workshopNPC
        int workshopID = workshopNPC.GetWorkshopID()
        if workshopID > -1
            workshopScript workshopRef = workshopNPC.WorkshopParent.GetWorkshop(workshopID)
            if workshopRef
                debug.trace(self + " try to move " + workshopNPC + " home to " + workshopRef + ". Workshop ref location is loaded: " + workshopRef.myLocation.IsLoaded() + ". WorkshopNPC is3DLoaded: " + workshopNPC.Is3DLoaded())
                ; move home immediately if both me and my home are unloaded
                if workshopRef.myLocation.IsLoaded() == false && workshopNPC.Is3DLoaded() == false
                    workshopNPC.MoveTo(workshopRef.GetLinkedRef(WorkshopParent.WorkshopLinkCenter))
                endif
            endif
        endif
    endif
endFunction

Function ToggleIgnoreFriendlyHitsOnRefColl(RefCollectionAlias aiCollection, bool bSetIgnoreFriendlyHits)
	int i = 0
	int iCount = aiCollection.GetCount()

	;Loop through everyone in this ref collection and set them to the right state
	; of "Ignore Friendly Hits"
	while (i < iCount)
		ObjectReference obj = aiCollection.GetAt(i)
		Obj.IgnoreFriendlyHits(bSetIgnoreFriendlyHits)
		debug.trace("DLC04 Raid Parent: Toggle Ignore Friendly Hits " + bSetIgnoreFriendlyHits + " on: " + obj)

		i += 1
	endwhile
EndFunction

; utility function to remove refs from the collection that aren't actually assigned to the specified workshop
function VerifyRefCollection(RefCollectionAlias theCollection)
	WorkshopScript workshopRef = Workshop.GetRef() as WorkshopScript
	Location workshopLocation = workshopRef.myLocation
	debug.trace(self + " VerifyRefCollection " + theCollection + " for workshop " + workshopRef)
	int i = theCollection.GetCount() - 1 ; start from the top since we are removing things as we go
	while i > -1
		WorkshopNPCScript workshopNPC = theCollection.GetAt(i) as WorkshopNPCScript
		if workshopNPC.GetLinkedRef(WorkshopItemKeyword) != workshopRef 
			debug.trace(self + " VerifyRefCollection: removing invalid workshop actor " + workshopNPC)
			theCollection.RemoveRef(workshopNPC)
			; try to clean up the bad data from the location
			;/
			if workshopNPC.CustomBossLocRefType
				ClearLocRefType(workshopLocation, workshopNPC.CustomBossLocRefType)
			else
				ClearLocRefType(workshopLocation, WorkshopParent.Boss)
			endif
			/;
		endif
		i += -1
	endWhile
endFunction

Function CheckStartUpFailSafe()
	;Check to see is Shank is in dialogue with the player
	if !Shank.GetRef().IsInDialogueWithPlayer()

		;If he's not, increment the count
		iStartUpFailsafeCount += 1

		debug.trace("DLC04 Raid Parent: Start-up failsafe timer count: " + iStartUpFailsafeCount)

		;If the count if above the threshold, call for the quest to shut down
		if iStartUpFailsafeCount >= 2
			debug.trace("DLC04 Raid Parent: Start-up failsafe timer count reached! Shutting down!")
			SetStage(760)
		endif
	endif
EndFunction