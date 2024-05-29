Scriptname MQ203ActivationBlockerScript extends ReferenceAlias
{for MQ203 refs
blocks activation
also (optionally?) gives Kellogg voiceover when activated}

event OnAliasInit()
	if bInitialized == false
		ObjectReference myRef = GetRef()
		if myRef
			bInitialized = true
			myRef.BlockActivation(abBlocked = true, abhideActivateText = hideActivateText)
			debug.trace(self + " OnAliasInit: IsActivationBlocked = " + GetRef().IsActivationBlocked() )
			if useTextOverride
				myRef.SetActivateTextOverride((GetOwningQuest() as MQ203Script).MQ203ActivationText)
			endif
		endif
	endif
endevent

Auto State Ready
	Event OnActivate(ObjectReference akActionRef)
		gotoState("Busy")
		debug.trace(self + " OnActivate by " + akActionRef + ": IsActivationBlocked = " + GetRef().IsActivationBlocked() )
	    if akActionRef == Game.GetPlayer()
	    	if VoiceoverScene
	    		(GetOwningQuest() as MQ203Script).StartVoiceover(VoiceoverScene, MemoryID)
	    	endif
	    endif
		gotoState("Ready")
	EndEvent
endState

State Busy
	Event OnActivate(ObjectReference akActionRef)
		; do nothing while busy
	endEvent
endState

function HideActivation(bool bHide)
	ObjectReference myRef = GetRef()
	if myRef
		bool shouldHideActivationText = (bHide || hideActivateText)
		debug.trace(self + "HideActivation: shouldHideActivationText= " + shouldHideActivationText )
		myRef.BlockActivation(abBlocked = true, abhideActivateText = shouldHideActivationText )
	endif
endFunction

Scene Property VoiceoverScene const auto
{ optional - voiceover scene to play when activated }

int property MemoryID const auto
{ if I have a voiceover scene, what memoryID does this go with? }

bool property hideActivateText const auto
{ true = don't show activation text on rollover }

bool property useTextOverride = true const auto
{ true = use default text override from MQ203Script }

bool bInitialized = false	; set to true when successfully initialized (e.g. ref is in alias)
