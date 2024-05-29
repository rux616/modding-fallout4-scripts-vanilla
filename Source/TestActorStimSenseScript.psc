Scriptname TestActorStimSenseScript extends Actor
{Script temping in Stim Sensing of actors}

;***OBSOLETE see AttractionObjectActorScript****


int property PingDelay = 3 const auto hidden
float Property PingRadius = 1000.0 const auto hidden

FollowersStimPropertiesScript Property Followers auto hidden   ;pointer to script attached to Followers quest that holds all the common properties to this temp system in case we want to add this script to other actors without having to redefine everything
StimObjectScript Property StimObject auto hidden

Event OnInit()
    Followers = (Game.GetFormFromFile(0x000289E4, "Fallout4.esm") as quest) as FollowersStimPropertiesScript
EndEvent

Event OnLoad()
    StartTimer(PingDelay)
EndEvent

Event OnTimer(int aiTimerID)
	CheckForStimObjectAndSendStimEvent()
    StartTimer(PingDelay)
EndEvent

Function CheckForStimObjectAndSendStimEvent()
	debug.trace(self + "CheckForStimObjectAndSendStimEvent()")

	StimObject = FindStimObject()
	debug.trace(self + "CheckForStimObjectAndSendStimEvent() OBJECT: " + StimObject)

	if StimObject && CheckKeywords() && CheckLOS()
		debug.trace(self + "CheckForStimObjectAndSendStimEvent() SENDING STORY EVENT")
		Followers.TestStimObjectStart.sendStoryEvent(GetCurrentLocation(), self, StimObject)
	endif

EndFunction

StimObjectScript Function FindStimObject()
	return Game.FindRandomReferenceOfAnyTypeInListFromRef(Followers.TestStimObjectsList, self, PingRadius) as StimObjectScript
EndFunction

bool Function CheckKeywords()

	;*** REMINDER -- these keywords are living on the Companion alias in the Followers quest ***

	bool returnVal = false
	int i = 0

	int len = Followers.StimTypeKeywords.length

	while (i < len && returnVal == false)

		keyword currentKeyword = Followers.StimTypeKeywords[i]
		bool ObjectHasKeyword = StimObject.HasKeyword(currentKeyword)
		bool ActorHasKeyword = HasKeyword(currentKeyword)

		;debug.tracefunction("CheckKeyword() tracing variables")

		returnVal = ObjectHasKeyword && ActorHasKeyword

		;additonal hack for doors which don't have keywords
		if (StimObject.GetBaseObject() as door)
			if HasKeyword(Followers.StimTypeUsedForLockDoors)
				returnVal = true
			endif
		endif

		i += 1
	endwhile

	return returnVal
EndFunction

bool Function CheckLOS()
	;if StimObject.RequiresLOS
	;	debug.trace(self + "CheckLOS - checking if PLAYER has LOS to object -- in future code this will be check if this actor has LOS; can't do that in Papyrus")
	;	if Game.GetPlayer().HasLOS(StimObject)
	;		return True
	;	else
	;		return False
	;	endif

	;else
	;	return true
	;endif

	;for now, so it makes sense when other people are looking at it without me around, just always return true
	return true

EndFunction
