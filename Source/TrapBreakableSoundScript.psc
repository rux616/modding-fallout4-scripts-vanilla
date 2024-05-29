Scriptname TrapBreakableSoundScript extends ObjectReference Const


sound Property breakSound const auto

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
    if aiCurrentStage == 1
    	ObjectReference objself = self as ObjectReference
    	breakSound.Play(objself)
    	UnRegisterForHitEvent(Self)
    endif
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  			bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	debug.Trace(Self + ": OnHit")
	DamageObject(utility.Randomint(35, 100))


	RegisterForHitEvent(Self)

EndEvent



Event OnLoad()
	if GetCurrentDestructionStage() != 1
		RegisterForHitEvent(Self)
	endif
EndEvent

Event OnUnload()
	UnRegisterForHitEvent(Self)
EndEvent