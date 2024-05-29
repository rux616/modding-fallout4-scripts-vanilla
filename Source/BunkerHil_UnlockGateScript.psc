Scriptname BunkerHil_UnlockGateScript extends ObjectReference

Keyword Property LinkCustom01 Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
    if (akActionRef == Game.GetPlayer())
    	getlinkedref(LinkCustom01).Unlock()
    	utility.wait(0.1)
    	Delete()
    endif
EndEvent
