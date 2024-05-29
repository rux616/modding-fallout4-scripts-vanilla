Scriptname dismemberOnDeathSCRIPT extends ActiveMagicEffect

BOOL PROPERTY bEXPLODE = FALSE AUTO
{should we explode the parts?}

BOOL PROPERTY bDISMEMBER = TRUE AUTO
{do we force dismember?}

; // keep track of who to kill
ACTOR Victim

EVENT OnEffectStart(Actor Target, Actor Caster)
	victim = target

ENDEVENT

EVENT OnDying(Actor Killer)

	; // try to dismember/explode every single part of the victim
	victim.Dismember("Head1", bEXPLODE, bDISMEMBER)
	victim.Dismember("Head2", bEXPLODE, bDISMEMBER)
	victim.Dismember("LeftArm1", bEXPLODE, bDISMEMBER)
	victim.Dismember("LeftArm2", bEXPLODE, bDISMEMBER)
	victim.Dismember("RightArm1", bEXPLODE, bDISMEMBER)
	victim.Dismember("RightArm2", bEXPLODE, bDISMEMBER)
	victim.Dismember("LeftLeg1", bEXPLODE, bDISMEMBER)
	victim.Dismember("LeftLeg2", bEXPLODE, bDISMEMBER)
	victim.Dismember("LeftLeg3", bEXPLODE, bDISMEMBER)
	victim.Dismember("RightLeg1", bEXPLODE, bDISMEMBER)
	victim.Dismember("RightLeg2", bEXPLODE, bDISMEMBER)
	victim.Dismember("RightLeg3", bEXPLODE, bDISMEMBER)
	victim.Dismember("Left Foot", bEXPLODE, bDISMEMBER)
	victim.Dismember("Right Foot", bEXPLODE, bDISMEMBER)

ENDEVENT