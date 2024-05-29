Scriptname TestWorkshopTerminalScript extends ObjectReference Const
; script to give a temp stats message about the current workshop

WorkshopParentScript Property WorkshopParent Auto Const

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
;		debug.trace(self + " displaying message " + TestWorkshopTerminalMessage01)
		int button = TestWorkshopTerminalMessage01.Show()
		utility.wait(0.1)
;		debug.trace(self + " button a=" + button)
;		debug.trace(self + " displaying message " + TestWorkshopTerminalMessage02)
		button = TestWorkshopTerminalMessage02.Show()
;		debug.trace(self + " button b=" + button)
;		debug.trace(self + " displaying message " + TestWorkshopTerminalMessage03)
		utility.wait(0.1)
		button = TestWorkshopTerminalMessage03.Show()
;		debug.trace(self + " button c=" + button)
		if button == 1
			; daily update
			WorkshopParent.DailyWorkshopUpdate()
;			TestWorkshopUpdateDoneMessage.Show()
		elseif button == 2
			; trigger attack
			WorkshopParent.TestForceAttack()
		endif
	endif
EndEvent

Message Property TestWorkshopTerminalMessage01 Auto Const
Message Property TestWorkshopTerminalMessage02 Auto Const
Message Property TestWorkshopTerminalMessage03 Auto Const
Message Property TestWorkshopUpdateDoneMessage const auto

FormList Property TestWorkshopStatsGlobals Auto Const
