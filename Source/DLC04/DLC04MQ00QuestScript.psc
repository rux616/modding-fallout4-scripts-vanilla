Scriptname DLC04:DLC04MQ00QuestScript extends Quest

Location Property DLC04NukaStationLocation Auto Const Mandatory

Function Startup()
	; Ready to start quest? If not, register for events as needed.
	If CheckForMQStart() == false
		RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	EndIf
EndFunction

bool Function CheckForMQStart()
	debug.trace(self + " CheckForMQStart")
	If Game.GetPlayer().GetLevel() >= 30
		;If Game.GetPlayer().IsInLocation(DLC01CaravanLocation) == 0 *** Will need to check that player isn't in the DLC04 Nuka-Express Cell ***
		   SetStage(15)
		   Return True
	    ;EndIf
	Else
		Return False
	EndIf
EndFunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
    ; Check if player qualifies to run quest start up.
    If GetStageDone(15) == 0
    	CheckForMQStart()
	EndIf
	; Check to see if player is loading into Nuka-World.
	If akNewLoc == DLC04NukaStationLocation
		SetStage(520)
	EndIf
EndEvent
