Scriptname MS17BlockActivationScript extends ObjectReference
{Blocks activation once on load.}

MS17QuestScript Property MS17Quest Auto Const

Bool HasLoaded = FALSE

Event OnLoad()
	if !HasLoaded
		RegisterForCustomEvent(MS17Quest, "MS17Investigate")

		Debug.Trace("MS17BlockActivationScript running.")

		HasLoaded = TRUE
    	BlockActivation(TRUE,TRUE)
    endif
EndEvent

Event MS17QuestScript.MS17Investigate(MS17QuestScript akSender, Var[] akArgs)
	if (akArgs[0]  as Bool) == TRUE
		BlockActivation(FALSE)
	else
		BlockActivation(TRUE,TRUE)
		UnregisterForCustomEvent(MS17Quest, "MS17Investigate")	
	endif
EndEvent
