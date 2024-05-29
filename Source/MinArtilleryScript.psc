Scriptname MinArtilleryScript extends Quest conditional

struct ArtilleryLocation
	LocationAlias artilleryLocationAlias
	ReferenceAlias originMarker
	ReferenceAlias workshopAlias
	RefCollectionAlias artillery
	int strikeCount
endStruct

FormList property MinArtilleryList auto const

ArtilleryLocation[] Property ArtilleryLocations Auto Const
ReferenceAlias Property Smoke auto Const
LocationAlias Property SmokeLocation auto Const
ReferenceAlias Property SmokeLocationCenterMarker auto Const

Group OutOfRange
	LocationAlias Property ArtilleryLocationTooClose auto Const
	{ if this is filled, there is some artillery but too close - use for radio message "out of range"}
	ReferenceAlias Property ArtilleryTooCloseMarker auto Const
	{ center marker for ArtilleryLocationAnyRange - use for distance calculations }

	LocationAlias Property ArtilleryLocationTooFar auto Const
	{ if this is filled, there is some artillery but too far - use for radio message "out of range"}
	ReferenceAlias Property ArtilleryTooFarMarker auto Const
	{ center marker for ArtilleryLocationAnyRange - use for distance calculations }
endGroup

Group Messages
	Message Property MinArtilleryFriendlyTargetMessage Auto Const Mandatory

	Message Property MinArtilleryTooCloseMessage Auto Const Mandatory

	Message Property MinArtilleryTooFarMessage Auto Const Mandatory

	Message Property MinArtilleryNoneAvailableMessage Auto Const Mandatory

	Message Property MinArtilleryReloadingMessage Auto Const Mandatory
endGroup

ObjectReference Property MinArtilleryMarker auto Const
{ marker used for placing artillery strikes }
ObjectReference Property MinArtilleryCenterMarker auto Const
{ marker used for placing artillery strikes }

GlobalVariable Property MinArtilleryRangeMinimum const auto
GlobalVariable Property MinArtilleryRangeMaximum const auto

GlobalVariable Property MinArtilleryTimeNextAvailable const auto
{ after firing, next time the artillery will be available - GameDaysPassed + MinArtilleryResetTimeHours}

GlobalVariable Property MinArtilleryResetTimeHours const auto
{ how long (in hours) until artillery can fire again }

Group ExplosionProperties
	Sound Property FXProjectileArtilleryMinutemen Auto Const
	Activator Property WorkshopArtilleryStrikeProjectileShooterFar Auto Const
EndGroup

WorkshopParentScript property WorkshopParent auto Const

MinutemenCentralScript Property MinutemenCentralQuest Auto Const

Scene Property MinArtilleryRadioChatter Auto Const

bool property bValidTarget auto conditional
bool property bFriendlyTarget auto conditional
bool property bTooClose auto conditional
bool property bTooFar auto conditional

int StartTimerID = 1
float StartHours = 0.08 const ; game hours between smoke and artillery strike

int ArtilleryStrikeTimerID = 2

int ArtilleryWaitForFinishedTimerID = 3  ; timer to wait for FinishedFiring event - if timer expires before getting event, forget about event and move on
float firingArtilleryFailsafeHours = 0.12

ArtilleryReferenceScript firingArtillery  ; set to artillery we're waiting for event from
ArtilleryLocation firingLocation  					; set to the firing artillery's location

ObjectReference nextArtillery  						; set to next artillery we're going to fire (could be just a marker if we can't find a gun)
ArtilleryLocation nextLocation  					; set to next artillery's location


int ArtilleryStrikeCount = 0
int TotalArtillery = 0

int MaxArtilleryStrikeCount = 15 const

float ArtillerySpreadRadius = 500.0 const
float MaxStrikesPerArtillery = 7.0 const
float MinStrikesPerArtillery = 4.0 const

