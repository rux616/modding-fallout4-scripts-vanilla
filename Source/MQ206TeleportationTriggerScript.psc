Scriptname MQ206TeleportationTriggerScript extends ObjectReference Conditional Const
{trigger on teleportation platform - sets
global when player is standing on platform}

GlobalVariable Property MQ206PlayerOnPlatform Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
    	debug.trace(self + "OnTriggerEnter")
    	MQ206PlayerOnPlatform.SetValueInt(1)
    endif
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
   	debug.trace(self + "OnTriggerLeave")
    if akActionRef == Game.GetPlayer()
    	MQ206PlayerOnPlatform.SetValueInt(0)
    endif
EndEvent