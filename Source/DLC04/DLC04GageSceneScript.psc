Scriptname DLC04:DLC04GageSceneScript extends ObjectReference Const

Scene Property DLC04MQ00_800_Gage Auto Const Mandatory
Quest Property DLC04MQ00 Auto Const Mandatory

Event OnTriggerEnter(ObjectReference akActionRef)
	If akActionRef == Game.GetPlayer() && DLC04MQ00.GetStageDone(800) == 1 && DLC04MQ00.GetStageDone(810) == 0
		DLC04MQ00_800_Gage.Start()
	EndIf
EndEvent