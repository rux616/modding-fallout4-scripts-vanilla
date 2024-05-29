Scriptname DN083_StartMirelurkScript extends ReferenceAlias

Quest Property DN083_Barney auto const

GlobalVariable Property DN083_MirelurkX Auto Const
GlobalVariable Property DN083_MirelurkY Auto Const

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
    DN083_Barney.SetStage(5)
EndEvent

Event OnDeath(Actor akKiller)
	
	If DN083_Barney.ModObjectiveGlobal(1,DN083_MirelurkX,5, DN083_MirelurkY.Value)
     	DN083_Barney.SetObjectiveCompleted(5)
     	DN083_Barney.SetObjectiveDisplayed(6)
     	;Utility.wait(1.5)
     	DN083_Barney.SetStage(10)
	endIf

EndEvent
