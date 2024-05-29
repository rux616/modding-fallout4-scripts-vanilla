Scriptname FXDismemberOnDeath extends ActiveMagicEffect 
{Limbs will fall off on death.}


actor Victim

;======================================================================================;
;   EVENTS     /
;=============/

Event OnEffectStart(Actor Target, Actor Caster)
	victim = target
EndEvent

Event OnDying(Actor Killer)
	DismemberAllParts(Victim, FALSE, TRUE)
EndEvent

function DismemberAllParts(Actor TargetVictim, bool DoExplode, bool DoForceDismem)
	TargetVictim.Dismember("Head1", DoExplode, DoForceDismem)
	TargetVictim.Dismember("Head2", DoExplode, DoForceDismem)
	TargetVictim.Dismember("LeftArm1", DoExplode, DoForceDismem)
	TargetVictim.Dismember("RightArm1", DoExplode, DoForceDismem)
	TargetVictim.Dismember("LeftLeg1", DoExplode, DoForceDismem)
	TargetVictim.Dismember("RightLeg1", DoExplode, DoForceDismem)
endfunction
