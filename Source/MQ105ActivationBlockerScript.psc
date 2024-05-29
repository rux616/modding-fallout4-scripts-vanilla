Scriptname MQ105ActivationBlockerScript extends ReferenceAlias
{for memory refs
blocks activation
also (optionally?) gives player voiceover when activated}

event OnAliasInit()
	Initialize()
endevent

Event OnActivate(ObjectReference akActionRef)
	debug.trace(self + " OnActivate by " + akActionRef + ": IsActivationBlocked = " + GetRef().IsActivationBlocked() )
    if akActionRef == Game.GetPlayer()
    	if VoiceoverScene
    		VoiceoverScene.Start()
    	endif
    endif
EndEvent

; need to call this often after OnAliasInit because most aliases are filled after quest starts (linked external aliases)
function Initialize()
	if bInitialized == false
		ObjectReference myRef = GetRef()
		if myRef
			bInitialized = true
			myRef.BlockActivation(abBlocked = true, abhideActivateText = hideActivateText)
			debug.trace(self + " OnAliasInit: IsActivationBlocked = " + GetRef().IsActivationBlocked() )
			myRef.SetActivateTextOverride((GetOwningQuest() as FFGoodneighbor01MemorySequenceScript).MQ105ActivationText)
		else
			debug.trace(self + " OnAliasInit: EMPTY ALIAS - DO NOTHING")
		endif
	endif
endFunction

Scene Property VoiceoverScene const auto
{ optional - voiceover scene to play when activated }

bool property hideActivateText const auto
{ true = don't show activation text on rollover }

bool bInitialized = false	; set to true when successfully initialized (e.g. ref is in alias)
