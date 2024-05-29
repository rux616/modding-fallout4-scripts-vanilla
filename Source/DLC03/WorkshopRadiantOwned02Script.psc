Scriptname DLC03:WorkshopRadiantOwned02Script extends DLC03:WorkshopRadiantOwnedScript

ReferenceAlias property SettlementSpokesman auto const mandatory

LocationAlias property DungeonLocation auto const mandatory

function StartupCustom()
	; register for events
	RegisterForRemoteEvent(SettlementSpokesman.GetActorRef(), "OnLocationChange")
endFunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	debug.trace(self + " received OnLocationChange from " + akSender)
	if akNewLoc == DungeonLocation.GetLocation()
		if GetStageDone(110) && GetStageDone(120) == false && GetStageDone(200) == false 
			SetStage(120)
		endif
	endif
endEvent

function DailyUpdateCustom()
	debug.trace(self + " DailyUpdateCustom - check for NPC death")
	; if NPC went alone, check if in dungeon location and no 3d loaded
	if GetStageDone(90) && GetStageDone(200) == false && GetStageDone(300) == false
		Actor npc = SettlementSpokesman.GetActorRef()
		Location dungeon = DungeonLocation.GetLocation()
		if npc && npc.Is3DLoaded() == false && npc.GetCurrentLocation() == dungeon && Game.GetPlayer().GetCurrentLocation() != dungeon
			npc.Kill()
			; fail quest
			SetStage(300)
		endif
	endif
endFunction

