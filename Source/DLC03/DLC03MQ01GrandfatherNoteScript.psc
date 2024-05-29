Scriptname DLC03:DLC03MQ01GrandfatherNoteScript extends ObjectReference

GlobalVariable Property DLC03MQ01PlayerKnowsPictureKey Auto Const Mandatory

;when player reads the note, he now knows about the secret key in the picture
Auto State WaitingForPlayer
	Event OnRead()
		gotoState("hasbeentriggered")
		DLC03MQ01PlayerKnowsPictureKey.SetValueInt(1)
	EndEvent
EndState


State hasbeentriggered
	Event OnRead()
		;do nothing
	EndEvent
EndState