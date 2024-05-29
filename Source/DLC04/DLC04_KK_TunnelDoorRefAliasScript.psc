Scriptname DLC04:DLC04_KK_TunnelDoorRefAliasScript extends RefCollectionAlias

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
	Quest myQuest = GetOwningQuest()
    if !myQuest.GetStageDone(110) && !myQuest.GetStageDone(113)
    	utility.Wait(0.5)
    	if akSenderRef.IsLocked()
    		myQuest.SetStage(110)
    	Endif
    endif
EndEvent