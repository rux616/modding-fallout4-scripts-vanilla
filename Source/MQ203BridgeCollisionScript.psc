Scriptname MQ203BridgeCollisionScript extends ObjectReference
{watch for event from linked bridge}

bool isWalkable = false

Event OnCellLoad()
    MQ203NeuronBridgeScript myBridge = GetLinkedRef() as MQ203NeuronBridgeScript
    debug.trace(self + " OnCellLoad - myBridge=" + myBridge)
    if myBridge
    	if myBridge.isVisible
    		MakeWalkable()
    	else
    		RegisterForAnimationEvent(myBridge, "Stage3")
    	endif
    endif
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	debug.trace(self + " akSource=" + akSource + ", event=" + asEventName)
	if asEventName == "Stage3"
		MakeWalkable()
	endif
EndEvent

function MakeWalkable()
	debug.trace(self + " MakeWalkable")
	if !isWalkable
		isWalkable = true
		PlayAnimation("Stage2")
	endif
endFunction