Scriptname StimBoxScript extends ObjectReference
{Triggerbox used for Actor Stim-Response behavior.

****OBSOLETE see AttactionObject Script****

LRC_XXX properties are meant to represent a "collection" of things to do with/for/to with a collection of LinkedRef's having the keywords listed in LRC_Keywords.

The indexes of each of the LRC_XXX properties should "line up with each other."

Look and comments at top of script and/or jduvall for details.}

;Arrays here represent a collection of LinkReferences and things to do with/for/to them. They all MUST have the same number of items in them and that their indexes represent corresponding items.
;Ex: 2nd keyword in *Keywords* array means that a LinkedRef with that keyword will be in the 2nd "slot" of the collection. Thus the 2nd alias in *Alises* array means that the 2nd LinkRef will be shoved into that alias.

;For convenience, by "default" the BaseObject has arrays setup assuming 4 linkedRefs, with None, False, and "".

;(There can be less linkedRefs hooked up in the renderwindow than the arrays plan for.)

;NOTE this system ASSUMES:
;Only one thing should be interacting with this triggerbox/object at a time.
;All the referenceAliases belong to the same OwningQuest
;The OwningQuest will be shut down when the stim behavior is finished. (This was a promise I had to make to mlipari)
;
;--jduvall}


;**************

;!!!!! THIS SCRIPT IS A WORK IN PROGRESS PROTOTYPE, DON'T ASSUME IT'S ACTUALLY BEING USED YET!!!!!!!!!!!!!!!!!

;If this doesn't meet your needs, talk to jduvall. If we can we'll make the script do what you want and remain backwards compatible.
;If that's not possible, don't copy and paste into a new script. Instead extend this script and reimplement the functions you need to work differently.
;**************


Keyword[] Property LRC_Keywords const auto
{***LinkedRef Collection***

BASEOBJECT PROPERTY

These keywords, in this order, define the the LinkedReferences that the other LRC_XXX array indexes are refering to}

ReferenceAlias[]  Property LRC_Aliases const auto
{***LinkedRef Collection***

REFERENCE PROPERTY

DoMyThing() will ForceRef() the linkedRefs into these aliases in the order they are listed here.

Note: If you don't want a linkedRef to be ForceRef()'d into an alias, set that position in this array to NONE.}

String[] Property LRC_Events const auto
{***LinkedRef Collection***

REFERENCE PROPERTY

DoMyThing() will register for these animation events for LinkedRefs in it's array position. And FinishMyThing() will wait until ANY of them are sent.

Note: If you don't want to register a linkedRef's animation events, clear the data in that position in this array.}

Faction[] Property TO_Factions const auto
{***Triggering Object***
REFERENCE PROPERTY

Do nothing unless the Triggering Object in in ANY of these factions or has any of the TO_Keywords.}

keyword[] Property TO_Keywords const auto
{***Triggering Object***
REFERENCE PROPERTY

Do nothing unless the Triggering Object has ANY of these keywords or is in any of TO_Factions.}

ReferenceAlias Property TO_Alias const auto
{***Triggering Object***
REFERENCE PROPERTY

What ReferenceAlias do we force the Triggering Object into?}

ReferenceAlias Property SB_Alias const auto
{***StimBox***
REFERENCE PROPERTY

What ReferenceAlias do we force the StimBox Trigger (THIS OBJECT) into?}

bool Property S_AllowPlayerToTrigger = false const auto
{***Switch***
REFERENCE PROPERTY

Default = False

In the majority of cases this should be false.}

