ScriptName DN049_FallonsInventoryScript Extends RefCollectionAlias
{Script on the DN049 RefCollectionAlias of all of the items in the Fallon's store. If the player takes or disturbs any of these items, update the quest.}

Quest property DN049 Auto Const
{DN049}


Event OnGrab(ObjectReference source)
	UpdateQuest()
EndEvent

Event OnActivate(ObjectReference source, ObjectReference akActivator)
	UpdateQuest()
EndEvent

Function UpdateQuest()
	if (!DN049.GetStageDone(450))
		DN049.SetStage(440)
	EndIf
EndFunction