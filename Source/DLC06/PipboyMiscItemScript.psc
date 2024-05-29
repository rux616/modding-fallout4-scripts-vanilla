Scriptname DLC06:PipboyMiscItemScript extends ObjectReference Const

Faction property WorkshopNPCFaction auto const mandatory 

Armor property DLC06PipboyVault88 auto const mandatory 

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
    if akNewContainer is Actor
    	Actor myActor = akNewContainer as Actor
    	if myActor != Game.GetPlayer() && myActor.IsInFaction(WorkshopNPCFaction) && myActor.GetItemCount(DLC06PipboyVault88) == 0
    		debug.trace(self + " OnContainerChanged: equipping pipboy on " + myActor)
    		; add and equip real pipboy on actor
    		myActor.EquipItem(DLC06PipboyVault88)
    		myActor.RemoveItem(self.GetBaseObject())
    	endif
    endif
EndEvent