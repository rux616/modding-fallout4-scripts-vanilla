Scriptname DLC01:MQ04QuestScript extends Quest

Quest Property DLC01MQ04 Auto Const
ReferenceAlias Property Alias_DLC01MQ04JezebelBuilt Auto Const
ReferenceAlias Property Alias_DLC01MQ04JezebelBuiltEssential Auto Const
ObjectMod Property DLC01Bot_Head_RoboBrain_Jezebel Auto Const

;This portion of the script looks for the construction of Jezebel at a Robot Workbench
Event OnInit()
	RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerModRobot")
	Debug.trace(self + "Robot Event Started")
EndEvent

Event Actor.OnPlayerModRobot(Actor akSender, Actor akRobot, ObjectMod akModBaseObject)
	Debug.trace(self + "Player modified robot")
	If akModBaseObject == DLC01Bot_Head_RoboBrain_Jezebel
		Debug.trace(self + "Jezebel Alias Filled")
		Alias_DLC01MQ04JezebelBuilt.ForceRefTo(akRobot)
		Alias_DLC01MQ04JezebelBuiltEssential.ForceRefTo(akRobot)
		Debug.trace(self + "Set done stage")
		DLC01MQ04.SetStage(200)

		;disallow companion status
		akRobot.DisallowCompanion(SuppressDismissMessage = true)		

	Endif
EndEvent