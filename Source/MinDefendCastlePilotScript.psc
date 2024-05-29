Scriptname MinDefendCastlePilotScript extends RefCollectionAlias
{alias script for vertibird pilot aliases; kills the vertibird when the aliased actor dies if the aliased actor was on a flying vertibird}

ObjectReference mount

Event OnGetUp(ObjectReference akSenderRef, ObjectReference akFurniture)
	mount = akFurniture
	Debug.Trace("A VBird pilot alias just got out of " + akFurniture)
	
	Actor mountActor
	mountActor = mount as Actor
	if( mountActor != none && mountActor.GetFlyingState() != 0 )
		debug.trace("Killing " + mountActor + " because its aliased pilot " + akSenderRef + " got out or was killed")
		mountActor.Kill()
	endif
endEvent