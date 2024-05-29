Scriptname DLC03:DLC03MQ06_PlayerExitWindFarmScript extends Quest

ReferenceAlias Property ObjMarker Auto Const Mandatory
{Reference alias for Far Harbor objective marker}

float Property fDistanceCheck = 2000.0 Auto Const 
{How far player needs to be from obj marker to fire distance event}

int Property iStageToSet = 200 Auto Const
{State to set when Distance Event fires}

Function DistanceEventPlayerObjMarker()
	;Register for a distance event between player and objective marker
	RegisterForDistanceLessThanEvent(Game.GetPlayer(), ObjMarker.GetRef(), fDistanceCheck)
EndFunction

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	;When the distance event occurs, fire off appropriate stage
	SetStage(200)
EndEvent