Scriptname DLC04:DLC04_NUK001_CrowdDespawnTrigScript extends ObjectReference

DLC04:DLC04_NUK001_CrowdManagerQuestScript property DLC04_NUK001_CrowdManager Auto Const Mandatory
Keyword property DLC04_NUK001_FillerActorKeyword Auto Const Mandatory
int property Crowd_Exit_Stage = 400 Auto Const
bool property hasToggled Auto

Event OnCellAttach()
	hasToggled = False
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
	if (akActionRef.HasKeyword(DLC04_NUK001_FillerActorKeyword) && DLC04_NUK001_CrowdManager.GetStageDone(Crowd_Exit_Stage))
		akActionRef.Disable(True)
		DLC04_NUK001_CrowdManager.DeleteFillerActor(akActionRef as Actor)
		if (!hasToggled)
			hasToggled = True
			Self.Disable()
			Self.Enable()
		EndIf
	EndIf
EndEvent