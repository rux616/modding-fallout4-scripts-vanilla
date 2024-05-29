Scriptname DLC06:DLC06WorkshopPowerbikeFXScript extends ObjectReference Const

EffectShader property ShockDamageFXS auto const mandatory 

Event OnWorkshopObjectRepaired(ObjectReference akReference)
	ShockDamageFXS.Stop(self)
endEvent

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	if IsDestroyed()
		ShockDamageFXS.Play(self)
	endif 
endEvent
