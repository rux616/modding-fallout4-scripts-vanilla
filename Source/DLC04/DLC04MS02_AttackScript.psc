Scriptname DLC04:DLC04MS02_AttackScript extends ReferenceAlias

Faction Property PlayerFaction Auto Const Mandatory
Faction Property DLC04HubologistFaction Auto Const Mandatory
Faction Property PlayerFriendFaction Auto Const Mandatory

Quest Property DLC04MS02 Auto Const Mandatory

Event OnDeath(Actor akKiller)
	if akKiller == game.GetPlayer() && DLC04MS02.GetStage() != 920
		GetActorRef().RemoveFromFaction(PlayerFriendFaction)
		DLC04HubologistFaction.SetEnemy(PlayerFaction)
		DLC04MS02.SetStage(99)
		DLC04MS02.FailAllObjectives()
	endif
EndEvent
