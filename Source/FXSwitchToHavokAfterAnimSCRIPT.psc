Scriptname FXSwitchToHavokAfterAnimSCRIPT extends ObjectReference
{Switches to havok after anim is played.}

Event OnLoad()
	if Is3dLoaded()
    	SetMotionType(self.Motion_Keyframed)
    	RegisterForHitEvent(self)
    endIf
EndEvent

Event OnUnload()
	UnregisterForAllHitEvents()
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	PlayAnimation("stage2")
	utility.wait(0.75)
    SetMotionType(self.Motion_Dynamic)
EndEvent
