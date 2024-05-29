Scriptname DLC04:DLC04StopFightingScript extends Actor Const

DLC04MQ05QuestScript Property DLC04MQ05 Auto Const Mandatory

Event OnInit()
    RegisterForCustomEvent(DLC04MQ05, "StopFighting")
EndEvent

Event DLC04:DLC04MQ05QuestScript.StopFighting(DLC04MQ05QuestScript akSender, Var[] akArgs)
	Self.StopCombatAlarm()
	UnregisterForCustomEvent(DLC04MQ05, "StopFighting")
endEvent