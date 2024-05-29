Scriptname ConcordMuseumLightDisplay extends ObjectReference Hidden


Form Property XMarker Auto

Form Property ConcordMuseumSparksActivator Auto

Sound Property FXBulletImpactGlass Auto
Sound Property OBJRadioKnobOn Auto

Float Property MaxTimeBetweenLights = 0.2 Auto
Float Property MinTimeBetweenLights = 0.1 Auto


Int CurrentLink
Int MaxLinks


Event OnTriggerEnter(ObjectReference akActionRef)
    TurnOnLights()
EndEvent

Function TurnOnLights()
	CurrentLink = 1
	MaxLinks = CountLinkedRefChain()
	While CurrentLink <= MaxLinks

		utility.Wait(utility.RandomFloat(MinTimeBetweenLights, MaxTimeBetweenLights))

		if GetNthLinkedRef(CurrentLink).GetBaseObject() == XMarker
			GetNthLinkedRef(CurrentLink).EnableNoWait()
			int LightOnInstanceID = OBJRadioKnobOn.Play(GetNthLinkedRef(CurrentLink))
			Sound.SetInstanceVolume(LightOnInstanceID, 1)
		;elseif GetNthLinkedRef(CurrentLink).GetBaseObject() == ConcordMuseumSparksActivator
			;int SparksInstanceID = FXBulletImpactGlass.Play(GetNthLinkedRef(CurrentLink))
			;Sound.SetInstanceVolume(SparksInstanceID, 1)
			;GetNthLinkedRef(CurrentLink).PlayAnimation("Stage2")
			;(GetNthLinkedRef(CurrentLink) as ConcordMuseumLightSparks).EnableDisableLight()
		endif

		CurrentLink = CurrentLink + 1
	EndWhile

	DisableNoWait()
	Delete()

EndFunction