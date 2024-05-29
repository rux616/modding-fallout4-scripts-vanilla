ScriptName MQ03PrestonDoorPlaySceneScript extends ReferenceAlias

Scene Property PrestonDoorScene Auto

Event OnActivate(ObjectReference akActionRef)
	;Each time the player activates the door before killing all the raiders, have Preston say something
	If (akActionRef == Game.GetPlayer()) && (GetOwningQuest().GetStageDone(85) == 0) && (PrestonDoorScene.IsPlaying() == False)
		PrestonDoorScene.Start()
	EndIf
EndEvent