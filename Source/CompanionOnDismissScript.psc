Scriptname CompanionOnDismissScript extends Actor Const
{Registers for Companion change event and sets quest stage if no longer a companion}

Quest Property QuestWithStageToSet const auto
Int Property StageToSet const auto

Event OnInit()
    RegisterForCustomEvent(FollowersScript.GetScript(), "CompanionChange") 
EndEvent

Event FollowersScript.CompanionChange(FollowersScript akSender, Var[] akArgs)
	debug.trace(self + "CompanionChange() akSender:" + akSender + ", akArgs" + akArgs)

	actor ActorThatChanged = akArgs[0] as actor
	bool IsNowCompanion = akArgs[1] as bool

	if ActorThatChanged == self && IsNowCompanion == false
		debug.trace(self + "CompanionChange() setting quest stage: " + QuestWithStageToSet + " -> " + StageToSet)
		QuestWithStageToSet.setStage(StageToSet)
	endif

EndEvent
