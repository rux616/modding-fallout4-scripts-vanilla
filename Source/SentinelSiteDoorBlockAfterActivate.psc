Scriptname SentinelSiteDoorBlockAfterActivate extends ObjectReference Hidden

Event OnActivate(ObjectReference akActionRef)
    BlockActivation(TRUE,TRUE)
    Utility.Wait(6)
    GetLinkedRef().Activate(Game.GetPlayer())
EndEvent