function Initialize()
	debug.trace(self + " *********Initialize:************")
	; count up total artillery available
	int i = 0
	TotalArtillery = 0
	ArtilleryStrikeCount = 0
	while i < ArtilleryLocations.Length
		debug.trace(self + "  Location alias " + i)
		ArtilleryLocation theArtyLoc = ArtilleryLocations[i]
		Location theLoc = theArtyLoc.artilleryLocationAlias.GetLocation()
		WorkshopScript theWorkshop = theArtyLoc.workshopAlias.GetRef() as WorkshopScript
		debug.trace(self + "  Location alias " + i + ": " + theLoc)
		if theLoc
			; put this location into the form list
			MinArtilleryList.AddForm(theLoc)
			; how much artillery at this location?
			theArtyLoc.strikeCount = theWorkshop.GetValue(WorkshopParent.WorkshopRatings[WorkshopParent.WorkshopRatingArtillery].resourceValue) as int
			TotalArtillery += theArtyLoc.strikeCount
			; calc total number of strikes from this location
			theArtyLoc.strikeCount = Math.Floor((theArtyLoc.strikeCount as float) * Utility.RandomFloat(MinStrikesPerArtillery, MaxStrikesPerArtillery))
			debug.trace(self + " Location=" + theLoc + ": " + theArtyLoc.strikeCount + " strikes")
			ArtilleryStrikeCount += theArtyLoc.strikeCount
		endif

		; remove any artillery refs that can't produce (so we don't try to fire from them)
		RefCollectionAlias theArtilleryCollection = theArtyLoc.artillery
		; count down so the index remains valid if we remove items from the collection
		int artilleryIndex = theArtilleryCollection.GetCount() - 1
		while artilleryIndex > -1
			ObjectReference theArtilleryRef = theArtilleryCollection.GetAt(artilleryIndex)
			if theArtilleryRef.CanProduceForWorkshop() == false
				debug.trace(self + " 	removing " + theArtilleryRef + " - can't currently fire")
				theArtilleryCollection.RemoveRef(theArtilleryRef)
			endif
			artilleryIndex -= 1
		endWhile

		i += 1
	endWhile

	; don't go higher than max strike count
	ArtilleryStrikeCount = math.Min(ArtilleryStrikeCount, MaxArtilleryStrikeCount) as int

	debug.trace(self + " TotalArtillery=" + TotalArtillery)
	debug.trace(self + " ArtilleryStrikeCount=" + ArtilleryStrikeCount)
	debug.trace(self + " ArtilleryLocationTooClose=" + ArtilleryLocationTooClose.GetLocation())
	debug.trace(self + " ArtilleryLocationTooFar=" + ArtilleryLocationTooFar.GetLocation())
	; if none in range, is there any at all?
	if TotalArtillery == 0 && (ArtilleryLocationTooClose.GetLocation() || ArtilleryLocationTooFar.GetLocation())
		debug.trace(self + " no arty in range")
		ObjectReference artyTooCloseMarker = ArtilleryTooCloseMarker.GetRef()
		ObjectReference artyTooFarMarker = ArtilleryTooFarMarker.GetRef()
		if artyTooCloseMarker
			debug.trace(self + " 	-- too close")
			bTooClose = true
		elseif artyTooFarMarker
			debug.trace(self + " 	-- too far")
			bTooFar = true
		else
			debug.trace(self + " -- just right? something's amiss here")
		endif
	elseif TotalArtillery > 0
		debug.trace(self + " 	-- check for friendly target...")
		if WorkshopParent.IsFriendlyLocation(Smoke.GetRef()); && Smoke.GetRef().GetDistance(SmokeLocationCenterMarker.GetRef()) < MinArtilleryFriendlyFireRadius.GetValue()
			bFriendlyTarget = true
			debug.trace(self + " 	-- friendly target")
		else
			bValidTarget = true
		endif
	else
		debug.trace(self + " no arty at all - stopping quest")
		MinArtilleryNoneAvailableMessage.Show()
		; stop quest
		stop()
	endif

	if bValidTarget
		debug.trace(self + " passed all checks - PREPARING TO FIRE")
	endif

	; start timer for artillery strike/radio message
	StartTimerGameTime(StartHours, StartTimerID)
endFunction

function ShowFailureMessageTooClose()
	ShowFailureMessage(MinArtilleryTooCloseMessage)
endFunction

