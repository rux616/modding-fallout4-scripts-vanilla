Scriptname DLC03:DCL03MQ00Script extends Quest

Faction Property pPlayerFaction Auto Const Mandatory
Faction Property pDLC03SettlementFarHarborFaction Auto Const Mandatory
GlobalVariable Property pDLC03PlayerFarHarborKickedOut Auto Const Mandatory

Quest Property DLC03MQ01Radio Auto Const Mandatory
ObjectReference Property DLC03MQ01RadioREF Auto Const Mandatory

Quest Property DLC03MQ01 Auto Const Mandatory

;custom event to handle getting kicked out of Far Harbor
CustomEvent DLC03FarHarborKickOut

;function to call when the player is kicked out Far Harbor
Function DLC03KickOutOfFarHarbor()
	; Make Far Harbor the enemy of the player
	pPlayerFaction.SetEnemy(pDLC03SettlementFarHarborFaction)

	;send the kick out event to anyone listening for it
	;define the array to send
	Var[] kargs = new Var[1]
	SendCustomEvent("DLC03FarHarborKickOut", kargs)

	;TO DO - TTP# 90590 - Add functionality to block Old Longfellow from being available player companion

EndFunction


Function DLC03StartRadioMessage()
	DLC03MQ01RadioREF.Enable()
	DLC03MQ01Radio.Start()
EndFunction

Function DLC03EndRadioBroadcast()
	DLC03MQ01Radio.Stop()
	DLC03MQ01RadioREF.Disable()
EndFunction
	
Function DLC03SkipRadioMessage()
	DLC03MQ01.SetStage(5)
EndFunction