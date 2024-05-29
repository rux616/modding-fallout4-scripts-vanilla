Scriptname DLC03:DLC03MQ03IsPlayerInRoomScript extends ObjectReference Const

;the global we're setting to tell if the player is in the specified room
GlobalVariable Property MyPlayerInRoomGlobal Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
	;Interaction conditions filter for the player, but check anyway
	If akActionRef == Game.GetPlayer()
		;and now check if the player is actually in the trigger in case we get the events in the wrong order
		If GetTriggerObjectCount() == 1
			MyPlayerInRoomGlobal.SetValueInt(1)
		EndIf
	EndIf
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	;Interaction conditions filter for the player, but check anyway
	If akActionRef == Game.GetPlayer()
		;and now check if the player is actually NOT in the trigger in case we get the events in the wrong order
		If GetTriggerObjectCount() == 0
			MyPlayerInRoomGlobal.SetValueInt(0)
		EndIf
	EndIf
EndEvent