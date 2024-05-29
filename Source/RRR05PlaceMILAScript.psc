Scriptname RRR05PlaceMILAScript extends ObjectReference Conditional

Quest Property pRRR05 Auto Const Mandatory


Event OnLoad()

	; If RRR05 is running then you can place your MILA here
	if ( pRRR05.IsRunning() )
		BlockActivation(FALSE)
	else
		BlockActivation(TRUE, TRUE)
	endif

EndEvent
