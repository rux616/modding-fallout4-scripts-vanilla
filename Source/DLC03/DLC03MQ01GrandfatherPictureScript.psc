Scriptname DLC03:DLC03MQ01GrandfatherPictureScript extends ObjectReference

Message Property DLC03MQ01PictureFrameMessage Auto Const Mandatory
Message Property DLC03MQ01PictureFrameMessageSuccess Auto Const Mandatory
Message Property DLC03MQ01PictureFrameMessageFail Auto Const Mandatory
ActorValue Property Perception Auto Const Mandatory
Key Property DLC03MQ01SafeKey Auto Const Mandatory
GlobalVariable Property DLC03MQ01PlayerKnowsPictureKey Auto Const Mandatory
Quest Property DLC03MQ01 Auto Const Mandatory

;the minimum amount of Perception the player needs to succeed the search
Int PerceptionScoreRequired = 7 Const

Auto State WaitingForPlayer
	;when the player activates the picture, pop a message box giving the player the option to search it
	Event OnActivate(ObjectReference akActionRef)
		Actor PlayerREF = Game.GetPlayer()
		If akActionRef == PlayerREF
			;if the player already knows about the secret key, skip to that part
			If DLC03MQ01PlayerKnowsPictureKey.GetValueInt() == 1
				PlayerFoundKey()
			Else
				;show the message box and record what option the player picks
				Int ButtonPressed = DLC03MQ01PictureFrameMessage.Show()
				If ButtonPressed == 1
					;always give the player the key, don't do the check
					PlayerFoundKey()
					;check if the player has high enough perception
					;If PlayerREF.GetValue(Perception) >= PerceptionScoreRequired
					;	PlayerFoundKey()
					;Else
					;	DLC03MQ01PictureFrameMessageFail.Show()
					;EndIf
				EndIf
			EndIf
		EndIf
	EndEvent
EndState


State hasbeentriggered
	Event OnActivate(ObjectReference akActionRef)
		;do nothing
	EndEvent
EndState

;Function to handle everything we need when we give the player the key
Function PlayerFoundKey()
	Actor PlayerREF = Game.GetPlayer()
	gotoState("hasbeentriggered")
	DLC03MQ01PictureFrameMessageSuccess.Show()
	PlayerREF.AddItem(DLC03MQ01SafeKey, 1)
	Self.BlockActivation(True, True)
	;if we're on the quest, advance it
	If (DLC03MQ01.GetStageDone(200) == 1) && (DLC03MQ01.GetStageDone(300) == 0)
		DLC03MQ01.SetStage(260)
	EndIf
EndFunction
