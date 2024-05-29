Scriptname DLC04:WW_TalkerScript extends ObjectReference Const

Scene Property WWQuest_StandeeScene01 Auto Const
Scene Property WWQuest_StandeeScene02 Auto Const
Scene Property WWQuest_StandeeScene03 Auto Const
Scene Property WWQuest_StandeeScene04 Auto Const
Scene Property WWQuest_StandeeScene05 Auto Const

GlobalVariable Property DLC04_WWTalker01 Auto Const Mandatory
GlobalVariable Property DLC04_WWTalkerQT Auto Const Mandatory

ObjectReference Property DLC04_WWTalkingActivator Auto Const

Event OnActivate(ObjectReference akActionRef)
    debug.trace("Activated by " + akActionRef)
    if akActionRef == Game.Getplayer()
    	self.BlockActivation(True,True)
    	
    	;Register to check if the player has walked away
    	RegisterForDistanceGreaterThanEvent(Self, game.getplayer(), 500.0)

    	;alter it's global for QT Reasons
    	DLC04_WWTalkerQT.setValue(1.0)
    	
    	if (DLC04_WWTalker01.GetValue() == 0.0)
    	
			;Move talking activator to this object
			DLC04_WWTalkingActivator.MoveTo(self) 
			;start the scene   	
    		WWQuest_StandeeScene01.ForceStart()

    	elseif (DLC04_WWTalker01.GetValue() == 1.0)
    	
			;Move talking activator to this object
			DLC04_WWTalkingActivator.MoveTo(self) 
			;start the scene   	
    		WWQuest_StandeeScene02.ForceStart()
    	
    	elseif (DLC04_WWTalker01.GetValue() == 2.0)
    	
			;Move talking activator to this object
			DLC04_WWTalkingActivator.MoveTo(self) 
			;start the scene   	
    		WWQuest_StandeeScene03.ForceStart()
    	
    	elseif (DLC04_WWTalker01.GetValue() == 3.0)
    	
			;Move talking activator to this object
			DLC04_WWTalkingActivator.MoveTo(self) 
			;start the scene   	
    		WWQuest_StandeeScene04.ForceStart()
    	
    	elseif (DLC04_WWTalker01.GetValue() == 4.0)
    	
			;Move talking activator to this object
			DLC04_WWTalkingActivator.MoveTo(self) 
			;start the scene   	
    		WWQuest_StandeeScene05.ForceStart()
    	
    	endif
    endif
EndEvent


Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)

	Unregisterforallevents()
	if (WWQuest_StandeeScene01.isPlaying())
		
		WWQuest_StandeeScene01.Stop()
	
	elseif (WWQuest_StandeeScene02.isPlaying())
		
		WWQuest_StandeeScene02.Stop()
	
	elseif (WWQuest_StandeeScene03.isPlaying())
		
		WWQuest_StandeeScene03.Stop()
	
	elseif (WWQuest_StandeeScene04.isPlaying())
		
		WWQuest_StandeeScene04.Stop()
	
	elseif (WWQuest_StandeeScene05.isPlaying())
		
		WWQuest_StandeeScene05.Stop()


	endif

endEvent

