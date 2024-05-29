Scriptname TEMPShowMessageScript extends ObjectReference Const

Message Property MessageToShow const auto
bool Property DeleteWhenDone = True const auto


Event OnTriggerEnter(ObjectReference akActionRef)
    if (MessageToShow != None)
    	MessageToShow.Show()

    	if (DeleteWhenDone)
    		Delete()
    	endif
    endif
EndEvent
