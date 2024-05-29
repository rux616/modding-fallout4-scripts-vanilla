Scriptname RECheckpointOnHitSetStageAliasScript extends ReferenceAlias

ReferenceAlias Property RECheckpointTrigger Auto Const Mandatory
GlobalVariable Property RECheckpointOnHitTriggerDistance Auto Const

Actor Player
ObjectReference TargetObj
float iTriggerDistance
int iQuestStage = 225
bool bAllowHitEvent = true

Event OnAliasInit()
	Player = Game.GetPlayer()
	TargetObj = RECheckpointTrigger.GetRef()
	iTriggerDistance = RECheckpointOnHitTriggerDistance.GetValue()

	RegisterForHitEvent(self, Player)

	RegisterForRemoteEvent(GetOwningQuest(), "OnStageSet")
	debug.trace(self + "Register RECheck OnHit script")
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	debug.trace(self + " OnHit " + akTarget + ", " + akAggressor + ", " + akSource)

	if akAggressor == Player
		if self.GetRef().GetDistance(TargetObj) < iTriggerDistance
			debug.trace(self + "Hit within appropriate distance. Remove spell.")
    		GetOwningQuest().SetStage(iQuestStage)
    		bAllowHitEvent = false
	    endif 
	endif

    if bAllowHitEvent
    	debug.trace(self + "Reregister for hit event.")
		RegisterForHitEvent(self, Player)
	endif
EndEvent

Event Quest.OnStageSet(Quest akSender,int auiStageID, int auiItemID)
	if auiStageID == iQuestStage
		debug.trace(self + "Remove spell stage set. Unregister hit event.")
		bAllowHitEvent = false
		UnregisterforHitEvent(self)
	endif
EndEvent