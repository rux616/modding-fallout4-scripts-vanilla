Scriptname DLC04:DLC04MQ05OverrideTriggerScript extends ObjectReference Const
{Script on the triggers that moves DLC04MQ05 forward if Player skips gatehouse}

Quest Property DLC04MQ05 Auto Const Mandatory
GlobalVariable Property DLC04EnemyGang Auto Const Mandatory

Event OnTriggerEnter(ObjectReference akActionRef)
	If (akActionRef == Game.GetPlayer())
		If DLC04MQ05.GetStageDone(5) == 1
			If DLC04MQ05.GetStageDone(30) == 0 && DLC04EnemyGang.GetValue() == 1
				DLC04MQ05.SetStage(30)
			ElseIf DLC04MQ05.GetStageDone(40) == 0 && DLC04EnemyGang.GetValue() == 2
				DLC04MQ05.SetStage(40)
			ElseIf DLC04MQ05.GetStageDone(50) == 0 && DLC04EnemyGang.GetValue() == 3
				DLC04MQ05.SetStage(50)
			EndIf
		EndIf
	EndIf
EndEvent
