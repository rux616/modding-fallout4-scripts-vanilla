Scriptname Dn011TempTurretSCRIPT extends actor Hidden Const

Event OnLoad()
	if Is3dLoaded()
		self.MoveToMyEditorLocation()
		RegisterForHitEvent(self) ; listen for a single hit
	endIf
EndEvent

Event OnUnload()
	UnregisterForAllHitEvents()
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
    self.MoveToMyEditorLocation()
    RegisterForHitEvent(self) ; ready for another hit
EndEvent