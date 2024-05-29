Scriptname DLC04:DLC04SafariGatorclawFirstKillScript extends RefCollectionAlias

quest property DLC04SafariAdventureQuest auto 
int property firstDeadstagetoset auto 
int property allDeadStagetoSet auto
globalvariable property totalGlobal auto
globalvariable property currentGlobal auto
int property ObjectiveNumber auto
int property preReqStage auto

int killedCount = 0
int numberOfEnemies = 0

auto state waiting
Event OnDying(ObjectReference akSenderRef, Actor akKiller)
	if DLC04SafariAdventureQuest.getstageDone(firstDeadstagetoset) == 0
    	DLC04SafariAdventureQuest.setstage(firstDeadstagetoset)
    	numberofEnemies = self.GetCount()
		totalGlobal.setValue(numberOfEnemies)
		getOwningQuest().UpdateCurrentInstanceGlobal(totalGlobal)
    endif
	killedCount = killedCount + 1
	currentGlobal.setValue(killedCount)
	getOwningQuest().UpdateCurrentInstanceGlobal(currentGlobal)
	if ObjectiveNumber > 0 && DLC04SafariAdventureQuest.getstagedone(preReqStage) == true
		getOwningQuest().setObjectiveDisplayed(ObjectiveNumber, abForce = true)
	endif
	if killedCount == numberOfEnemies
		getOwningQuest().setstage(allDeadStagetoSet)
	endif
	utility.wait(1)
	self.RemoveRef(akSenderRef)
EndEvent
endstate

state Done
	;do nothing
endstate   
