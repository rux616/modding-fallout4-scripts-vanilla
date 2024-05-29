Scriptname CA_DialogueBump_TopicInfoScript extends TopicInfo

;THIS SCRIPT IS DEPRECATED
; **** !!!!! HOWEVER, WE ARE KEEPING IT IN CASE WE NEED TO RETRIEVE THE DATA IN THE ARRAYS !!!! ********

keyword[]  Property CA_CustomEvents auto const 
{Add keyword associated with if each companion likes or dislikes this.
Example: CA_CustomEvent_CaitDislikes, CA_CustomEvent_CodsworthLoves}

string Property Description const auto
{Description for Companion Owners to use to gain context for what this affinity bump is responding to.}

;/
event OnInit()
	debug.OpenUserLog("AffinityEventData")

	FollowersScript followers = FollowersScript.GetScript()
	int f = 51 ; start of follower affinity data
	while f < 111
		keyword keyword1 = followers.AffinityEvents[f].EventKeyword
		keyword keyword2 = followers.AffinityEvents[f+1].EventKeyword
		keyword keyword3 = followers.AffinityEvents[f+2].EventKeyword
		keyword keyword4 = followers.AffinityEvents[f+3].EventKeyword
		keyword keyword5 = followers.AffinityEvents[f+4].EventKeyword

		; now find any of these keywords in CA_CustomEvents
		Keyword foundKeyword = NONE

;	debug.trace(self + " START")
		int i = 0
		while (i < CA_CustomEvents.length && foundKeyword == NONE)
			if CA_CustomEvents[i] == keyword1 || CA_CustomEvents[i] == keyword2 || CA_CustomEvents[i] == keyword3 || CA_CustomEvents[i] == keyword4 || CA_CustomEvents[i] == keyword5
				foundKeyword = CA_CustomEvents[i]
			endif
			i += 1
		endwhile

		if foundKeyword
			debug.traceUser("AffinityEventData", self + "	" + (GetOwningQuest() as Quest) + "	" + foundKeyword + "	" + Description)
		else
			; didn't find keyword, use fake NEUTRAL keyword
			debug.traceUser("AffinityEventData", self + "	" + (GetOwningQuest() as Quest) + "	" + keyword1 + "NEUTRAL	" + Description)
		endif			


		f = f + 5
	endWhile
;	debug.trace(self + " END")
EndEvent

/;


;/
Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	if abHasBeenSaid
		debug.trace(self + "HasBeenSaid, so NOT sending affinity event")
		RETURN
	endif


	;Clear any LastDialogueBump data in case it wasn't cleared already (because player bailed out of a previous conversation)
	RefCollectionAlias ActiveCompanions = FollowersScript.GetScript().ActiveCompanions
	int i = 0
	int count = ActiveCompanions.GetCount()
	while (i < count)
		((ActiveCompanions.GetAt(i) as actor) as CompanionActorScript).SetLastDialogueBump(None)
		i += 1
	endwhile


	;send affinity events:
	i = 0
	while (i < CA_CustomEvents.length)
		debug.trace(self + " sending affinity event " + CA_CustomEvents[i])
		FollowersScript.SendAffinityEvent(self, CA_CustomEvents[i], ShouldSuppressComment = false, IsDialogueBump = true)

		i += 1
	endwhile
EndEvent
/;