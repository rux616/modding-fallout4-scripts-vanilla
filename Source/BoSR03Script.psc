Scriptname BoSR03Script extends Quest Const Hidden

Location Property PrydwenLocation Auto Const
Alias Property BoSR03Squire Auto Const
LocationAlias Property Dungeon Auto Const
{Dungeon alias to watch for cleared.}

Int Property StageToSet Auto Const
{Quest stage to set once the dungeon is cleared.}

Event Location.OnLocationCleared(Location akSender)
	Debug.Trace( self + "Receiving OnLocationCleared event from" + akSender )

	;store location from alias so we can check against it
	Location DungeonLoc = Dungeon.GetLocation()

	if akSender == DungeonLoc
		SetStage(StageToSet)
	endif
EndEvent


