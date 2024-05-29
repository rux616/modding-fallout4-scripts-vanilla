Scriptname MS01HouseTriggerScript extends ObjectReference Const

Quest Property MS01 Auto Const
ObjectReference Property BillyRef Auto Const
ObjectReference Property MS01BulletRevealMarker Auto Const
Int Property StageToSet Auto Const
Faction Property PeabodyFaction Auto Const Mandatory
Faction Property PlayerFaction Auto Const Mandatory

Event OnTriggerEnter(ObjectReference akObjectRef)
	If akObjectRef == BillyRef
		If MS01.GetStage() < StageToSet
			MS01.SetStage(StageToSet)
			PeabodyFaction.SetEnemy(PlayerFaction, true, true)
			PeabodyFaction.SetPlayerEnemy(false)
		Endif
	Elseif akObjectRef == game.GetPlayer()
		If MS01.GetStage() >= 200 && MS01.GetStage() < 900 
			If (BillyRef as Actor).IsInCombat() == true
				(BillyRef as Actor).StopCombat()
				PeabodyFaction.SetEnemy(PlayerFaction, true, true)
				PeabodyFaction.SetPlayerEnemy(false)
				If BillyRef.GetDistance(game.GetPlayer())> 1500
					BillyRef.Moveto(MS01BulletRevealMarker)
				endif
			Endif
		Endif
	Endif
EndEvent

