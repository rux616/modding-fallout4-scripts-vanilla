ScriptName DN121MoltenMetalTriggerScript Extends ObjectReference
{This script handles dealing damage to actors that enter the molten metal in the Ironworks
	It should be set to filter only for actors}

Spell Property CritFire Auto Const

Event OnTriggerEnter(objectReference triggerRef)
	Debug.Trace(Self + ": Has Received OnTriggerEnter from >> " + triggerRef)
	(TriggerRef as Actor).DoCombatSpellApply(CritFire, triggerRef)
	(TriggerRef as Actor).kill()
EndEvent

Event OnTriggerLeave(objectReference triggerRef)
	Debug.Trace(Self + ": Has Received OnTriggerLeave from >> " + triggerRef)
EndEvent