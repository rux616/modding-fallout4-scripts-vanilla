Scriptname CryopodPostWarScript extends ObjectReference

bool bInitialized
Quest Property DialogueVault111 auto
Cell Property Vault111Cryo Auto Const

Event OnInit()
	If bInitialized == False
		bInitialized = True
		BlockActivation()
	EndIf
EndEvent

Event OnActivate(ObjectReference akActionRef)
	If akActionRef == Game.GetPlayer()
		If DialogueVault111.IsRunning() && GetParentCell() == Vault111Cryo
			(DialogueVault111 as DialogueVault111Script).PlayCryopodComments()
		EndIf
	EndIf
EndEvent
