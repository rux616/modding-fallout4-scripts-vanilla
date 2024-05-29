Scriptname MQ203NeuronBridgeScript extends ObjectReference

bool property isVisible auto
{ set to true when MakeVisible called - collision script checks this }

Event OnCellLoad()
;	debug.trace(self + " OnCellLoad")
    MQ203NeuronBridgeScript myBridge = GetLinkedRef() as MQ203NeuronBridgeScript
    if myBridge
;		debug.trace(self + " OnCellLoad: linked to " + myBridge)
    	if myBridge.isVisible
    		MakeVisible()
    	else
;			debug.trace(self + " OnCellLoad: register for 'Stage3' animation event from " + myBridge)
    		RegisterForAnimationEvent(myBridge, "Stage3")
    	endif
    endif
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	debug.trace(self + " akSource=" + akSource + ", event=" + asEventName)
	if asEventName == "Stage3"
		MakeVisible()
	endif
EndEvent

function MakeVisible()
	debug.trace(self + " MakeVisible")
	if !isVisible
		isVisible = true
		PlayAnimation("stage2")
	endif
endFunction
