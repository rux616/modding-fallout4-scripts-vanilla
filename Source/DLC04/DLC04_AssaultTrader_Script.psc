Scriptname DLC04:DLC04_AssaultTrader_Script extends Actor Const

Event OnLoad()
    RegisterForHitEvent(akTarget = Self)
EndEvent

Keyword Property DLC04_AssaultTrader_Start Auto Const Mandatory

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
    DLC04_AssaultTrader_Start.SendStoryEvent(GetCurrentLocation(), akRef1 = Self)
    Debug.Trace("+++++++ I was hit and should start the raider combat reaction quest +++++++")
EndEvent

Event OnUnload()
    UnregisterForAllHitEvents(akTarget = Self)
EndEvent