Scriptname MS02NukeStrikeScript extends Quest conditional

struct BeaconLocation
	LocationAlias BeaconLocationAlias
	ReferenceAlias originMarker
	ReferenceAlias workshopAlias
	RefCollectionAlias artillery
	int strikeCount
endStruct

FormList property MinArtilleryList auto const

BeaconLocation[] Property BeaconLocations Auto Const
ReferenceAlias Property MS02BeaconAlias auto Const
LocationAlias Property MS02BeaconLocationAlias auto Const
ReferenceAlias Property MS02BeaconLocationCenterMarker auto Const

Group OutOfRange
	LocationAlias Property BeaconLocationTooClose auto Const
	{ if this is filled, there is some artillery but too close - use for radio message "out of range"}
	ReferenceAlias Property BeaconTooCloseMarker auto Const
	{ center marker for BeaconLocationAnyRange - use for distance calculations }

	LocationAlias Property BeaconLocationTooFar auto Const
	{ if this is filled, there is some artillery but too far - use for radio message "out of range"}
	ReferenceAlias Property ArtilleryTooFarMarker auto Const
	{ center marker for BeaconLocationAnyRange - use for distance calculations }
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

Explosion property MinArtilleryExplosion const auto

WorkshopParentScript property WorkshopParent auto Const

MinutemenCentralScript Property MinutemenCentralQuest Auto Const

Scene Property MS02NukeStrikeCountdown Auto Const

bool property bValidTarget auto conditional
bool property bFriendlyTarget auto conditional
bool property bTooClose auto conditional
bool property bTooFar auto conditional

int StartTimerID = 1
float StartHours = 0.08 ; game hours between smoke and artillery strike

int NukeStrikeTimerID = 2

int ArtilleryWaitForFinishedTimerID = 3  ; timer to wait for FinishedFiring event - if timer expires before getting event, forget about event and move on
ArtilleryReferenceScript firingArtillery  ; set to artillery we're waiting for event from
float firingArtilleryFailsafeHours = 0.12

int NukeStrikeCount
int TotalArtillery

float ArtillerySpreadRadius = 500.0
float MaxStrikesPerArtillery = 5.0
float MinStrikesPerArtillery = 2.0

function Initialize()
	debug.trace(self + " *********Initialize:************")
	; count up total artillery available
	int i = 0
	TotalArtillery = 0
	while i < BeaconLocations.Length
		debug.trace(self + "  Location alias " + i)
		BeaconLocation theArtyLoc = BeaconLocations[i]
		Location theLoc = theArtyLoc.BeaconLocationAlias.GetLocation()
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
			NukeStrikeCount += theArtyLoc.strikeCount
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
	debug.trace(self + " TotalArtillery=" + TotalArtillery)
	debug.trace(self + " NukeStrikeCount=" + NukeStrikeCount)
	debug.trace(self + " BeaconLocationTooClose=" + BeaconLocationTooClose.GetLocation())
	debug.trace(self + " BeaconLocationTooFar=" + BeaconLocationTooFar.GetLocation())
	; if none in range, is there any at all?
	if TotalArtillery == 0 && (BeaconLocationTooClose.GetLocation() || BeaconLocationTooFar.GetLocation())
		debug.trace(self + " no arty in range")
		ObjectReference artyTooCloseMarker = BeaconTooCloseMarker.GetRef()
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
		debug.trace(self + " 	-- check for friendlies...")
		if WorkshopParent.IsFriendlyLocation(MS02BeaconAlias.GetRef()); && MS02BeaconAlias.GetRef().GetDistance(MS02BeaconLocationCenterMarker.GetRef()) < MinArtilleryFriendlyFireRadius.GetValue()
			bFriendlyTarget = true
			debug.trace(self + " 	-- friendly target")
		else
			bValidTarget = true
		endif
	else
		debug.trace(self + " no arty at all - stopping quest")
		; stop quest
		stop()
	endif

	if bValidTarget
		debug.trace(self + " passed all checks - PREPARING TO FIRE")
	endif

	; start timer for artillery strike/radio message
	StartTimerGameTime(StartHours, StartTimerID)
endFunction

Event OnTimerGameTime(int aiTimerID)
	if aiTimerID == StartTimerID
		setStage(20)
		; place center marker at smoke (which should have had time to settle now)
		MinArtilleryCenterMarker.MoveTo(MS02BeaconAlias.GetRef(), abMatchRotation = false)
	elseif aiTimerID == NukeStrikeTimerID
		; artillery strike
		NextNukeStrike()
	elseif aiTimerID == ArtilleryWaitForFinishedTimerID
		; if timer expired while waiting for artillery to fire, forget about it and start next strike
		debug.trace(self + " ArtilleryWaitForFinishedTimerID expired")
		if firingArtillery
			debug.trace(self + " never heard back from " + firingArtillery + " - start next strike")
			firingArtillery = NONE
			StartNukeStrikeTimer()
		endif
	endif
endEvent

