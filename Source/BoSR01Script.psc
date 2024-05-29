Scriptname BoSR01Script extends Quest
{This script tracks the deaths of a collection alias for the BoSR01 quest.}

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