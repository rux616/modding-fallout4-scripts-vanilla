Scriptname RR102UpstairsTriggerScript extends ObjectReference Conditional

GlobalVariable Property pRR102SwitchboardUpstairs Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
    	pRR102SwitchboardUpstairs.SetValue(1)
    endif
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
    	pRR102SwitchboardUpstairs.SetValue(0)
    endif
EndEvent