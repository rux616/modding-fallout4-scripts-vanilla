Scriptname DN001_OnEnterRemoveFromFaction extends ObjectReference Const

Faction Property DN001_TurretStartFaction Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
    Actor Entered = akActionRef as Actor
    Entered.RemoveFromFaction(DN001_TurretStartFaction)
EndEvent