function ShowFailureMessageTooFar()
	ShowFailureMessage(MinArtilleryTooFarMessage)
endFunction

function ShowFailureMessageReloading()
	ShowFailureMessage(MinArtilleryReloadingMessage)
endFunction

function ShowFailureMessageFriendlyTarget()
	ShowFailureMessage(MinArtilleryFriendlyTargetMessage)
endFunction

; utility function to show a failure message if player isn't or can't hear the radio broadcast
function ShowFailureMessage(Message theMessage)
	if MinutemenCentralQuest.RadioStationActive == false || Game.IsPlayerListening(MinutemenCentralQuest.MinutemenRadioFrequency) == false
		theMessage.Show()
	endif
endFunction

Event OnTimerGameTime(int aiTimerID)
	if aiTimerID == StartTimerID
		setStage(20)
		; place center marker at smoke (which should have had time to settle now)
		MinArtilleryCenterMarker.MoveTo(Smoke.GetRef(), abMatchRotation = false)
	elseif aiTimerID == ArtilleryStrikeTimerID
		; artillery strike
		NextArtilleryStrike()
	elseif aiTimerID == ArtilleryWaitForFinishedTimerID
		; if timer expired while waiting for artillery to fire, forget about it and start next strike
		debug.trace(self + " ArtilleryWaitForFinishedTimerID expired")
		if firingArtillery
			debug.trace(self + " never heard back from " + firingArtillery + " - start next strike")
			SetFiringArtillery(NONE, NONE)
			StartArtilleryStrikeTimer()
		endif
	endif
endEvent

Event ArtilleryReferenceScript.FinishedFiring(ArtilleryReferenceScript akSender, Var[] akArgs)
	debug.Trace(self + "ArtilleryReferenceScript.FinishedFiring " + akSender)
	if akSender == firingArtillery
		; got back the event for the current artillery
		SetFiringArtillery(NONE, NONE)
		; cancel failsafe timer
		CancelTimerGameTime(ArtilleryWaitForFinishedTimerID)
		; trigger next strike
		StartArtilleryStrikeTimer()
	endif
EndEvent

function SetFiringArtillery(ArtilleryReferenceScript newFiringArtillery, ArtilleryLocation newFiringLocation)
	firingArtillery = newFiringArtillery
	firingLocation = newFiringLocation
endFunction


; called from stage 30
function BeginArtilleryStrikes()
	debug.trace(self + " BeginArtilleryStrikes")
	; start timer for artillery strikes
	StartTimerGameTime(ArtilleryStrikeTimerMin, ArtilleryStrikeTimerID)
endFunction

function PickNextArtillery(ArtilleryReferenceScript lastArtillery = NONE)
	debug.trace(self + " PickNextArtillery: lastArtillery=" + lastArtillery)
	; which location?
	int strikeIndex = Utility.RandomInt(0, MinArtilleryList.GetSize() - 1)
	Location strikeLoc = MinArtilleryList.GetAt(strikeIndex) as Location
	debug.trace(self + " 	strikeLoc=" + strikeLoc + " (index=" + strikeIndex + ")")
	ObjectReference strikeOrigin = none

	ArtilleryLocation strikeArtilleryLocation ; to save the ArtilleryLocation data if we get it

	; find this in ArtilleryLocations array
	int i = 0
	while i < ArtilleryLocations.Length && strikeOrigin == NONE
		ArtilleryLocation theArtyLoc = ArtilleryLocations[i]
		debug.trace(self + " 	i=" + i + ": Location=" + theArtyLoc.artilleryLocationAlias.GetLocation())
		if theArtyLoc.artilleryLocationAlias.GetLocation() == strikeLoc
			strikeArtilleryLocation = theArtyLoc
			; found matching location in array - decrement strike count
			theArtyLoc.strikeCount += -1
			if theArtyLoc.strikeCount <= 0
				; remove from form list
				MinArtilleryList.RemoveAddedForm(strikeLoc)
			endif
			; set origin marker
			int artilleryCount = theArtyLoc.artillery.GetCount()
			if artilleryCount > 0
				int nextArtilleryIndex = -1
				; if we have lastArtillery, try to pick different gun
				if lastArtillery
					; is this in our list?
					int lastArtilleryIndex = theArtyLoc.artillery.Find(lastArtillery)
					if lastArtilleryIndex > -1
						; found it, either increment or back to start
						nextArtilleryIndex = lastArtilleryIndex + 1
						if nextArtilleryIndex >= artilleryCount
							nextArtilleryIndex = 0
						endif
					endif
				endif
				; if we haven't found one yet, just pick randomly
				if nextArtilleryIndex == -1 
					nextArtilleryIndex = utility.RandomInt(0, artilleryCount - 1 )
				endif
				strikeOrigin = theArtyLoc.artillery.GetAt(nextArtilleryIndex)
			else
				; use origin marker if can't get the artillery for some reason
				strikeOrigin = theArtyLoc.originMarker.GetRef()
			endif
		endif
		i += 1
	endWhile

	nextLocation = strikeArtilleryLocation
	nextArtillery = strikeOrigin
	if nextLocation && nextLocation.artilleryLocationAlias.GetLocation()
		debug.trace(self + " PickNextArtillery DONE: location = " + nextLocation.artilleryLocationAlias.GetLocation() + ", artillery = " + nextArtillery)
	else
		nextLocation = NONE
		debug.trace(self + " PickNextArtillery FAILED: found no location")
	endif
