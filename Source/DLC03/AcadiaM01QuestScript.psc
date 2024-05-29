Scriptname DLC03:AcadiaM01QuestScript extends Quest Conditional
{Used to track the reward variable}

Int Property ChaseReward = 0 Auto Conditional

DLC03:DCL03MQ00Script property DCL03MQ00Script auto const mandatory

Event OnQuestInit()
	;Register for Far Harbor kickout custom event
	RegisterforCustomEvent(DCL03MQ00Script, "DLC03FarHarborKickOut")
endevent

Event DLC03:DCL03MQ00Script.DLC03FarHarborKickOut(DLC03:DCL03MQ00Script akSender, Var[] akArgs)
	;if Far Harbor Kickout event triggers, set stage 750. Brooks will have been disabled by this event
	;Stage 750: If stage 100 has not been set on quest AcadiaM01, fail the quest because Brooks won't be there to advance it
	SetStage(750)
EndEvent