Scriptname RR303OneDeathScript extends RefCollectionAlias


int property StagetoSet auto
;globalvariable property killedGlobal auto
;globalvariable property totalGlobal auto
;int property ObjectiveNumber auto

int killedCount = 0
int numberOfEnemies = 0

Event OnAliasInit()
	;totalGlobal = self.GetCount()
EndEvent

Event onDying(ObjectReference akSenderRef, Actor akKiller)
	getOwningQuest().setstage(StagetoSet)
EndEvent

