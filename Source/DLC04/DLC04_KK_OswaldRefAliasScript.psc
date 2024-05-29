Scriptname DLC04:DLC04_KK_OswaldRefAliasScript extends ReferenceAlias

Event OnLoad()
	RegisterForHitEvent(self)

EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
   
	if akAggressor
   		(GetOwningQuest() as DLC04:DLC04KiddieKingdomMainQuestScript).RunOswaldHit()
   	endif

    if !GetActorReference().IsDead()
    	RegisterForHitEvent(self)
    endif
EndEvent


Event OnDeath(Actor akKiller)
    GetOwningQuest().SetStage(780)
EndEvent


Event OnEnterBleedout()   
   	(GetOwningQuest() as DLC04:DLC04KiddieKingdomMainQuestScript).RunOswaldBleedOut() 
EndEvent