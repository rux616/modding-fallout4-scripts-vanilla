Scriptname BoS101POI_CaravanManagerScript extends ObjectReference
{Script for the DefaultDummy that manages the BoS101POI Caravan Fight. Triggers it when the player gets close.}

Quest property BoS101POI auto const
{BoS101POI}

Actor player

Event OnLoad()
	;Store off local variables.
	player = Game.GetPlayer()

	;Start a timer to run distance checks on the player.
	if (!BoS101POI.GetStageDone(30))
		StartTimer(1)
	EndIf
EndEvent

Event OnTimer(int timerID)
	if (Self.GetDistance(player) < 3500)
		BoS101POI.SetStage(30)
	EndIf
	if (!BoS101POI.GetStageDone(30) && Self.Is3DLoaded())
		StartTimer(1)
	EndIf
EndEvent