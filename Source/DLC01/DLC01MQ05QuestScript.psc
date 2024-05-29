Scriptname DLC01:DLC01MQ05QuestScript extends WorkshopEventsQuestScript Conditional

Event OnInit()
	RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerModRobot")
EndEvent

Event Actor.OnPlayerModRobot(Actor akSender, Actor akRobot, ObjectMod akModBaseObject)
	Debug.trace(self + "Player modified robot")
	If akModBaseObject == DLC01Bot_Torso_Misc_MQ05MSAT
		Debug.trace(self + "Player set stage")
		DLC01MQ05.SetStage(600)
	Endif
EndEvent

ObjectMod Property DLC01Bot_Torso_Misc_MQ05MSAT Auto Const
Quest Property DLC01MQ05 Auto Const