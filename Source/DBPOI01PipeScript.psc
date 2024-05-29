Scriptname DBPOI01PipeScript extends ObjectReference Hidden

Message Property DBPOI01PipeMessage Auto Const Mandatory
Keyword Property LinkCustom01 Auto Const Mandatory

auto STATE Sealed
	Event OnLoad()
	    RegisterForRemoteEvent(GetLinkedRef(), "OnActivate")
	    BlockActivation()
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
	    if akActionRef == Game.GetPlayer()
	    	DBPOI01PipeMessage.Show()
	    endif
	EndEvent

	Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
		if akSender == GetLinkedRef()
			GoToState("UnSealed")
			GetLinkedRef().GetLinkedRef().DisableNoWait()
			Game.ShakeCamera(Game.GetPlayer(), 0.2, 0.1)
			Game.ShakeController(0.2, 0.2, 0.1)
	    	UnregisterForRemoteEvent(GetLinkedRef(), "OnActivate")
	    	BlockActivation(FALSE, FALSE)
		endif
	EndEvent
EndSTATE

STATE UnSealed
	Event OnActivate(ObjectReference akActionRef)
		(GetLinkedRef(LinkCustom01) as DefaultDisableHavokOnLoad).ReleaseToHavok()
	EndEvent
EndSTATE

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)

EndEvent