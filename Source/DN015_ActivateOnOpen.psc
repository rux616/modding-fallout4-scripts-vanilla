Scriptname DN015_ActivateOnOpen extends ObjectReference

String property OpenEvent = "Play01" Auto const

String property CloseEvent = "Play02" Auto Const

String property DoneEvent = "Done" Auto Const

Event OnCellAttach()
	Debug.Trace(self + ": Is running OnCellAttach")
	RegisterForAnimationEvent(Self, OpenEvent )
	RegisterForAnimationEvent(Self, CloseEvent )
	RegisterForAnimationEvent(Self, DoneEvent )
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	Debug.Trace(self + ": has received animation event " + asEventName + " from " + akSource)
	if asEventName == CloseEvent  || asEventName == OpenEvent || asEventName == DoneEvent 
		if GetLinkedRef()
			GetLinkedRef().Activate(GetLinkedRef())
		endif
	endif
EndEvent

Event OnCellDetach()
	Debug.Trace(self + ": Is running OnCellDetach")
	UnRegisterForAnimationEvent(Self, OpenEvent )
	UnRegisterForAnimationEvent(Self, CloseEvent )
	UnRegisterForAnimationEvent(Self, DoneEvent )
EndEvent