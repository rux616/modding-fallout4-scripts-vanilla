Scriptname RR101BlockActivationScript extends ObjectReference
{Blocks activation once on load.}

; quests
Quest Property pRR101 Auto Const

Bool HasLoaded = FALSE

Event OnLoad()
	if ( !pRR101.GetStageDone(110) )
    	BlockActivation(TRUE,TRUE)
    endif
	HasLoaded = TRUE
EndEvent