Scriptname Dun045_FHPuzzleActivatorScript extends ObjectReference

ObjectReference Property Enable01 Auto Const

ObjectReference Property Enable02 Auto Const

ObjectReference Property Disable01 Auto Const

ObjectReference Property Disable02 Auto Const

ObjectReference Property Disable03 Auto Const

ObjectReference Property Disable04 Auto Const

Group Required_Properties

	string property Anim = "stage2" auto const
	{Anim to play when this is activated.}

EndGroup

auto State readyToPush

Event OnActivate(ObjectReference akActionRef)
    playAnimation(Anim)
    Enable01.enable()
    Enable02.enable()
    Disable01.disable()
    Disable02.disable()
    Disable03.Disable()
    Disable04.Disable()    
    gotostate("busyState")
EndEvent

endState

State busyState
	Event OnBeginState(string asOldState)
	    utility.wait(1.0)
		gotoState("readyToPush")
	EndEvent
endState
