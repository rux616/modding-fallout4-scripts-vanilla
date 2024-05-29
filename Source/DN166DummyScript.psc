Scriptname DN166DummyScript extends ObjectReference Hidden Conditional

Keyword Property LinkCustom01 const auto
{Links through all the doors that are to be opened/closed based on launch state.}
Keyword Property LinkCustom02 const auto
{Links through all the klaxon lights, so we can turn them on/off based on launch state.}
Keyword Property LinkCustom03 const auto
{Links through all the klaxon sounds markers so we can turn them on/off based on launch state.}
ObjectReference Property ElevatorScript const auto

Bool LaunchState = TRUE Conditional

Event OnLoad()
    if LaunchState
    	int count = 0
		int countmax = CountLinkedRefChain(LinkCustom02)
	debug.Trace(self + "Counted " + countmax + " lights.")
		while (count < countmax)
			count += 1
			GetNthLinkedRef(count, LinkCustom02).GetLinkedRef().Enable()
			GetNthLinkedRef(count, LinkCustom02).PlayAnimation("Stage2")
			GetNthLinkedRef(count, LinkCustom02).GetLinkedRef().PlayAnimation("Stage2")
			debug.Trace(self + "Turning on Klaxon light " + GetNthLinkedRef(count, LinkCustom02))
		endwhile
	endif
EndEvent

Function StartLaunchSequence()
	debug.Trace(self + "Launch Started")
	LaunchState = TRUE
	(ElevatorScript as ElevatorMasterScript).MakeElevatorNonFunctional()

	int count = 0
	int countmax = CountLinkedRefChain(LinkCustom01)
	debug.Trace(self + "Counted " + countmax + " doors.")
	while (count < countmax)
		count += 1
		;GetNthLinkedRef(count, LinkCustom01).SetOpen(FALSE)
		GetNthLinkedRef(count, LinkCustom01).PlayAnimation("Play02")
		(GetNthLinkedRef(count, LinkCustom01) as Default2StateActivator).IsOpen = FALSE
		debug.Trace(self + "Closing door " + GetNthLinkedRef(count, LinkCustom01))
	endwhile

	int countB = 0
	int countmaxB = CountLinkedRefChain(LinkCustom02)
	debug.Trace(self + "Counted " + countmaxB + " lights.")
	while (countB < countmaxB)
		countB += 1
		GetNthLinkedRef(countB, LinkCustom02).GetLinkedRef().Enable()
		GetNthLinkedRef(countB, LinkCustom02).PlayAnimation("Stage2")
		GetNthLinkedRef(countB, LinkCustom02).GetLinkedRef().PlayAnimation("Stage2")
		debug.Trace(self + "Turning on Klaxon light " + GetNthLinkedRef(countB, LinkCustom02))
	endwhile

	int countC = 0
	int countmaxC = CountLinkedRefChain(LinkCustom03)
	debug.Trace(self + "Counted " + countmaxC + " sounds.")
	while (countC < countmaxC)
		countC += 1
		GetNthLinkedRef(countC, LinkCustom03).EnableNoWait()
		debug.Trace(self + "Turning on Klaxon sound " + GetNthLinkedRef(countC, LinkCustom03))
	endwhile
EndFunction


Function StopLaunchSequence()
	debug.Trace(self + "Launch Stopped")
	LaunchState = FALSE
	(ElevatorScript as ElevatorMasterScript).MakeElevatorFunctional()

	int count = 0
	int countmax = CountLinkedRefChain(LinkCustom01)
	debug.Trace(self + "Counted " + countmax + " doors.")
	while (count < countmax)
		count += 1
		;GetNthLinkedRef(count, LinkCustom01).SetOpen()
		GetNthLinkedRef(count, LinkCustom01).PlayAnimation("Play01")
		(GetNthLinkedRef(count, LinkCustom01) as Default2StateActivator).IsOpen = TRUE
		debug.Trace(self + "Opening door " + GetNthLinkedRef(count, LinkCustom01))
	endwhile

	int countB = 0
	int countmaxB = CountLinkedRefChain(LinkCustom02)
	debug.Trace(self + "Counted " + countmaxB + " lights.")
	while (countB < countmaxB)
		countB += 1
		GetNthLinkedRef(countB, LinkCustom02).PlayAnimation("Reset")
		GetNthLinkedRef(countB, LinkCustom02).GetLinkedRef().PlayAnimation("Reset")
		GetNthLinkedRef(countB, LinkCustom02).GetLinkedRef().DisableNoWait()
		debug.Trace(self + "Turning off Klaxon light " + GetNthLinkedRef(countB, LinkCustom02))
	endwhile

	int countC = 0
	int countmaxC = CountLinkedRefChain(LinkCustom03)
	debug.Trace(self + "Counted " + countmaxC + " sounds.")
	while (countC < countmaxC)
		countC += 1
		GetNthLinkedRef(countC, LinkCustom03).DisableNoWait()
		debug.Trace(self + "Turning off Klaxon sound " + GetNthLinkedRef(countC, LinkCustom03))
	endwhile
EndFunction