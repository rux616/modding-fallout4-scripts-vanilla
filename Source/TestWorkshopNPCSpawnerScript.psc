Scriptname TestWorkshopNPCSpawnerScript extends ObjectReference Hidden Const

ActorBase Property WorkshopNPC Auto Const

WorkshopParentScript Property WorkshopParent Auto Const

Event OnActivate(ObjectReference akActionRef)
    if akActionRef == game.getplayer()
    	; spawn a new NPC
    	; get linked workbench
    	WorkshopScript workshopRef = GetLinkedRef() as WorkshopScript
    	WorkshopParent.CreateActorPUBLIC(workshopRef)
    endif
EndEvent