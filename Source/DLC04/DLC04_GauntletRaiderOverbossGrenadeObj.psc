Scriptname DLC04:DLC04_GauntletRaiderOverbossGrenadeObj Extends ObjectReference

DLC04:DLC04MQ01GauntletQuestScript property DLC04MQ01Gauntlet Auto Const Mandatory

Event OnLoad()
	DLC04MQ01Gauntlet.RemoveRaiderOverbossGrenade()
	Self.DisableNoWait()
	Self.Delete()
EndEvent