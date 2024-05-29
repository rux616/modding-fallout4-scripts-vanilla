Scriptname DN049_PlayerAliasScript extends ReferenceAlias Const Hidden
{Script on the player alias on DN049. Handles OnSit/OnGetUp events for DN049's Diner Booth interactions.}

DN049QuestScript property DN049 Auto Const
{DN049}

ObjectReference[] property DN049_DinerBooths Auto Const
{An array of the booths in DN049's Diner area, with the 'Player's Booth' in index 0.}

ReferenceAlias property Diner_Waitron Auto Const
{Waitron, the waiter robot.}


;Watch for the player to sit in one of the DN049 Diner Booths, then update the quest as appropriate.
Event OnSit(ObjectReference akFurniture)
	int findIndex = DN049_DinerBooths.Find(akFurniture)
	if ((findindex >= 0) && (DN049.GetStageDone(350)))
		;If the player sits in any diner booth after the Grand Reopening (Stage 350), send Waitron over to wait on them.
		DN049.UpdateWaitronState(True)
	ElseIf ((findIndex == 0) && !(DN049.GetStageDone(350)) && (DN049.GetStageDone(310)))
		;If the player sits in one specific diner booth (index 0) as part of a scene (Stage 310) before the Grand Reopening (Stage 350), advance the quest.
		DN049.SetStage(320)
	EndIf
EndEvent

;If the player gets up, update the quest as appropriate.
Event OnGetUp(ObjectReference akFurniture)
	;Debug.Trace("Got up")
	int findIndex = DN049_DinerBooths.Find(akFurniture)
	if ((findIndex == 0) && !(DN049.GetStageDone(350)) && (DN049.GetStageDone(320)))
		;If the player gets up from one specific diner booth (index 0) as part of a scene (Stage 320) before the Grand Reopening (Stage 350), advance the quest.
		;Debug.Trace("Stage set")
		DN049.SetStage(330)
	ElseIf ((findIndex >= 0) && (DN049.GetStageDone(350)))
		;If the player is sitting in any diner booth after the Grand Reopening (Stage 350), and gets up, cancel Waitron's behavior.
		DN049.UpdateWaitronState(False)
	EndIf
EndEvent