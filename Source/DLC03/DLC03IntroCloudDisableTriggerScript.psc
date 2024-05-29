Scriptname DLC03:DLC03IntroCloudDisableTriggerScript extends ObjectReference Hidden

ObjectReference Property IntroCloud01 auto const mandatory
ObjectReference Property IntroCloud02 auto const mandatory
ObjectReference Property IntroCloud03 auto const mandatory

Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
    	DisableNoWait()

    	IntroCloud01.Disable(TRUE)
    	IntroCloud02.Disable(TRUE)
    	IntroCloud03.Disable(TRUE)
    endif
EndEvent