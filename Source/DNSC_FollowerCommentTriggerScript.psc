Scriptname DNSC_FollowerCommentTriggerScript extends ObjectReference Hidden
{Plays a follower commentary line when the follower enters the trigger.}

ReferenceAlias property Companion Auto Const
{Companion alias from Followers quest.}

Keyword property CustomTopicKeyword Auto Const
{Keyword for the AO Comment to say.}

Keyword property LinkDisable Auto Const
{Keyword for a linkedref to disable when this trigger is activated.}

bool property EnsureNotInCombat Auto Const
{Don't trigger the line if the player or the companion are in combat.}

Auto State Ready
	Event OnTriggerEnter(ObjectReference akActionRef)
		Debug.Trace("DNSC FollowerCommentTriggerScript: Entered by " + akActionRef)
		Actor akActionActor = akActionRef as Actor
		if ((akActionActor != None) && (akActionActor == Companion.GetActorRef()))
			if (EnsureNotInCombat)
				StartTimer(0, 1)
			Else
				GoToState("Done")
				if (Self.GetLinkedRef(LinkDisable) != None)
					Self.GetLinkedRef(LinkDisable).Disable()
				EndIf
				akActionActor.SayCustom(CustomTopicKeyword)
			EndIf
		EndIf
	EndEvent

	Event OnTriggerLeave(ObjectReference akActionRef)
		Debug.Trace("DNSC FollowerCommentTriggerScript: Left by " + akActionRef)
		Actor akActionActor = akActionRef as Actor
		if (akActionActor == Companion.GetActorRef())
			CancelTimer(1)
		EndIf
	EndEvent

	Event OnTimer(int timerID)
		if (!Game.GetPlayer().IsInCombat() && !Companion.GetActorRef().IsInCombat())
			GoToState("Done")
			if (Self.GetLinkedRef(LinkDisable) != None)
				Self.GetLinkedRef(LinkDisable).Disable()
			EndIf
			Companion.GetActorRef().SayCustom(CustomTopicKeyword)
		Else
			StartTimer(2, 1)
		EndIf
	EndEvent
EndState

State Done
	Event OnTriggerEnter(ObjectReference akActionRef)
		;Do nothing
	EndEvent
EndState