endFunction

function NextArtilleryStrike()
	debug.trace(self + " NextArtilleryStrike: ArtilleryStrikeCount=" + ArtilleryStrikeCount)
	; if 0 already, stop
	if ArtilleryStrikeCount <= 0
		FinishArtilleryStrikes()
		return
	endif

	; decrement
	ArtilleryStrikeCount += -1

	;/
	; which location?
	int strikeIndex = Utility.RandomInt(0, MinArtilleryList.GetSize() - 1)
	Location strikeLoc = MinArtilleryList.GetAt(strikeIndex) as Location
	debug.trace(self + " 	strikeLoc=" + strikeLoc + " (index=" + strikeIndex + ")")
	ObjectReference strikeOrigin = none

	ArtilleryLocation strikeArtilleryLocation ; to save the ArtilleryLocation data if we get it

	; find this in ArtilleryLocations array
	int i = 0
	while i < ArtilleryLocations.Length && strikeOrigin == NONE
		ArtilleryLocation theArtyLoc = ArtilleryLocations[i]
		debug.trace(self + " 	i=" + i + ": Location=" + theArtyLoc.artilleryLocationAlias.GetLocation())
		if theArtyLoc.artilleryLocationAlias.GetLocation() == strikeLoc
			strikeArtilleryLocation = theArtyLoc
			; found matching location in array - decrement strike count
			theArtyLoc.strikeCount += -1
			if theArtyLoc.strikeCount <= 0
				; remove from form list
				MinArtilleryList.RemoveAddedForm(strikeLoc)
			endif
			; set origin marker
			int artilleryCount = theArtyLoc.artillery.GetCount()
			if artilleryCount > 0
				; get random gun at this location
				int randomIndex = utility.RandomInt(0, artilleryCount - 1 )
				strikeOrigin = theArtyLoc.artillery.GetAt(randomIndex)
			else
				; use origin marker if can't get the artillery for some reason
				strikeOrigin = theArtyLoc.originMarker.GetRef()
			endif
		endif
		i += 1
	endWhile
