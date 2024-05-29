Scriptname DLC03:DLC03AcadiaActorAliasScript extends ReferenceAlias

Quest Property DLC03MQ05 Auto Const Mandatory

Event OnAliasInit()
	; Preferably we only have a filter in place when the object is loaded, but we won't get load events if the object
	; is already loaded before it is put inside us, so just set up the filter now that the alias is initialized
	RegisterForHitEvent(self) ; get one hit 
EndEvent



Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)

	if akAggressor==Game.GetPlayer()
		if DLC03MQ05.GetStageDone(800)
			DLC03MQ05.SetStage(850)
		else
			RegisterForHitEvent(self) ; get one hit 
		endif
	else
		RegisterForHitEvent(self) ; get one hit 
	endif
EndEvent