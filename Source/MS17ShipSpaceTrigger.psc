Scriptname MS17ShipSpaceTrigger extends ObjectReference Conditional

GlobalVariable Property pMS11OnShip Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
	if ( akActionRef == Game.GetPlayer() )
		pMS11OnShip.SetValue(1)
	EndIf
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	if ( akActionRef == Game.GetPlayer() )
		pMS11OnShip.SetValue(0)
	EndIf
EndEvent