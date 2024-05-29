Scriptname DefaultQuestDistanceCheckScript extends Quest Const Default
{quest script to set stages on distance checks to the player}

struct DistanceCheckStage
	ReferenceAlias DistanceCheckAlias
	{ alias you want to check the distance from - always checking against the player }

	int StageToSet
	{ stage to set when distance check happens }

	int Distance
	{ distance we're looking for}

	bool DistanceLessThan = true
	{ if false, will check for OnDistanceGreaterThan Distance }

	Int PrereqStage = -1
	{
	OPTIONAL: Stage that must be set for this event to fire.
	 NOTE that if this is NOT set, distance check will be valid from the start of the quest
	 }

	Int TurnOffStage = -1
	{OPTIONAL: If the quest stage is equal or greater than TurnOffStage, further events are ignored
	NOTE: this stage does not actually have to be set - any quest stage equal or higher will turn off this script}

endStruct


DistanceCheckStage[] property DistanceCheckStages auto Const
{ array of stage/distance check data }


Event OnQuestInit()
	; register for distance check
	Actor player = Game.GetPlayer()

	int i = 0
	while i < DistanceCheckStages.Length
		DistanceCheckStage theDistanceCheck = DistanceCheckStages[i]
		if theDistanceCheck.DistanceLessThan
			RegisterForDistanceLessThanEvent(player, theDistanceCheck.DistanceCheckAlias, theDistanceCheck.Distance)
		else
			RegisterForDistanceGreaterThanEvent(player, theDistanceCheck.DistanceCheckAlias, theDistanceCheck.Distance)
		endif
		i += 1
	endWhile
endEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	; akObj1 is always the player
	Debug.Trace(self + " " + akObj2 + " OnDistanceLessThan " + afdistance)
	CheckDistanceStages(true, akObj2)
endEvent

Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	; akObj1 is always the player
	Debug.Trace(self + " " + akObj2 + " OnDistanceGreaterThan " + afdistance)
	CheckDistanceStages(false, akObj2)
endEvent

function CheckDistanceStages(bool bDistanceLessThan, ObjectReference theRef)
	int i = 0
	while i < DistanceCheckStages.Length
		DistanceCheckStage theDistanceCheck = DistanceCheckStages[i]
		if theDistanceCheck.DistanceCheckAlias.GetRef() == theRef && ( theDistanceCheck.PrereqStage == -1 || GetStageDone(theDistanceCheck.PrereqStage) ) && ( theDistanceCheck.TurnOffStage == -1 || GetStage() < theDistanceCheck.TurnOffStage )
			if theDistanceCheck.DistanceLessThan == bDistanceLessThan
				debug.trace(self + " setting stage " + theDistanceCheck.StageToSet)
				SetStage(theDistanceCheck.StageToSet)
			endif
		endif
		i += 1
	endWhile

endFunction