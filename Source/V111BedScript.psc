Scriptname V111BedScript extends ObjectReference

Quest Property DialogueVault111 Auto
Scene Property p006_PlayerBeds Auto
Message Property Vault111BedMessage Auto

Auto State TurnOffBeds
	Event OnInit()
		BlockActivation()
	EndEvent

	Event OnLoad()
		If DialogueVault111.GetStageDone(200) == 1
			gotoState("DoneState")
		EndIf
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
		If akActionRef == Game.GetPlayer()
			Vault111BedMessage.Show()
			If p006_PlayerBeds.IsPlaying() == False
				p006_PlayerBeds.Start()
			EndIf
		EndIf
	EndEvent
EndState

State DoneState
	;empty
EndState
