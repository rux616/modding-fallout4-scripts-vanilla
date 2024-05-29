Scriptname DLC04:DLC04_RQ_Manager_ShockCollaredActors extends RefCollectionAlias

Event OnUnload(ObjectReference akSender)
    RemoveRef(akSender)
    akSender.delete()
EndEvent