Scriptname CZPostQuestScript extends Quest

Quest Property myQuest Auto Const
Location Property CombatZoneLocation Auto Const

Function SetPostQuestTimer()
	StartTimerGameTime(48, 155)
EndFunction


Event OnTimerGameTime(int aiTimerID)		
	If aiTimerID == 155
    	;Debug.Trace("Timer ended! Do some cool stuff now...")
    	if Game.GetPlayer().IsInLocation(CombatZoneLocation)
    		StartTimerGameTime(8, 155)
	    else
	    	myQuest.SetStage(20)
    	endif
	EndIf
EndEvent