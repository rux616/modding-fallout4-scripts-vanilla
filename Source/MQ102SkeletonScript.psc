Scriptname MQ102SkeletonScript extends ObjectReference Const

Quest Property DialogueVault111 Auto Const

Event OnActivate(ObjectReference akActionRef)
	If akActionRef == Game.GetPlayer()
		If DialogueVault111.IsRunning()
			(DialogueVault111 as DialogueVault111Script).PlayerBodiesComments()
		EndIf
	EndIf
EndEvent