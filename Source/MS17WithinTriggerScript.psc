Scriptname MS17WithinTriggerScript extends ObjectReference Conditional


Event OnTriggerEnter(ObjectReference akActionRef)
	if ( akActionRef == Game.GetPlayer() )
		if (TriggerNumber == 1 )    ; Are you in the first trigger?
			pDialogueCovenant.InsideShop01 = 1    ; TRUE for being inside
		elseif ( TriggerNumber == 2 )
			pDialogueCovenant.InsideShop02 = 1
		elseif ( TriggerNumber == 3 )
			pDialogueCovenant.InsideOffice01 = 1
		else
			pDialogueCovenant.InsideOffice01 = 1
		endif		
	EndIf
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	if ( akActionRef == Game.GetPlayer() )
		if ( TriggerNumber == 1 )
			pDialogueCovenant.InsideShop01 = 0   	; FALSE for being inside
		elseif ( TriggerNumber == 2 )
			pDialogueCovenant.InsideShop02 = 0
		elseif ( TriggerNumber == 3 )
			pDialogueCovenant.InsideOffice01 = 0
		else
			pDialogueCovenant.InsideOffice01 = 0
		endif		
	EndIf
EndEvent

Int Property TriggerNumber Auto Conditional
DialogueCovenantScript Property pDialogueCovenant Auto Const