bool Property S_DisregardFactionAndKeywordCheck = false const auto
{***Switch***
REFERENCE PROPERTY

Default = False - which in the vast majority of cases it should be.

Set this to true if you don't want to check if the triggering object is in TO_Factions or has TO_Keywords}

bool Property S_DoMyThingOncePerLoad = false const auto
{***Switch***
REFERENCE PROPERTY

Default = False

Only ever DoMyThing() once per load.}

float Property T_WarmUp = -1.0 const auto
{***Time Limit***
REFERENCE PROPERTY
-OPTIONAL-

How many seconds should we wait until we DoMyThing() after the trigger is entered?}

float Property T_FailSafe = -1.0 const auto 
{***Time Limit***
REFERENCE PROPERTY
-OPTIONAL-

How many seconds should we go after starting DoMyThing() before we assume we should run DoneMyThing() ?}

int Property S_ChanceToTigger = 100 const auto
{***Setting***
REFERENCE PROPERTY

Default: 100

% chance behavior will happen if trigger object qualifies.}

bool DidMyThingOnceThisLoad

bool OnTriggerEnterLock

Event OnInit()
	CheckData()
EndEvent

Event OnLoad()
	if S_DoMyThingOncePerLoad
		DidMyThingOnceThisLoad = false
	endif	
EndEvent

State DoingMyThing
	Event OnBeginState(string asOldState)
		debug.trace(self + "Gone to state 'DoingMyThing'")    
	EndEvent

	Event OnTriggerEnter(ObjectReference akActionRef)
		debug.trace(self + "OnTriggerEnter() but in State DoingMyThing. " + akActionRef)
	EndEvent

endState

State FinishingMyThing
	Event OnBeginState(string asOldState)
		debug.trace(self + "Gone to state 'FinishingMyThing'")    
	EndEvent

	int Function FinishMyThing(ScriptObject CallingScript)
		debug.trace(self + "FinishMyThing() in FinishingMyThing -- ie I'm CURRENTLY WRAPPING UP MY THING so do nothing")
	EndFunction

	Event OnTimer(int aiTimerID)
		debug.trace(self + "OnTimer() in FinishingMyThing -- ie I'm CURRENTLY WRAPPING UP MY THING so do nothing")
	EndEvent

endState

Event OnTriggerEnter(ObjectReference akActionRef)
	while OnTriggerEnterLock
		utility.wait(0.2)
	endwhile

	if GetState() == "DoingMyThing"
		return
	endif

	OnTriggerEnterLock = true

	debug.trace(self + "OnTriggerEnter")

    if CheckChanceToHappen() && CheckAndSetMyDoOnceStatus() && CheckTriggeringObjectAndDoOnceStatus(akActionRef)
    	GotoState("DoingMyThing")
    	debug.trace(self + "OnTriggerEnter(): CheckTriggeringObjectAndDoOnceStatus() returned true")
    	DoMyThing(akActionRef)

    else
    	debug.trace(self + "OnTriggerEnter(): CheckChanceToHappen() || CheckTriggeringObjectAndDoOnceStatus() || CheckAndSetMyDoOnceStatus() returned false")

    endif

	OnTriggerEnterLock = false
   
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    debug.trace(self + "OnAnimationEvent() " + akSource + ", " + asEventName)

    ;REMINDER: if ANY of the registered linked ref's registered event returns, we consider "my thing" to be done
    if DoesSourceMatchEventRegisteredFor(aksource, asEventName)
    	FinishMyThing(self)
    endif

EndEvent

Event OnTimer(int aiTimerID) 
	debug.trace(self + "OnTimer() aiTimerID:" + aiTimerID)

	;T_FailSafe timer
    FinishMyThing(self)


EndEvent

Function CheckData()
	if (LRC_Events.Length != LRC_Aliases.Length != LRC_Keywords.Length) == false
		debug.trace("WARNING: LinkedRefCollection (LRC_) Arrays are not indentical length. " + self, 2)

	endif 
	
EndFunction

bool Function CheckAndSetMyDoOnceStatus()
	debug.trace(self + "CheckAndSetMyDoOnceStatus()")

	bool returnVal

	if S_DoMyThingOncePerLoad && DidMyThingOnceThisLoad
		returnVal = False
	else
		returnVal = true
	endif

	if S_DoMyThingOncePerLoad
		DidMyThingOnceThisLoad = true
	endif	

	debug.trace(self + "CheckAndSetMyDoOnceStatus() returnVal = " + returnVal)

	RETURN returnVal

EndFunction

bool Function CheckTriggeringObjectAndDoOnceStatus(ObjectReference ObjectToCheck)
	debug.trace(self + "CheckTriggeringObjectAndDoOnceStatus() " + ObjectToCheck)
	
	bool returnVal

	;LOGIC FOR CHECKING IF TRIGGERING OBJECT SHOULD CARE ABOUT THIS STIM GOES HERE

	if S_AllowPlayerToTrigger == false && ObjectToCheck == Game.GetPlayer()
		returnVal = false

	else
		returnVal = CheckFactions(ObjectToCheck as Actor) || CheckKeywords(ObjectToCheck)

	endif
	
	RETURN returnVal

EndFunction

bool Function CheckChanceToHappen()
	int roll = utility.RandomInt(1, 100)
	bool returnVal = Roll <= S_ChanceToTigger

	debug.trace(self + "CheckChanceToHappen() S_ChanceToTigger:" + S_ChanceToTigger + ", Roll: " + Roll +", returning: " + returnVal)

	RETURN returnVal
EndFunction

bool Function CheckFactions(Actor ActorToCheck)

	bool ReturnVal 

	if S_DisregardFactionAndKeywordCheck 
		returnVal = true
	else
		returnVal = CommonArrayFunctions.CheckActorAgainstFactionArray(ActorToCheck, TO_Factions)
	endif

	debug.trace(self + "CheckFactions() returning: " + returnVal)

	RETURN returnVal

EndFunction

bool Function CheckKeywords(ObjectReference ObjectToCheck)

	bool ReturnVal
	
	if S_DisregardFactionAndKeywordCheck 
		returnVal = true
	else
		returnVal = CommonArrayFunctions.CheckObjectAgainstKeywordArray(ObjectToCheck, TO_Keywords)
	endif

	debug.trace(self + "CheckKeywords() returning: " + returnVal)

	RETURN returnVal

EndFunction

int Function DoMyThing(ObjectReference TriggeringObject)
	debug.trace(self + "DoMyThing()")

	if T_FailSafe > -1.0
		StartTimer(T_FailSafe)
	endif

	if T_WarmUp > 0.0
		debug.trace(self + "DoMyThing() will wait for T_WarmUp: " + T_WarmUp)
		utility.wait(T_WarmUp)
	endif


	RegisterForAnimationEvents()
	ForceLinkedRefsIntoAliases()
	ForceTriggeringObjectIntoAlias(TriggeringObject)
	ForceTriggerBoxIntoAlias()


	int returnVal = 1 ;for now always assume it was "successful" - this is here mostly for future extendability in case someone wants to extend this functionality and get a return value
	RETURN returnVal


EndFunction

Function RegisterForAnimationEvents()
	debug.trace(self + "registerForAnimationEvents()")
	int i = 0
	while (i < LRC_Events.length)
		if LRC_Events[i]
			ObjectReference CurrentLinkedRef = GetLinkedRef(LRC_Keywords[i])
			String EventName = LRC_Events[i]
			debug.trace(self + "registerForAnimationEvents() LinkedRef: " + CurrentLinkedRef + ", Event: " + EventName)
			registerForAnimationEvent(CurrentLinkedRef, EventName)
		endif
		i += 1
	endwhile
EndFunction

Function ForceLinkedRefsIntoAliases()
	debug.trace(self + "ForceLinkedRefsIntoAliases()")

	if LRC_Aliases.length == 0
		debug.trace("Caution: ForceLinkedRefsIntoAliases() found 0 length LRC_Alias array!" + self, 1)
		RETURN
	endif

	StartAliasOwningQuestAndWait(LRC_Aliases[0])

	;LOOP THROUGH ALIASES ARRAY AND FOR CORRESPONDING LINKED REFS INTO THEM
	int i = 0
	while (i < LRC_Aliases.length)
		if LRC_Aliases[i]
			
			ReferenceAlias RefAlias = LRC_Aliases[i]
			ObjectReference CurrentLinkedRef = GetLinkedRef(LRC_Keywords[i])
			
			if CurrentLinkedRef
				debug.trace(self + "ForceLinkedRefsIntoAliases() LinkedRef: " + CurrentLinkedRef + ", RefAlias: " + RefAlias)
				RefAlias.ForceRefTo(CurrentLinkedRef)
			endif
		endif
		i += 1
	endwhile

EndFunction

Function ForceTriggeringObjectIntoAlias(ObjectReference TriggeringObject)
	debug.trace(self + "ForceTriggeringObjectIntoAlias() " + TriggeringObject)
	if TO_Alias
		StartAliasOwningQuestAndWait(TO_Alias)
		TO_Alias.ForceRefTo(TriggeringObject)
	endif
EndFunction

Function ForceTriggerBoxIntoAlias()
	debug.trace(self + "ForceTriggerBoxIntoAlias() ")
	if SB_Alias
		StartAliasOwningQuestAndWait(SB_Alias)
		SB_Alias.ForceRefTo(self)
	endif
EndFunction

Function StartAliasOwningQuestAndWait(ReferenceAlias RefAliasWhoseQuestToStart)
	debug.trace(self + "StartAliasOwningQuestAndWait()" + RefAliasWhoseQuestToStart)
	ReferenceAlias RefAlias = RefAliasWhoseQuestToStart
	Quest OwningQuest = RefAlias.GetOwningQuest()
	
	OwningQuest.Start()

	int waitingFor
	while OwningQuest.IsRunning() == false
		utility.wait(1)
		waitingFor += 1
		debug.trace(self + "StartAliasOwningQuestAndWait() waiting for Quest to start. Waiting for:" + waitingFor)
	endwhile

EndFunction

Function StopAliasOwningQuest(ReferenceAlias RefAliasWhoseQuestToStop)
	debug.trace(self + "StopAliasOwningQuest()" + RefAliasWhoseQuestToStop)
	ReferenceAlias RefAlias = RefAliasWhoseQuestToStop
	Quest OwningQuest = RefAlias.GetOwningQuest()
	
	OwningQuest.Stop()
EndFunction

Function StopQuestForAliases()
	debug.trace(self + "StopQuestForAliases()")
	;just to be on the safe side, stop the quest the same way you started, JUST IN CASE not all the alias were in the same quest -- which would be not what was intended
	if LRC_Aliases
		StopAliasOwningQuest(LRC_Aliases[0])
	endif

	if TO_Alias
		StopAliasOwningQuest(TO_Alias)
	endif

	if SB_Alias
		StopAliasOwningQuest(SB_Alias)
	endif

EndFunction

bool Function DoesSourceMatchEventRegisteredFor(ObjectReference akSource, string asEventName)
	debug.trace(self + "CompareSourceAndAnimationEvent()")
	int i = 0
	bool found = false
	while (found == false && i < LRC_Events.length)
		if LRC_Events[i]
			if GetLinkedRef(LRC_Keywords[i]) == akSource
				found = true
			endif
		endif
		i += 1
	endwhile

	RETURN found

EndFunction


int Function FinishMyThing(ScriptObject CallingScript)
	GotoState("FinishingMyThing")
	debug.trace(self + "FinishMyThing() called by " + CallingScript)
	
	CancelTimer()
	StopQuestForAliases()
		
	GotoState(None)

	int returnVal = 1 ;for now always assume it was successful
	RETURN returnVal

EndFunction