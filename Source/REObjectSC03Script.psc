Scriptname REObjectSC03Script extends Quest Hidden
{Uses a helper function to spawn creatures for REObjectSC03.}

ReferenceAlias property CenterMarker Auto
{Center marker for the RE}

ActorBase property LvlBloodbugAggro1500 Auto
{Bloodbug to spawn.}

ActorBase property LvlBloatflyAggro1500 Auto
{Bloatfly to spawn.}

ObjectReference property REObjectSC03_SpawnMarker Auto
{Marker to spawn the actors at.}


Actor Function SpawnCreature(int levelMod)
	;66% Bloodbug, 33% Bloatfly at the moment.
	int roll = Utility.RandomInt(0, 2)
	Actor a
	if (roll < 2) ;Bloodbug
		a = REObjectSC03_SpawnMarker.PlaceActorAtMe(LvlBloodbugAggro1500, levelMod)
	ElseIf (roll == 2) ;Bloatfly
		a = REObjectSC03_SpawnMarker.PlaceActorAtMe(LvlBloatflyAggro1500, levelMod)
	EndIf
	if (a != None)
		a.Disable()
	EndIf
	return a
EndFunction