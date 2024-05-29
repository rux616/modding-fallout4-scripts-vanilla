Scriptname DLC04:DLC04_NUK001_CrowdFillerRefColScript extends RefCollectionAlias Const

DLC04:DLC04_NUK001_CrowdManagerQuestScript property DLC04_NUK001_CrowdManager Auto Const Mandatory
int property SHUTDOWN_STAGE = 300 Auto Const

Event OnUnload(ObjectReference ref)
	Debug.Trace(Self + " UNLOADED")
	if (DLC04_NUK001_CrowdManager.GetStageDone(SHUTDOWN_STAGE))
		DLC04_NUK001_CrowdManager.DeleteFillerActor(ref as Actor)
	EndIf
EndEvent