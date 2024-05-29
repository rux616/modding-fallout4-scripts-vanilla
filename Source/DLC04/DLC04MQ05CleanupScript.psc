Scriptname DLC04:DLC04MQ05CleanupScript extends Quest

DLC04:DLC04WorkshopParentScript Property DLC04WorkshopParent auto const mandatory 

RefCollectionAlias Property EnemyOutposts Auto Const Mandatory

GlobalVariable property DLC04MQ05CleanupCount auto const mandatory 
GlobalVariable property DLC04MQ05CleanupTotal auto const mandatory 

Event OnQuestInit()
	RegisterForCustomEvent(DLC04WorkshopParent, "DLC04WorkshopRaiderSettlementEvent")
	; initialize global count
	DLC04MQ05CleanupTotal.SetValue(EnemyOutposts.GetCount())
	UpdateCurrentInstanceGlobal(DLC04MQ05CleanupTotal)
	; objective
	SetObjectiveDisplayed(100)
endEvent

Event DLC04:DLC04WorkshopParentScript.DLC04WorkshopRaiderSettlementEvent(DLC04:DLC04WorkshopParentScript akSender, Var[] akArgs)
	WorkshopScript workshopRef = akArgs[0] as WorkshopScript
	bool bCreated = akArgs[1] as bool
	int raiderGangValue = akArgs[2] as int

	debug.trace(self + " DLC04WorkshopRaiderSettlementEvent from " + workshopRef + " bCreated=" + bCreated + ", in enemy outpost list? " + EnemyOutposts.Find(workshopRef))

	if bCreated == false && EnemyOutposts.Find(workshopRef) > -1
		EnemyOutposts.RemoveRef(workshopRef)

		int enemyOutpostCount = EnemyOutposts.GetCount()
		debug.trace(self + "    enemyOutpostCount=" + enemyOutpostCount)
		; initialize global count
		DLC04MQ05CleanupCount.mod(1)
		UpdateCurrentInstanceGlobal(DLC04MQ05CleanupCount)
		if enemyOutpostCount == 0
			SetObjectiveCompleted(100, true)
			SetStage(500)
		else 
			SetObjectiveDisplayed(100, true, true)
		endif
	endif
EndEvent
