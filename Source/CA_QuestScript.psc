Scriptname CA_QuestScript extends Quest


struct EventDatum
	int Stage
	keyword EventKeyword
	objectReference Optional_Target
	globalvariable Optional_Size
	bool Optional_CheckCompanionProximity = true
	float ResponseDelay
endStruct


Group EventData
	int Property Stage = -1 const auto 
	{Stage that sends the event}

	keyword Property EventKeyword const auto 
	{[FILTER FOR: "CA__"] The keyword representing the event to send}

	objectReference Property Optional_Target const auto
	{Optional: Target of event (used for condtionalizing dialogue)}

	globalvariable Property Optional_Size const auto 
	{Optional [FILTER FOR  "CA_Size"] Override for the size of the event.}

	bool Property Optional_CheckCompanionProximity = true const auto
	{Optional: Default = true}

	float Property ResponseDelay = 1.0 const auto
	{Optional: Default = 0.5}

EndGroup


Group AdditionalStagesAndEvents

EventDatum[] Property EventData const auto

EndGroup


Event OnStageSet(int auiStageID, int auiItemID)
    if auiStageID == Stage
    	FollowersScript.SendAffinityEvent(self, EventKeyword, Optional_Target, Optional_Size, Optional_CheckCompanionProximity, ResponseDelay = ResponseDelay)
    endif

    int i = 0
    while (i < EventData.length)
    	if auiStageID == EventData[i].Stage
    		FollowersScript.SendAffinityEvent(self, EventData[i].EventKeyword, EventData[i].Optional_Target, EventData[i].Optional_Size, EventData[i].Optional_CheckCompanionProximity, ResponseDelay = EventData[i].ResponseDelay)
    	endif

    	i += 1
    endwhile

EndEvent