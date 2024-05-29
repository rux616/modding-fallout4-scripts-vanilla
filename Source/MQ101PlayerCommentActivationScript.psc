ScriptName MQ101PlayerCommentActivationScript extends ReferenceAlias

Int Property StageToSet auto

Event OnActivate(ObjectReference akActionRef)

	If (akActionRef == Game.GetPlayer()) && (GetOwningQuest().GetStageDone(1000) == 0) && (Game.GetPlayer().IsInScene() == False)
		GetOwningQuest().SetStage(StageToSet)
		Self.GetRef().BlockActivation(True, True)
	EndIf
EndEvent