Scriptname DN143HologramProjectorScript extends ObjectReference Hidden


Event OnLoad()
	if GetLinkedRef().Is3DLoaded()
		PlayAnimation("Reset")
	else
		PlayAnimation("Disarm")
	endif
	RegisterForRemoteEvent(GetLinkedRef(), "OnLoad")
	;RegisterForRemoteEvent(GetLinkedRef(), "OnUnLoad")
	;RegisterForRemoteEvent(GetLinkedRef(), "OnHit")
	RegisterForHitEvent(GetLinkedRef())
EndEvent

Event OnUnLoad()
	UnregisterForRemoteEvent(GetLinkedRef(), "OnLoad")
	;UnregisterForRemoteEvent(GetLinkedRef(), "OnUnLoad")
	;UnregisterForRemoteEvent(GetLinkedRef(), "OnHit")
	UnregisterForHitEvent(GetLinkedRef())
EndEvent

Event ObjectReference.OnLoad(objectReference akSender)
	if GetLinkedRef().Is3DLoaded()
		if Is3DLoaded()
			PlayAnimation("Reset")
		endif
	endif
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	if akTarget == GetLinkedRef()
		PlayAnimation("Disarm")
	endif
EndEvent

;Event ObjectReference.OnUnLoad(objectReference akSender)
	;if Is3DLoaded()
		;PlayAnimation("Disarm")
	;endif
;EndEvent