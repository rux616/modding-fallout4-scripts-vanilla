Scriptname DN050ContrabandScript extends ObjectReference 

ObjectReference property DN050Safe auto
quest property DN050 auto
globalvariable property DN050ContrabandGlobal auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == DN050Safe || game.getPlayer()
		DN050ContrabandGlobal.Mod(1)
		if DN050ContrabandGlobal.getValue() == 3
			DN050.setstage(45)
		endif
	endif
EndEvent

