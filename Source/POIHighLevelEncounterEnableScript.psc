Scriptname POIHighLevelEncounterEnableScript extends ObjectReference 

globalvariable property playerLevelGlobal auto 


auto state start
Event OnCellLoad()
	if game.getPlayer().getLevel() >= playerLevelGlobal.getValue()
    	self.getLinkedRef().Enable()
    endif
EndEvent
endState

state waitingForReset
	Event OnReset()
	    gotoState("start")
	EndEvent
endState