Scriptname DLC04:WW_StartCritterHunt extends ObjectReference Const

Quest Property DLC04_WW02 Auto Const Mandatory

Int Property stage = 50 Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()

    	DLC04_WW02.SetStage(50)

    endif
EndEvent
