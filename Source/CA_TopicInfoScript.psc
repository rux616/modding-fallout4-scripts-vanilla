Scriptname CA_TopicInfoScript extends TopicInfo

Group EventData
	keyword Property EventKeyword const auto 
	{[FILTER FOR: "CA__"] The keyword representing the event to send}

	ObjectReference Property EventTarget const auto
	{Optional: what is the target of the event. Used for conditionalizing dialogue - usually unset}

EndGroup


Group Advanced Collapsed
	bool Property OnBegin = false const auto
	{Default: False, Send Event OnBegin?}

	bool Property OnEnd = true const auto
	{Default: True, Send Event OnEnd?}

	globalvariable Property Size const auto 
	{[FILTER FOR  "CA_Size"] Override for the size of the event. Usually not needed.}

	bool Property CheckCompanionProximity = true const auto
	{Default = true}

EndGroup

Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	sendEvent(OnBegin)
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	sendEvent(OnEnd)
EndEvent

function sendEvent(bool shouldSendEvent)
	if shouldSendEvent
		FollowersScript.SendAffinityEvent(self, EventKeyword, EventTarget, size, CheckCompanionProximity)
	endif
Endfunction