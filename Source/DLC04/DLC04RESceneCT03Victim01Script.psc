Scriptname DLC04:DLC04RESceneCT03Victim01Script extends ReferenceAlias

Event OnAliasInit()
	RegisterForHitEvent(Self)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	If (akAggressor == Game.GetPlayer())
		DLC04RESceneCT03.SetStage(26)
	Else
		DLC04RESceneCT03.SetStage(25)
	EndIf
EndEvent

Quest Property DLC04RESceneCT03 Auto Const Mandatory
