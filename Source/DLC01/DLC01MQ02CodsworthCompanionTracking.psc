Scriptname DLC01:DLC01MQ02CodsworthCompanionTracking extends ReferenceAlias

Quest Property DLC01MQ02 Auto Const

FollowersScript Property Followers const auto mandatory

Event OnInit()
    	 RegisterForCustomEvent(Followers, "CompanionChange")
EndEvent

Event FollowersScript.CompanionChange(FollowersScript akSender, Var[] akArgs)

	actor ActorThatChanged = akArgs[0]  as Actor
	bool IsNowCompanion = akArgs[1] as bool

	Actor DLC01Ada = GetActorReference()

	if ActorThatChanged == DLC01Ada && IsNowCompanion == False

		If DLC01MQ02.IsObjectiveDisplayed(2800) == 1
			DLC01MQ02.SetObjectiveDisplayed(2800, False)
			DLC01MQ02.SetObjectiveCompleted(2700, False)
			DLC01MQ02.SetObjectiveDisplayed(2700)
			DLC01MQ02.SetStage(2700)
		EndIf

	EndIf

EndEvent