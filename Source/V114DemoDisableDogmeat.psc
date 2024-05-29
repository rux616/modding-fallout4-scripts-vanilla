Scriptname V114DemoDisableDogmeat extends ObjectReference Const

ObjectReference Property DogmeatRef Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
    if akActionRef ==Game.getplayer()
    	DogmeatRef.disable()
    	Self.disable()
    endif
EndEvent

