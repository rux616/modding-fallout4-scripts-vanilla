Scriptname RETriggerScript extends ObjectReference Conditional

{Extends ObjectReference, used to trigger a Wilderness Encounter radiant quest/scene.}

;This trigger script sends a story manager event to start a wilderness enounter. The type of encounter is determined by the EncounterType keyword (which should be set on the base object for simplicity,
;since the markers that are needed by different encounter types are different.)

;Base Object Properties
bool Property TriggerOnLoad = true Auto
{BASEOBJECT: Should this triggerbox be triggered when it loads instead of when the player enters it?
  depends on EncounterType - see below}

Group TurnOffTrigger
{ set these flags if you want this trigger turned off until the specified event has happened }
	bool Property OffUntilPlayerBeenToDiamondCity = false Auto
	{ set to true if you want this trigger to be off until the player reaches Diamond City }
endGroup

keyword Property EncounterType Auto const  mandatory
{BASEOBJECT property - RE encounter type keyword to be sent by this trigger
SCENE: triggered OnLoad, with mainly a static group of markers near the trigger
TRAVEL: triggered OnTrigger, with widely separated markers (which must not be visible from the trigger)
CAMP: triggered OnLoad, with markers and static camp clutter
PLACED: triggered OnLoad, used to place objects. These triggers will NOT reset.
ASSAULT: triggered OnLoad, building with defensive markers plus distant markers for attackers to spawn at
CHOKEPOINT: triggered OnLoad, markers for ambushes etc.
}

keyword[] Property ProhibitedEncounterCategories auto hidden
{ 	OBSOLETE }

keyword[] Property TriggerKeywords auto
{ 	add keywords you want to add to this trigger
	(valid keywords use naming format RETriggerXXX)
 }

REParentScript Property REParent Auto const mandatory
{BASEOBJECT property - REParent quest, used to send cleanup custom event }

;Reference Properties

int Property EventNum = -1 Auto
{REFERENCE property OPTIONAL: Used to start specific encounters - sent as aiValue1}

bool Property EventNumClearedAfterSpawning = True Auto
{REFERENCE property OPTIONAL: default = TRUE; if EventNum is used to spawn a specific encounter, should this be cleared so the next time this trigger activates it picks a random one?}

float Property DaysUntilReset = -1.0 Const Auto
{REFERENCE property OPTIONAL: if set, Trigger will not allow additional keyword events to fire until game hours specified has passed

Hours and minutes expressed as GameDaysPassed:
Hour: 1/24 = .04167
Minute: 1/(24*60) = .0006945 
So to add 4 hours would be (.04167 * 4) = 0.17}

;internal properties

Int Property myLocationID auto Hidden				;an integer associated with trigger location (used to be myHoldID) - potentially will be used for location type (urban, rural, coastal, road, etc.)

bool Property inStateOff auto Hidden Conditional		;Provides a way for condition functions to query the state of a specific trigger.
											;Used, for example, by DN123 - Skylanes, which needs to ensure its event will fire when its trigger loads.

bool Property HasBeenInitialized auto Conditional ;Has this trigger been initialized before? 

Quest Property myQuest auto Hidden					; record what quest was started by this trigger, for debugging and use by REChokepointTriggerScript.

bool keywordsInitialized = false

float TriggerResetTimer = 0.0

function InitKeywords()
	if keywordsInitialized == false
		keywordsInitialized = true
	    ; add any keywords
	    int i = 0
	    while (i < TriggerKeywords.length)
	    	AddKeyword(TriggerKeywords[i])
	    	i += 1
	    endwhile
	endif
EndFunction

State Off
	Event OnBeginState(string asOldState)
		inStateOff = True
	EndEvent

	Event OnEndState(string asNewState)
		inStateOff = False
	EndEvent
EndState

State triggered
	; trigger has fired event - waiting for a quest to set to Off (meaning a quest has successfully started)
	; otherwise, reset to On in OnCellLoad
	event OnCellLoad()
		debug.trace(self + " 'triggered' state - OnCellLoad")
		gotoState("On")
		OnCellLoad()
	endEvent
endState

Auto State On
	Event OnTriggerEnter(ObjectReference akActionRef)
		if TriggerOnLoad == true || akActionRef != Game.GetPlayer()
			return
		EndIf

		StartEncounter()
		
	EndEvent

	Event OnCellLoad()
		debug.trace(self + " 'on' state - OnCellLoad")
		if TriggerOnLoad
			StartEncounter()
		EndIf

	EndEvent
endState


function StartEncounter()
	GoToState("Triggered")
	
	if IsDisabled()	|| IsTurnedOff()	;Short circuit if i'm disabled
		GoToState("On")
		Return	
	EndIf
	
	;debug.trace(self + "Starting encounter. Days until reset: "+ DaysUntilReset +", TriggerResetTimer: "+ TriggerResetTimer)
	;debug.trace(self + "Current game time: "+ Utility.GetCurrentGameTime())

	;If this trigger doesn't use the Trigger Reset Timer, or the timer has been passed, trigger
	if DaysUntilReset == -1.0 || Utility.GetCurrentGameTime() >= TriggerResetTimer
		debug.trace(self + "StartEncounter")
		; send cleanup event
		REParent.SendCustomEvent("RECheckForCleanup")

		; make sure keywords initialized
		InitKeywords()
	
		debug.trace(self + "Player distance from trigger: " + Game.GetPlayer().GetDistance(self))

		; send story event
		if EncounterType.SendStoryEventAndWait(GetCurrentLocation(), Self, None, myLocationID, EventNum) == false
			Game.warning(self + " Failed to start a random encounter. Check number of actors loaded in this area, and number of REs currently running.")
		endif
		if EventNumClearedAfterSpawning == True
			EventNum = -1
		EndIf
	
	endif

EndFunction

bool function IsTurnedOff()
	; TODO - get more sophisticated as we add more "off" flags
	bool turnedOff = false
	if (OffUntilPlayerBeenToDiamondCity && REParent.PlayerBeenToDiamondCity.GetValue() == 0)
		turnedOff = true
	EndIf

	return turnedOff
EndFunction

function QuestStarted(Quest newQuest)
	debug.trace(self + "QuestStarted " + newQuest)
	myQuest = newQuest		; record new quest, for debugging
	HasBeenInitialized = true

	REScript MyCurrentQuest = (myQuest as REScript)

	;If this quest has a reset timer, set it now
	;debug.trace(self + "Quest started. Days until reset: "+ DaysUntilReset +", TriggerResetTimer: "+ TriggerResetTimer)
	if DaysUntilReset > -1 && MyCurrentQuest && MyCurrentQuest.SetResetTimer
		TriggerResetTimer = Utility.GetCurrentGameTime() + DaysUntilReset
	endif

	GotoState("Off")
EndFunction

function ReArmTrigger()
	GotoState("On")
 	debug.trace(self + " ReArmTrigger")
EndFunction
