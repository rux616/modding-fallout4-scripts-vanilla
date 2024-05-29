Scriptname AttractionObjectActorScript extends Actor
{TEMP SCRIPT

This will be handled by the Attraction Object event system
}


int property PingDelay = 3 const auto hidden
float Property PingRadius = 1000.0 const auto hidden

AOScript Property AO auto hidden   ;pointer to script attached to AO quest that holds all the common properties to this temp system in case we want to add this script to other actors without having to redefine everything
AttractionObjectScript Property AttractionObject auto hidden

Event OnInit()
    AO = (Game.GetFormFromFile(0x000260DA, "Fallout4.esm") as quest) as AOScript
EndEvent

Event OnLoad()
    StartTimer(PingDelay)
EndEvent

Event OnTimer(int aiTimerID)
	CheckForAttractionObjectAndSendStimEvent()
    StartTimer(PingDelay)
EndEvent

Function CheckForAttractionObjectAndSendStimEvent()
	debug.trace(self + "CheckForAttractionObjectAndSendStimEvent()")

	AttractionObject = FindAttractionObject()
	debug.trace(self + "CheckForAttractionObjectAndSendStimEvent() OBJECT: " + AttractionObject)

	if AttractionObject && CheckKeywords() && CheckLOS()
		debug.trace(self + "CheckForAttractionObjectAndSendStimEvent() SENDING STORY EVENT")
		AO.TempAOStart.sendStoryEvent(GetCurrentLocation(), self, AttractionObject)
	endif

EndFunction

AttractionObjectScript Function FindAttractionObject()
	AttractionObjectScript FoundAO = Game.FindRandomReferenceOfAnyTypeInListFromRef(AO.TempAOList, self, PingRadius) as AttractionObjectScript

	if FoundAO && FoundAO.IsDeleted() == false
		return FoundAO
	else
		return None
	endIf
	
EndFunction

bool Function CheckKeywords()

	bool returnVal = false
	int i = 0

	int len = AO.TempAOKeywords.length

	while (i < len && returnVal == false)

		keyword currentKeyword = AO.TempAOKeywords[i]
		bool ObjectHasKeyword = AttractionObject.HasKeyword(currentKeyword)
		bool ActorHasKeyword = HasKeyword(currentKeyword)

		;make sure you put the keyword in the list
		;debug.tracefunction("CheckKeyword() tracing variables")

		returnVal = ObjectHasKeyword && ActorHasKeyword

		;additonal hack for doors which don't have keywords
		if (AttractionObject.GetBaseObject() as door)
			if HasKeyword(AO.AOKeywordForLockDoors)
				returnVal = true
			endif
		endif

		i += 1
	endwhile

	return returnVal
EndFunction

bool Function CheckLOS()
	;if AttractionObject.RequiresLOS
	;	debug.trace(self + "CheckLOS - checking if PLAYER has LOS to object -- in future code this will be check if this actor has LOS; can't do that in Papyrus")
	;	if Game.GetPlayer().HasLOS(AttractionObject)
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
