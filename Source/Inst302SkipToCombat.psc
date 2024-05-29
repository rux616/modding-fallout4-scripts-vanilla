Scriptname Inst302SkipToCombat extends ReferenceAlias

GlobalVariable Property BHSkipToCombat Auto Const

quest Property Inst302Combat Auto Const
quest Property Inst302 Auto Const
ObjectReference Property BHCombatTriggerEnableMarker Auto Const
int property SkipToSceneA = 50 Auto Const
int Property SkipToSceneB =25 Auto Const

Event OnLoad()
    RegisterforHitEvent(self)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
    
    debug.trace(self + " has been hit by " + akAggressor)
    BHSkipToCombat.SetValue(1.0)
    BHCombatTriggerEnableMarker.Enable()
    Inst302.setStage(SkipToSceneA)
    Inst302Combat.setstage(SkipToSceneB)
    unregisterforhitevent(self)
EndEvent
