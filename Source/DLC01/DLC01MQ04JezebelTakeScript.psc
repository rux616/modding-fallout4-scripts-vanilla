Scriptname DLC01:DLC01MQ04JezebelTakeScript extends ObjectReference 

quest property DLC01MQ04 auto 

auto state waiting
Event OnActivate(ObjectReference akActionRef)
    if akActionRef == Game.getPlayer()
    	gotostate("Done")
    	DLC01MQ04.setstage(150)
    endif

EndEvent
endstate

state done
	;do nothing
endstate
