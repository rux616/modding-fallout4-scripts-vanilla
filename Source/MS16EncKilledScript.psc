Scriptname MS16EncKilledScript extends RefCollectionAlias

int property StagetoSet auto
globalvariable property killedGlobal auto
int property ObjectiveNumber auto

int killedCount = 0
int numberOfEnemies = 0

Event onDying(ObjectReference akSenderRef, Actor akKiller)
	numberofEnemies = self.GetCount()
	killedCount = killedCount + 1
	killedGlobal.setValue(killedCount)
	getOwningQuest().UpdateCurrentInstanceGlobal(killedGlobal)
	getOwningQuest().setObjectiveDisplayed(ObjectiveNumber, abForce = true)
	if killedCount == numberOfEnemies
		getOwningQuest().setstage(StagetoSet)
	endif
EndEvent

