Scriptname DN049_PlayerInStoreTriggerScript extends ObjectReference Hidden
{Script for the store triggers in DN049. These set Actor Value DN049_InRelevantStore on the player and linked actors while the player is in the trigger.}


Quest property DN049 auto const
{DN049}

ActorValue property DN049_InRelevantStore auto const
{Actor value to set on the player and linked actors when the player enters the store trigger.}

Keyword property LinkCustom10 auto const
{The actors are linked together with LinkCustom10 keyworded links.}

int property stageOfReopening auto const
{Stage on DN049 that represents the Grand Reopening for this store.}

int property stageToSetBeforeReopening auto const
{Stage to set on DN049 if the player enters the store prior to the Grand Reopening.}

int property stageToSetOnLeavingBeforeReopening auto const
{Stage to set on DN049 if the player leaves the store prior to the Grand Reopening.}

int property stageToSetAfterReopening auto const
{Stage to set on DN049 if the player enters the store after the Grand Reopening.}

int playerEntryCount	;Count incremented by OnTriggerEnter and decremented by OnTriggerLeave.


Event OnTriggerEnter(ObjectReference akActionRef)
	if (akActionRef == Game.GetPlayer())
		UpdateTriggerCount(1)
	EndIf
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	if (akActionRef == Game.GetPlayer())
		UpdateTriggerCount(-1)
	EndIf
EndEvent

Function UpdateTriggerCount(int modCount)
	;Update the counter.
	playerEntryCount = playerEntryCount + modCount
	Actor player = Game.GetPlayer()
	;Debug.Trace("DN049 Triggers: " + Self + ": Update: " + modCount)

	;Update the AVs, stages, and linked actors as necessary.
	if ((modCount == 1) && (playerEntryCount == 1))
		;If the player just entered the trigger, and was not already in it, run some updates.
		;Debug.Trace("DN049 Triggers: " + Self + ": Enter")
		;Set stages.
		if (!DN049.GetStageDone(stageOfReopening))
			DN049.SetStage(stageToSetBeforeReopening)
		Else
			DN049.SetStage(stageToSetAfterReopening)
		endif

		;Set AVs on the player and linked actors.
		player.SetValue(DN049_InRelevantStore, 1)
		ObjectReference[] links = Self.GetLinkedRefChain(LinkCustom10)
		int i = 0
		While (i < links.Length)
			links[i].SetValue(DN049_InRelevantStore, 1)
			(links[i] as Actor).EvaluatePackage()
			i = i + 1
		EndWhile
	ElseIf ((modCount == -1) && (playerEntryCount == 0))
		;If the player just left the trigger, and was not already outside it, run some updates.
		;Debug.Trace("DN049 Triggers: " + Self + ": Leave")
		;Set the stage.
		if (!DN049.GetStageDone(stageOfReopening))
			DN049.SetStage(stageToSetOnLeavingBeforeReopening)
		endif
		
		;Set AVs on the player and linked actors.
		player.SetValue(DN049_InRelevantStore, 0)
		ObjectReference[] links = Self.GetLinkedRefChain(LinkCustom10)
		int i = 0
		While (i < links.Length)
			links[i].SetValue(DN049_InRelevantStore, 0)
			(links[i] as Actor).EvaluatePackage()
			i = i + 1
		EndWhile
	EndIf
EndFunction