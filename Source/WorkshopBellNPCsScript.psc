Scriptname WorkshopBellNPCsScript extends RefCollectionAlias Const
{remove from alias when put into command state}

Event OnCommandModeEnter(ObjectReference akSender)
	debug.trace(self + " " + akSender + " entering command mode - remove from ref collection")
    ; remove this ref from collection
	Actor theNPC = akSender as Actor
   	RemoveRef(theNPC)
   	if GetCount() == 0
   		GetOwningQuest().Stop()
   	endif
EndEvent
