Scriptname TestWorkshopFakeTurretScript extends Actor Const
{until we have real turrets}

; TEMP - very very temp
Event OnDeath(Actor akKiller)
    ; remove me when I'm killed
    WorkshopObjectScript objectSelf = ((self as ObjectReference) as WorkshopObjectScript)
    objectSelf.OnDestructionStageChanged(0, 5)
EndEvent
