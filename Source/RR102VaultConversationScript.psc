Scriptname RR102VaultConversationScript extends ObjectReference Conditional

Quest Property pRR102 Auto Const Mandatory


Event OnTriggerEnter(ObjectReference akActionRef)

	if ( akActionRef == Game.GetPlayer() )
		; If you killed the final robots AND Deacon is inside Switchboard
		if ( pRR102.GetStageDone(590) && pRR102.GetStageDone(500) )
			pRR102.SetStage(600)   ; Then have Deacon start speaking
		endif
	endif

EndEvent