Scriptname DLC04:DLC04RaidSubdueBleedOutCounter extends RefCollectionAlias Const
{Once this ALIAS is put into bleedout, increment it. Once enough are in bleedout, set stage.}

Group Required_Properties
	bool property RemoveWhenBleedOut = true Auto Const
	{Default: TRUE. After incrementing, remove the alias from the collection.}

	int property TargetRemainingCount = -1 Auto Const
	{Default: -1. After incrementing, if there are this many objects left in the collection or fewer, set MyRemainingStage.}

	int property MyRemainingStage = -1 Auto Const
	{Default: -1. After incrementing, if there are TargetRemainingCount objects left in the collection or fewer, set this stage.}
EndGroup

Event OnEnterBleedOut(ObjectReference akSenderRef)
	debug.trace(self +  ": Bleedout event recieved for " + akSenderRef)
	Increment(akSenderRef)
EndEvent

Function Increment(ObjectReference akSenderRef)
	if (RemoveWhenBleedOut)
		debug.trace(self +  ": Removing NPC from collection: " + akSenderRef)
		Self.RemoveRef(akSenderRef)
	EndIf

	if ((GetCount() <= TargetRemainingCount) && (MyRemainingStage > -1))
		debug.trace(self +  ": Target count reached. Setting stage: " + MyRemainingStage)
		GetOwningQuest().SetStage(MyRemainingStage)
	EndIf
EndFunction