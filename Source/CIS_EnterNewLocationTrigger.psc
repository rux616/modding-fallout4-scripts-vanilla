Scriptname CIS_EnterNewLocationTrigger extends ObjectReference Const

keyword Property CIS_ENL_Keyword const auto
{Keyword for the topic to say
filter for "CIS_ENL"
}

Event OnTriggerEnter(ObjectReference akActionRef)

	Actor actorRef = akActionRef as Actor

	if actorRef && actorRef.IsInFaction(Game.GetCommonProperties().CurrentCompanionFaction)
		actorRef.SayCustom(CIS_ENL_Keyword)
	endif


EndEvent