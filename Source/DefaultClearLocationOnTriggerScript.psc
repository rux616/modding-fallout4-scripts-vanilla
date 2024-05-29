Scriptname DefaultClearLocationOnTriggerScript extends ObjectReference default

Location Property LocationToClear Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
    	LocationToClear.SetCleared()
    	self.DisableNoWait()
    	self.Delete()
    endif
EndEvent