Scriptname MirelurkHypnosisTowerSCRIPT extends ObjectReference Hidden

Explosion Property DN138MirelurkTowerExplosion Auto

Event OnLoad()
    if Is3DLoaded()
        RegisterForHitEvent(self) ; let us know when we're hit
    endIf
EndEvent

Event OnUnload()
    UnregisterForAllHitEvents()
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
    (GetLinkedRef() as MirelurkHypnosisTowerTrigScript).GoToState("MakeAngry")
    self.PlaceAtMe(DN138MirelurkTowerExplosion)
    self.DisableNoWait()
    GetLinkedRef().DisableNoWait()
    GetLinkedRef().EnableNoWait()
EndEvent

Event OnActivate(ObjectReference akActionRef)
    (GetLinkedRef() as MirelurkHypnosisTowerTrigScript).GoToState("MakeAngry")
    self.DisableNoWait()
    GetLinkedRef().DisableNoWait()
    GetLinkedRef().EnableNoWait()
EndEvent

Function DestroyTower()
	(GetLinkedRef() as MirelurkHypnosisTowerTrigScript).GoToState("MakeAngry")
    self.PlaceAtMe(DN138MirelurkTowerExplosion)
    self.DisableNoWait()
    GetLinkedRef().DisableNoWait()
    GetLinkedRef().EnableNoWait()
EndFunction

Function EnhanceGas()
	(GetLinkedRef() as MirelurkHypnosisTowerTrigScript).GoToState("MakeSleepy")
    self.PlaceAtMe(DN138MirelurkTowerExplosion)
    self.DisableNoWait()
    GetLinkedRef().DisableNoWait()
    GetLinkedRef().EnableNoWait()
EndFunction