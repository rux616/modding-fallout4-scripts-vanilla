Scriptname DN084_ControlRoomSandboxTriggerScript extends ObjectReference Hidden
{Trigger around the lower control room and reactor in DN084 - Mass Fusion. Forwards Entry/Exit events by the player or quest aliases to DN084_OverridesQuestScript for handling.}

Group Required_Properties
	;NOTE: These ReferenceAliases can change mid-quest, so it's better not to save off local refs in this case.

	ReferenceAlias property QuestCompanion Auto Const Mandatory
	{The DN084 Quest Companion, Ingram or Filmore.}

	ReferenceAlias property Companion Auto Const Mandatory
	{The Companion alias.}

	ReferenceAlias property Dogmeat Auto Const Mandatory
	{The Dogmeat alias.}

	DN084_OverridesQuestScript property DN084_Overrides Auto Const Mandatory
	{The DN084 Overrides quest.}
EndGroup

;When the player or any follower enters the trigger, notify the Overrides quest.
Event OnTriggerEnter(ObjectReference akActivator)
	if ((akActivator == Game.GetPlayer()) || (akActivator == QuestCompanion.GetActorRef()) || (akActivator == Companion.GetActorRef()) || (akActivator == Dogmeat.GetActorRef()))
		;Debug.Trace("DN084_ControlRoomSandboxTriggerScript OnTriggerEnter from: " + akActivator)
		DN084_Overrides.ControlRoomTriggerEntered(akActivator as Actor)
	EndIf
EndEvent

;When the player or any follower leaves the trigger, notify the Overrides quest.
Event OnTriggerLeave(ObjectReference akActivator)
	if ((akActivator == Game.GetPlayer()) || (akActivator == QuestCompanion.GetActorRef()) || (akActivator == Companion.GetActorRef()) || (akActivator == Dogmeat.GetActorRef()))
		;Debug.Trace("DN084_ControlRoomSandboxTriggerScript OnTriggerLeave from: " + akActivator)
		DN084_Overrides.ControlRoomTriggerLeft(akActivator as Actor)
	EndIf
EndEvent

;When the player leaves the cell, notify the Overrides quest.
Event OnCellDetach()
	DN084_Overrides.ControlRoomCellDetach()
EndEvent