Event ArtilleryReferenceScript.FinishedFiring(ArtilleryReferenceScript akSender, Var[] akArgs)
	debug.Trace(self + "ArtilleryReferenceScript.FinishedFiring " + akSender)
	if akSender == firingArtillery
		; got back the event for the current artillery
		firingArtillery = NONE
		; cancel failsafe timer
		CancelTimerGameTime(ArtilleryWaitForFinishedTimerID)
		; trigger next strike
		StartNukeStrikeTimer()
	endif
EndEvent


; called from stage 30
function LaunchMissile()
	; start timer for artillery strikes
	StartTimerGameTime(NukeStrikeTimerMin, NukeStrikeTimerID)
endFunction

function NextNukeStrike()
	debug.trace(self + " NextNukeStrike: NukeStrikeCount=" + NukeStrikeCount)
	; if 0 already, stop
	if NukeStrikeCount <= 0
		setStage(500)
		return
	endif

	; decrement
	NukeStrikeCount += -1

	; which location?
	int strikeIndex = Utility.RandomInt(0, MinArtilleryList.GetSize() - 1)
	Location strikeLoc = MinArtilleryList.GetAt(strikeIndex) as Location
	debug.trace(self + " 	strikeLoc=" + strikeLoc + " (index=" + strikeIndex + ")")
	ObjectReference strikeOrigin = none

	; find this in BeaconLocations array
	int i = 0
	while i < BeaconLocations.Length && strikeOrigin == NONE
		BeaconLocation theArtyLoc = BeaconLocations[i]
		debug.trace(self + " 	i=" + i + ": Location=" + theArtyLoc.BeaconLocationAlias.GetLocation())
		if theArtyLoc.BeaconLocationAlias.GetLocation() == strikeLoc
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

	if strikeOrigin == none
		; error - should have found a gun to fire
		debug.trace(self + " WARNING: didn't find artillery ref at " + strikeLoc)
	else
		; put down explosion at random spot near smoke
		float xOffset = Utility.RandomFloat(-1*ArtillerySpreadRadius, ArtillerySpreadRadius)
		float yOffset = Utility.RandomFloat(-1*ArtillerySpreadRadius, ArtillerySpreadRadius)

		MinArtilleryMarker.MoveTo(MinArtilleryCenterMarker, xOffset, yOffset)
		debug.trace(self + " Firing from " + strikeLoc + ": xOffset=" + xOffset + ", yOffset=" + yOffset)

		; rotate marker to face towards from origin marker
		float headingAngle = MinArtilleryMarker.GetHeadingAngle(strikeOrigin)
		debug.trace(self + " headingAngle=" + headingAngle)
		headingAngle = headingAngle + MinArtilleryMarker.GetAngleZ()
		; should now be facing TOWARDS from origin marker
		debug.trace(self + " MinArtilleryMarker facing angle=" + headingAngle)
		MinArtilleryMarker.SetAngle(0.0, 0.0, headingAngle)

		; spawn explosion at random spot
		ArtilleryReferenceScript artilleryRef = strikeOrigin as ArtilleryReferenceScript
		if artilleryRef
			; register for "done firing" event, and then don't count as finished/next strike until get that back, or failsafe timer expires
			RegisterForCustomEvent(artilleryRef, "FinishedFiring")
			; save the artillery we're waiting for
			firingArtillery = artilleryRef
			artilleryRef.FireAtTarget(MinArtilleryMarker)
			debug.trace(self + " waiting for FinishedFiring event from " + artilleryRef + "...")
			StartTimerGameTime(firingArtilleryFailsafeHours, ArtilleryWaitForFinishedTimerID)
		else
			; just place explosion (TODO - change to incoming projectile activator)
			MinArtilleryMarker.PlaceAtMe(MinArtilleryExplosion)
		endif
	endif

	if NukeStrikeCount > 0
		if firingArtillery
			; if we have a valid gun, don't need to do anything - FinishedFiring event will trigger strike timer
		else
			StartNukeStrikeTimer()
		endif
	else
		; reset timer
		MinArtilleryTimeNextAvailable.SetValue(Utility.GetCurrentGameTime() + MinArtilleryResetTimeHours.GetValue()/24.0)
		; stage 500 = strikes done
		SetStage(500)
	endif
endFunction

float NukeStrikeTimerMin = 0.015
float NukeStrikeTimerMax = 0.035

function StartNukeStrikeTimer()
	; min time is divided by total artillery, so you never get super fast strikes with only 1 gun
	float timerMin = Math.Max(NukeStrikeTimerMin * 3 / TotalArtillery, NukeStrikeTimerMin)
	float timerMax = Math.Max(NukeStrikeTimerMax * 3 / TotalArtillery, NukeStrikeTimerMax)

	float strikeTimer = utility.RandomFloat(timerMin, timerMax)
	debug.trace(self + "StartNukeStrikeTimer: min=" + timerMin + ", max=" + timerMax + ", TotalArtillery=" + TotalArtillery)
	debug.trace(self + "StartNukeStrikeTimer: STRIKE TIMER=" + (strikeTimer * 60) + " minutes (game time)")
	StartTimerGameTime(strikeTimer, NukeStrikeTimerID)
endFunction

