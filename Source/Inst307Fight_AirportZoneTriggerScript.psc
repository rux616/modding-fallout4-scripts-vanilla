Scriptname Inst307Fight_AirportZoneTriggerScript extends ObjectReference Hidden
{Inst307 Fight - All phases. Zone triggers that report entry and exit events to Inst307FightQuestScript.}
;
;These triggers are keyword-restricted to only receive events from the player.

Inst307FightQuestScript property Inst307Fight Auto Const Mandatory
{Inst307Fight}

int property myZoneID Auto Const
{ID of the area this trigger represents.}


Event OnTriggerEnter(ObjectReference akActionRef)
   	Inst307Fight.ZoneEntered(myZoneID, Self)
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
   	Inst307Fight.ZoneLeft(myZoneID, Self)
EndEvent