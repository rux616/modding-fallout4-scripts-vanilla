Scriptname MinFlareGunQuestScript extends Quest

ReferenceAlias Property Workshop01 Auto Const
ReferenceAlias Property Flare Auto Const
WorkshopParentScript Property WorkshopParent auto const

ReferenceAlias[] Property MarkerAliases Auto Const

ReferenceAlias Property MinutemanLeader Auto Const
RefCollectionAlias Property Minutemen Auto Const
ReferenceAlias Property MinutemanDog Auto Const

GlobalVariable Property MinFlareGunCooldown auto const
{ set to next time flare gun can be used }

Activator Property MinFlareGunProjectileShooter auto const

int minMarkerDistance = 4000 const ; minimum distance of marker to start Minutemen at
int minFlareHeight = 500 const ; minimum height above player for flare to count as signal
float cooldownDays = 0.4 const ; a bit more than 8 hours of gametime between times when you can use flare gun

float minFlareResponseDays = 0.05 const
float maxFlareResponseDays = 0.1 const

bool minutemenResponded = false

function Initialize()
	; is flare high enough above player to count as "flare"?
	; NOTE - yes this means flares won't work when fired horizontally from the tops of tall buildings...
	ObjectReference flareRef = Flare.GetRef()
	float height = flareRef.GetPositionZ() - Game.GetPlayer().GetPositionZ()
	debug.trace(self + " Flare height = " + height)
	if height < minFlareHeight
		; run short timer, then stop
		StartTimerGameTime(0.01)
	else
		minutemenResponded = true

		; figure out where to place Minutemen, and how many to enable
		; first in array is closest, work your way down
		int i = 0
		bool foundMarker = false
		while i < MarkerAliases.Length && foundMarker == false
			ObjectReference marker = MarkerAliases[i].GetRef()
			if marker && marker.GetDistance(Game.GetPlayer()) > minMarkerDistance && Game.GetPlayer().HasDirectLOS(marker) == false && Game.GetPlayer().HasDetectionLOS(marker) == false
				foundMarker = true
				debug.trace(self + " found valid marker " + marker + " (distance=" + marker.GetDistance(game.Getplayer()) + ")")
				; move Minutemen here
				Minutemen.MoveAllTo(marker)
				MinutemanLeader.TryToMoveTo(marker)
				MinutemanDog.TryToMoveTo(marker)
			else
				debug.trace(self + " skipping marker " + marker + " (distance=" + marker.GetDistance(game.Getplayer()) + ")")
			endif
			i += 1
		endWhile

		; enable the minutemen
		MinutemanLeader.TryToEnable()
		MinutemanDog.TryToEnable()
		; how many others?
		ObjectReference workshopRef = Workshop01.GetRef()
		; get population of workshop settlement
		float population = workshopRef.GetValue(WorkshopParent.WorkshopRatings[WorkshopParent.WorkshopRatingPopulation].resourceValue) as int
		; max is +1 per 3 population:
		int populationBonus = Math.Ceiling(population/3.0)
		debug.trace(self + " population=" + population + ", bonus=" + populationBonus)
		int minCount = 1
		int maxCount = 1 + populationBonus
		int actualCount = Utility.RandomInt(minCount, maxCount)
		debug.trace(self + " actual count=" + actualCount)
		if actualCount >= Minutemen.GetCount()
			Minutemen.EnableAll()
		else
			i = 0
			while i < actualCount
				Minutemen.GetAt(i).Enable()
				i += 1
			endWhile
		endif

		; random wait
		StartTimerGameTime(utility.RandomFloat(minFlareResponseDays, maxFlareResponseDays))
	endif
endFunction

Event OnTimerGameTime(int aiTimerID)
	debug.trace(self + " start timer expired")
	if minutemenResponded
		; if leader not too close, fire flare
		ObjectReference leader = MinutemanLeader.GetRef()
		if leader.GetDistance(Game.GetPlayer()) > minMarkerDistance
			debug.trace(self + " leader is far enough away - fire flare")
			Game.GetPlayer().PlaceAtMe(MinFlareGunProjectileShooter)
		endif
	else
		debug.trace(self + " no one responding, stop quest")
		Stop()
	endif
EndEvent

function Shutdown()
	; set next available time global to current time + cooldownDays
	if minutemenResponded
		MinFlareGunCooldown.SetValue(Utility.GetCurrentGameTime() + cooldownDays)
	endif
endFunction