/;
	if nextLocation == NONE
		PickNextArtillery()
	endif

	; if still none, we have a problem - bail
	if nextLocation == none
		; error - still no location
		debug.trace(self + " WARNING: didn't find next location")
	else
		Location strikeLoc = nextLocation.artilleryLocationAlias.GetLocation()

		if nextArtillery == none
			; error - should have found a gun to fire
			debug.trace(self + " WARNING: didn't find artillery ref at " + strikeLoc)
		else
			; put down explosion at random spot near smoke
			float xOffset = Utility.RandomFloat(-1*ArtillerySpreadRadius, ArtillerySpreadRadius)
			float yOffset = Utility.RandomFloat(-1*ArtillerySpreadRadius, ArtillerySpreadRadius)

			MinArtilleryMarker.MoveTo(MinArtilleryCenterMarker, xOffset, yOffset)
			debug.trace(self + " Firing from " + strikeLoc + ": xOffset=" + xOffset + ", yOffset=" + yOffset)

			; rotate marker to face towards from origin marker
			float headingAngle = MinArtilleryMarker.GetHeadingAngle(nextArtillery)
			debug.trace(self + " headingAngle=" + headingAngle)
			headingAngle = headingAngle + MinArtilleryMarker.GetAngleZ()
			; should now be facing TOWARDS from origin marker
			debug.trace(self + " MinArtilleryMarker facing angle=" + headingAngle)
			MinArtilleryMarker.SetAngle(0.0, 0.0, headingAngle)

			; spawn explosion at random spot
			ArtilleryReferenceScript artilleryRef = nextArtillery as ArtilleryReferenceScript
			if artilleryRef
				; register for "done firing" event, and then don't count as finished/next strike until get that back, or failsafe timer expires
				RegisterForCustomEvent(artilleryRef, "FinishedFiring")
				; save the artillery we're waiting for
				SetFiringArtillery(artilleryRef, nextLocation)
				artilleryRef.FireAtTarget(MinArtilleryMarker)
				debug.trace(self + " waiting for FinishedFiring event from " + artilleryRef + "...")
				StartTimerGameTime(firingArtilleryFailsafeHours, ArtilleryWaitForFinishedTimerID)
			else
				; just place explosion
				PlaceExplosion(MinArtilleryMarker)
				SetFiringArtillery(NONE, NONE)
			endif
		endif
	endif


	if ArtilleryStrikeCount > 0
		; pick next artillery location
		PickNextArtillery(firingArtillery)
	endif

	if firingArtillery
		; if we have a valid gun, don't need to do anything - FinishedFiring event will trigger strike timer
	else
		if ArtilleryStrikeCount > 0
			StartArtilleryStrikeTimer()
		else
			FinishArtilleryStrikes()
		endif
	endif
endFunction

function FinishArtilleryStrikes()
	; reset timer
	MinArtilleryTimeNextAvailable.SetValue(Utility.GetCurrentGameTime() + MinArtilleryResetTimeHours.GetValue()/24.0)
	; stage 500 = strikes done
	SetStage(500)
endFunction

float ArtilleryStrikeTimerMin = 0.0025 const
float ArtilleryStrikeTimerMax = 0.025 const

function StartArtilleryStrikeTimer()
	; min time is divided by total artillery, so you never get super fast strikes with only 1 gun
	float timerMin = Math.Max(ArtilleryStrikeTimerMin * 3 / TotalArtillery, ArtilleryStrikeTimerMin)
	float timerMax = Math.Max(ArtilleryStrikeTimerMax * 3 / TotalArtillery, ArtilleryStrikeTimerMax)

	float strikeTimer = utility.RandomFloat(timerMin, timerMax)

	debug.trace(self + "StartArtilleryStrikeTimer: min=" + timerMin + ", max=" + timerMax + ", TotalArtillery=" + TotalArtillery)
	debug.trace(self + "StartArtilleryStrikeTimer: base value=" + strikeTimer + " hours (game time)")

	if nextArtillery != firingArtillery
		; reduce by timer min
		debug.trace(self + "	--- next strike from different gun, so reduce strike time")
		strikeTimer = strikeTimer * 0.5
	endif		

	debug.trace(self + "StartArtilleryStrikeTimer: STRIKE TIMER=" + strikeTimer + " hours (game time)")

	StartTimerGameTime(strikeTimer, ArtilleryStrikeTimerID)
endFunction

; for failsafe situation where artillery can't be found
function PlaceExplosion(ObjectReference targetMarker)
	;Play the whistling sound as it falls
	FXProjectileArtilleryMinutemen.Play(targetMarker)
	ObjectReference myFiringMarker = targetMarker.PlaceAtMe(WorkshopArtilleryStrikeProjectileShooterFar)
	myFiringMarker.Delete()
endFunction


