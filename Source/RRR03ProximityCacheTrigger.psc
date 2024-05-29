Scriptname RRR03ProximityCacheTrigger extends ObjectReference Const Default
{Default script used for checking if a reference entered this trigger, and optionally what Triggered it.}

Group Required_Properties
	Quest Property pRRR03 Auto Const
	{Cache quest}

	Form Property pRRR03RFIDDevice Auto Const
	{The device that opens caches}
EndGroup

Event OnTriggerEnter(ObjectReference akActionRef)

	Debug.Trace("In RRR03 Trigger")

	; Did the player trigger this? And does he have the cache opening device?
	if ( akActionRef == Game.GetPlayer() && Game.GetPlayer().GetItemCount(pRRR03RFIDDevice) > 0)
		; Open the door automatically
		GetLinkedRef().PlayAnimation("Play01")

		; Flag that it's been opened
		pRRR03.SetStage(200)

		; Make it so this won't fire again
		Disable()
	endif

EndEvent