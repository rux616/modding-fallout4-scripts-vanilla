Scriptname MQ201QuestScript extends Quest Conditional

Int Property AmariReject01 Auto Conditional ;did the player refuse to hand the brain to Amari?

InputEnableLayer Property MQ201PlayerEnableLayer Auto Hidden

Function PlayerNoFightSceneStart()
	;create input layer and lock fighting so player lowers weapon
	MQ201PlayerEnableLayer = InputEnableLayer.Create()
	MQ201PlayerEnableLayer.EnableFighting(False)
EndFunction

Function PlayerNoFightSceneEnd()
	;delete layer so player has full control again
	MQ201PlayerEnableLayer = None
EndFunction