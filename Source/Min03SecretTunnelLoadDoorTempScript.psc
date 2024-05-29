Scriptname Min03SecretTunnelLoadDoorTempScript extends ReferenceAlias

Message Property CastleClearRubbleTempMsg Auto Const

Event OnActivate(ObjectReference akActionRef)
	; clear the rubble
    if akActionRef == Game.GetPlayer() && GetRef().IsLocked()
    	int button = CastleClearRubbleTempMsg.Show()
    	if button == 0 && GetOwningQuest().GetStageDone(300)
    		GetRef().Unlock()
    		GetOwningQuest().SetStage(400)
    	endif
    endif
EndEvent