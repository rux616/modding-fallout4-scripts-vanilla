Scriptname DLC04:DLC04_GMMTurnOffFlamethrowerTrap extends ObjectReference Const

Keyword Property LinkCustom01 Auto Const

Event OnActivate(ObjectReference akActionRef)

	debug.trace(self + " has been activated by " + akActionRef)

    ObjectReference[] LinkedRefs = GetLinkedRefChain(LinkCustom01)
	int i = 0
	while (i < LinkedRefs.length)
		LinkedRefs[i].Activate(Self)
		i += 1
	endwhile
EndEvent

