Scriptname Dn054GunnerScript extends RefCollectionAlias

int property StagetoSet auto

int killedCount = 0
int numberOfEnemies = 0

Event onDeath(ObjectReference akSenderRef, Actor akKiller)
	numberofEnemies = self.GetCount()
	killedCount = killedCount + 1
	if killedCount == numberOfEnemies
		getOwningQuest().setstage(StagetoSet)
	endif
EndEvent


