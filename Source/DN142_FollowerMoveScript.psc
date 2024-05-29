Scriptname DN142_FollowerMoveScript extends ObjectReference

Quest Property Followers Auto Const

ReferenceAlias Property Companion Auto
ReferenceAlias Property DogmeatCompanion Auto

ObjectReference Property MoveHere01 Auto
ObjectReference Property MoveHere02 Auto


Event OnTriggerEnter(ObjectReference akActionRef)
    if (akActionRef == Game.GetPlayer())
    	
    	if (Game.Getplayer().HasDetectionLOS(Companion.GetReference()) == FALSE)

    		Companion.GetReference().MoveTo(MoveHere01)
    	
    	endif

    	if (Game.Getplayer().HasDetectionLOS(DogmeatCompanion.GetReference()) == FALSE)

    		DogmeatCompanion.GetReference().MoveTo(MoveHere02)
    	
    	endif
    	self.disable()
    	StartTimerGameTime(5000, 100)
    endif
EndEvent

Event OnTimerGameTime(int aiTimerID)		
	if aiTimerID == 100 
		self.enable()
	EndIf
EndEvent
