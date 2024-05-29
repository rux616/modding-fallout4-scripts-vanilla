Scriptname dn083_BarneyScript extends Actor Const

Quest Property DN083_Barney Auto Const
Int Property DeathSetStage Auto Const

ObjectReference Property GateDoor Auto Const

Event OnDeath(Actor akKiller)
    dn083_Barney.setstage(DeathSetStage)
    GateDoor.SetOpen()
EndEvent


