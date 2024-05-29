Scriptname DN054PumpWidgetTriggerScript extends ObjectReference Const

quest property DN054 auto const

Event OnActivate(ObjectReference akActionRef)
    if DN054.getstage() == 50 && akActionRef == game.getplayer()
    	Dn054.setstage(55)
    	self.disable()
    endif
EndEvent