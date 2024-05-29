Scriptname BoSVertibirdSmokeGrenadeScript extends ObjectReference Const

Keyword Property BoSVertibirdGrenadeKW Auto Const
message Property VFTNoLandingMessage Auto Const
message Property VFTInProgressMessage Auto Const
message Property VFTDispatchMessage Auto Const
Quest Property VFT Auto Const
GlobalVariable Property BoSFastTravelCanUse auto const mandatory

event OnInit()

	if VFT.IsRunning() == 1
		VFTInProgressMessage.Show()
	elseif VFT.IsRunning() == 0 && BoSFastTravelCanUse.GetValue() > 0
		debug.tracefunction()
		debug.trace("VFT SMOKE WORKED")
		float[] safePoint = GetSafePosition()
		if safePoint
			; only show message if quest successfully starts
			if BoSVertibirdGrenadeKW.SendStoryEventAndWait(akLoc = GetCurrentLocation(), akRef1 = self)
				VFTDispatchMessage.Show()
			;WJS - make sure you get the No Landing message if the quest can't start
			Else
				debug.trace("VFT SMOKE FAILED")
				VFTNoLandingMessage.Show()
			endif
		else
			debug.trace("VFT SMOKE FAILED")
			VFTNoLandingMessage.Show()
		endif
	endif
endEvent