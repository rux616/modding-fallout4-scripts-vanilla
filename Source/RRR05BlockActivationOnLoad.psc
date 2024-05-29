Scriptname RRR05BlockActivationOnLoad extends ObjectReference default
{Blocks activation once on load.}

bool property bHideActivationText = true const auto
bool property HasLoaded = false auto

Event OnLoad()
	if !HasLoaded
		HasLoaded = TRUE
    	BlockActivation(TRUE,bHideActivationText)
    endif
EndEvent

Event OnActivate(ObjectReference akActionRef)
    debug.trace(self + " OnActivate " + akActionRef)
EndEvent