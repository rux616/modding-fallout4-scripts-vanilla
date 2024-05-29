ScriptName RECampQuestScript extends Quest
{Script for RECamp quest management.}

; In Camp REs, we need to wait for the aliases to initialize, then set stage 11 to enable or disable them appropriately.

ReferenceAlias property myContainer auto

Event OnInit()
	While (myContainer.GetReference() == None && Self.IsRunning())
		Debug.Trace("Waiting...")
		Utility.Wait(1)
	EndWhile
	Debug.Trace("Setting Stage.")
	SetStage(11)
EndEvent