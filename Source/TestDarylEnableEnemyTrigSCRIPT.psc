Scriptname TestDarylEnableEnemyTrigSCRIPT extends ObjectReference Hidden

;Actors that should be moved to their own LinkCustom01 when this trigger is entered by the player.
Keyword Property LinkCustom01 Auto Const
Keyword Property LinkCustom02 Auto Const
Keyword Property LinkCustom03 Auto Const
Keyword Property LinkCustom04 Auto Const

Bool DoOnce = FALSE


auto STATE WaitingForTrigger
	Event OnTriggerEnter(ObjectReference akActionRef)
		if DoOnce == FALSE
		DoOnce = TRUE
			GoToState("DoneWaiting")
			TryToEnableActors(GetLinkedRef(LinkCustom01))
			TryToEnableActors(GetLinkedRef(LinkCustom02))
			TryToEnableActors(GetLinkedRef(LinkCustom03))
			TryToEnableActors(GetLinkedRef(LinkCustom04))
		endif
	EndEvent
EndSTATE


STATE DoneWaiting
	; Empty State
EndSTATE


Function TryToEnableActors(ObjectReference RefToEnable)
	debug.Trace(self + " TryToEnableActors()")
	if RefToEnable
		debug.Trace(self + " TryToEnableActors(): Enabling " + RefToEnable)
		RefToEnable.Moveto(RefToEnable.GetLinkedRef(LinkCustom01))
		RefToEnable.EnableNoWait()
	endif
EndFunction