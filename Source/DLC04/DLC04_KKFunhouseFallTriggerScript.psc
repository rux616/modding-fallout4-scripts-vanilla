Scriptname DLC04:DLC04_KKFunhouseFallTriggerScript extends DLC04:DLC04KiddieKingdomPATrigParent Const


ActorValue Property DLC04_KKFunhouseFall Auto Const Mandatory
bool Property isTubeTrigger = true Auto Const
float Property myWaitTime = 0.5 Auto Const

Event onTriggerEnter(objectReference akTriggerRef)
	if isTubeTrigger	
		(akTriggerRef as Actor).SetValue(DLC04_KKFunhouseFall, 1)
	elseif (akTriggerRef as Actor).GetValue(DLC04_KKFunhouseFall) == 1
		SendPAScene()
	Endif
EndEvent


Event onTriggerLeave(objectReference akTriggerRef)
	if isTubeTrigger
		utility.Wait(myWaitTime)
		if GetTriggerObjectCount() <= 0
			(akTriggerRef as Actor).SetValue(DLC04_KKFunhouseFall, 0)
		endif
	endif
EndEvent