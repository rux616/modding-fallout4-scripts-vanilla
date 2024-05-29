Scriptname DLC03:VRDefenderScript extends Actor Const

DLC03:MQ04MasterScript property MQ04 auto const mandatory

Event OnLoad()
	debug.trace(self + " OnLoad")
	SetNoBleedoutRecovery(true)
EndEvent

Event OnWorkshopObjectPlaced(ObjectReference akReference)
	EvaluatePackage(true)
EndEvent

Function HandleBleedout(bool bEnterBleedout = true)
	debug.trace(self + " HandleBleedout " + bEnterBleedout)
	SetUnconscious(bEnterBleedout)
	debug.trace(self + " IsUnconscious=" + IsUnconscious())
	if bEnterBleedout == false
		Repair()
	endif
endFunction

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	debug.trace(self + " OnCombatStateChanged akTarget=" + akTarget + " aeCombatState=" + aeCombatState)
	if aeCombatState > 0
	    MQ04.StartVOScene(self, MQ04.VOScene02_StartCombat)
	endif
EndEvent
