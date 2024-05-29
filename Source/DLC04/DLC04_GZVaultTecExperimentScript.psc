Scriptname DLC04:DLC04_GZVaultTecExperimentScript Extends ObjectReference

Potion property ExperimentPotion Auto Const Mandatory
Keyword property ExperimentKeyword Auto Const Mandatory
Actor player

Event OnLoad()
	player = Game.GetPlayer()
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
	Debug.Trace("B")
	if (!player.HasKeyword(ExperimentKeyword))
		Debug.Trace("B2")
		player.EquipItem(ExperimentPotion, False, True)
		player.AddKeyword(ExperimentKeyword)
	EndIf
   	StartTimer(1)
EndEvent

Event OnTimer(int timerID)
	if (Self.GetTriggerObjectCount() > 0)
		Debug.Trace("A")
		OnTriggerEnter(player)
	EndIf
EndEvent