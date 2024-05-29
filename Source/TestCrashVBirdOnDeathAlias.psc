Scriptname TestCrashVBirdOnDeathAlias extends ReferenceAlias
{Put on a pilot alias. When the pilot dies, kills the vertibird its riding}

ObjectReference mount

Event OnGetUp(ObjectReference akFurniture)
	mount = akFurniture
	Debug.Trace("A VBird pilot alias just got out of " + akFurniture)
	
	Actor mountActor
	mountActor = mount as Actor
	if( mountActor != none && mountActor.GetFlyingState() != 0 && mountActor.GetFlyingState() != 5 )
		debug.trace("Killing " + mountActor + " because its aliased pilot " + Self + " got out or was killed")
		mountActor.Kill()
	endif
endEvent