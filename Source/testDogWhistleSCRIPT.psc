Scriptname testDogWhistleSCRIPT extends ObjectReference Const

sound Property whistleSFX Auto Const

Event OnActivate(ObjectReference akActionRef)
    if akActionRef == game.getPlayer()
    	whistleSFX.play(akActionRef)
    endif
EndEvent