Scriptname RR101SpinnerActivatorScript extends ObjectReference Conditional

ObjectReference Property pRR101PuzzleRingActivator Auto Const
Bool Property bClockwise = False Auto Conditional

auto STATE waitingForPlayer
	EVENT onActivate(objectReference triggerRef)

		(pRR101PuzzleRingActivator as RR101TrailSping).SpinLetters(bClockwise)

	endEVENT
endSTATE
