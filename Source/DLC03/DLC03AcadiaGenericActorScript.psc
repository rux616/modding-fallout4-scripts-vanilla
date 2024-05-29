Scriptname DLC03:DLC03AcadiaGenericActorScript extends Actor Conditional

Quest Property DLC03MQ05 Auto Const Mandatory

Event OnLoad()
	RegisterForHitEvent(self) ; get one hit 
endEvent



Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)

if AkAggressor==Game.GetPlayer()
	if DLC03MQ05.GetStageDone(800)
		DLC03MQ05.SetStage(850)
	endif
endif
	RegisterForHitEvent(self) ; get one hit 
EndEvent


