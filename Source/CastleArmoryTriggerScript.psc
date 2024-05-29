Scriptname CastleArmoryTriggerScript extends ObjectReference Const
{ replenish smoke flare container
}

Weapon Property ArtillerySmokeFlare Auto Const Mandatory
Weapon Property BoSVertibirdGrenade Auto Const Mandatory
Ammo Property AmmoFlareGun Auto Const Mandatory

Quest Property Min01 auto const Mandatory
GlobalVariable Property BoSFastTravelPilot auto const Mandatory
GlobalVariable Property MinArtilleryCanBuild auto const Mandatory

int maxCount = 10 const 	; how many do we keep in the container?
int maxCountVertibird = 6 const ; how many vertibird flares?

Event OnLoad()
	; enable when player has flare gun
	if IsEnabled() == false && Min01.GetStageDone(225)
		Enable()
	endif
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		debug.trace(self + " OnTriggerEnter " + akActionRef)
	    RefreshSmokeFlares()
	endif
EndEvent

Function RefreshSmokeFlares()
	ObjectReference smokeFlareContainer = GetLinkedRef()
    ; flare gun ammo
	int currentCount = smokeFlareContainer.GetItemCount(AmmoFlareGun)
    if currentCount < maxCount
    	smokeFlareContainer.AddItem(AmmoFlareGun, utility.RandomInt(1, maxCount))
    endif

	; if artillery available, refresh
    if MinArtilleryCanBuild.GetValue() == 1.0
	    currentCount = smokeFlareContainer.GetItemCount(ArtillerySmokeFlare)
	    if currentCount < maxCount
	    	smokeFlareContainer.AddItem(ArtillerySmokeFlare, maxCount - currentCount)
	    endif
	endif
    
    ; if Minutemen vertibird fast travel available, refresh those as well
    if BoSFastTravelPilot.GetValue() == 1.0
		currentCount = smokeFlareContainer.GetItemCount(BoSVertibirdGrenade)
		if currentCount < maxCountVertibird
			smokeFlareContainer.AddItem(BoSVertibirdGrenade, maxCountVertibird - currentCount)
		endif
    endif
endFunction