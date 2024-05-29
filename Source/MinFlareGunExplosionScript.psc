Scriptname MinFlareGunExplosionScript extends ObjectReference Const
{script for calling for Minuteman help with a flare gun
}

Keyword Property MinFlareGunStart Auto Const

Message Property MinFlareGunFailureMessage Auto Const Mandatory

Faction Property MinutemenFaction auto const Mandatory

Worldspace Property Commonwealth auto const Mandatory

Quest Property MinFlareGun auto const Mandatory

REParentScript Property REParent Auto const mandatory

event OnInit()
	; send RE cleanup event - try to stop flare gun quest if currently waiting to shut down
	REParent.SendCustomEvent("RECheckForCleanup")
	utility.wait(1.0)
	if MinFlareGunStart.SendStoryEventAndWait(akLoc = GetCurrentLocation(), akRef1 = self) == false
		debug.trace(self + " MinFlareGun didn't start")
		if GetWorldspace() == Commonwealth && Game.GetPlayer().IsInFaction(MinutemenFaction) && MinFlareGun.IsRunning() == false
			MinFlareGunFailureMessage.Show()
		endif
	endif
endEvent


