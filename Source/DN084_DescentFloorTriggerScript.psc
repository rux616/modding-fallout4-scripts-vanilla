Scriptname DN084_DescentFloorTriggerScript extends ObjectReference Hidden Const
{Triggers used to track which floor the elevator is on during the DN084 Descent Sequence.}
;
;The dungeon contains a series of these triggers, stacked vertically. As the descending elevator enters each trigger, it notifies the quest
;that the elevator has reached a new floor. DN084 uses this to update its actors, then typically disable the trigger.

Group Required_Properties
	Quest property DN084 Auto Const Mandatory
	{DN084}

	int property floor Auto Const Mandatory
	{The floor represented by this trigger.}
EndGroup


Event OnTriggerEnter(ObjectReference akActionRef)
	if (akActionRef == Game.GetPlayer())
   		(DN084 as DN084_QuestScript).UpdateDescentFloor(floor, self)
   	EndIf
EndEvent