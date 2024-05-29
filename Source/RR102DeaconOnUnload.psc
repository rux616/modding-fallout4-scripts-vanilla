Scriptname RR102DeaconOnUnload extends DefaultAlias Const Default
{This is to ensure that Deacon gets to Ricky no matter what.}

Quest Property pRR102 Auto Const

Event OnUnload()
	; Is Deacon heading to Ricky and hasn't talked with Ricky?
	if ( pRR102.GetStageDone(250) && !pRR102.GetStageDone(300) )
		pRR102.SetStage(290)
	endif
EndEvent