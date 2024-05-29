Scriptname WorkshopAliasClearNewSettlerScript extends ReferenceAlias Const
{clears the new settler script
 (mainly for quest NPCs who forcegreet,
to keep them from forcegreeting again right away)}

event OnAliasInit()
	debug.trace(self + " Oninit")
	WorkshopNPCScript workshopNPC = GetActorRef() as WorkshopNPCScript
	if workshopNPC
		workshopNPC.bNewSettler = false
	endif
endEvent