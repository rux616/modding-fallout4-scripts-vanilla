Scriptname BirdCritterScript extends ObjectReference 
{Inivdial bird controls for individual bird behavior}


String  myPerchName 

Bool  birdSpawned = false 

;place to go land
ObjectReference currentPerch
ObjectReference nextPerch
Keyword Property LinkCustom01 auto
{Keyword for Flee marker, used with interior fleeing}
int numLinkedRefs



;Timer id for timer used in basic fly behavior
int flyToTreeID = 1 const
int hidingCaw = 2 const

;sounds
Sound Property NPCCrowCall Auto
Sound Property NPCCrowCallDistressed Auto
Sound Property NPCCrowWingFlap Auto
Sound Property NPCCrowWingFlapLand Auto
Sound Property NPCCrowWingFlapTakeoff Auto
sound myCallSound 
;;
BirdSpawnerScript Property myParentScript Auto
{parent script on trigger}

bool playerInZone = false

Event OnLoad()
	loadBird()

EndEvent

function spawnBird(String akPerchName, BirdSpawnerScript akParentScript )

		 myPerchName = akPerchName
		 myParentScript = akParentScript
		 birdSpawned = true
		 loadBird()
endFunction

function loadBird()
	if Is3dLoaded() && birdSpawned

		;set up current location for distance checking
		currentPerch  = myParentScript.GetLinkedRef()
		;toggle call sound to not distressed
		myCallSound = NPCCrowCall
		;grab the number of landing spots
		numLinkedRefs = myParentScript.countLinkedRefChain()
		;start timer
		timerBetweenFlights()
		;events to get from parent script
	    registerForCustomEvent(myParentScript, "Flee")
	    registerForCustomEvent(myParentScript, "Hide")
	    registerForCustomEvent(myParentScript, "safe")
	    self.SetScale(Utility.RandomFloat(0.8, 1.2))
	    GotoState("Waiting")
	endIf
endFunction

Event OnUnload()
	;Break any registration to events so I can delete them
	unregisterForAllEvents()
    ;clean them up as they will spawn again on load
    disable()
	delete()
	;future home of unregisterForAllEvents
EndEvent

event BirdSpawnerScript.flee(BirdSpawnerScript akSender, Var[] akArgs)
	;If the event comes to flee do it no mateer what
	myCallSound = NPCCrowCallDistressed
	if myParentScript.InteriorFlee == false
		flee()
	else
		GotoState("InteriorFleeState")
		flyToTree(false, true)
	endif

endEvent

event BirdSpawnerScript.hide(BirdSpawnerScript akSender, Var[] akArgs)
	;if this event comes hide no matter what
	debug.trace("got hide event")
	myCallSound = NPCCrowCallDistressed
	flyToTree(true)
	GotoState("Hiding")
endEvent

event BirdSpawnerScript.safe(BirdSpawnerScript akSender, Var[] akArgs)
	;safe mode only takes if you are in hiding mode
endEvent

;basic flight beteen spots
state Waiting 
	Event OnTimer(int aiTimerID)
		if aiTimerID == flyToTreeID
		    flyToTree(false)
		endif
	EndEvent

	;landing flap animation control
	Event OnTranslationAlmostComplete()
		land()
	EndEvent

	;landing flap animation control
	Event OnTranslationComplete()
		;utility.wait(0.3)
		playAnimation("Land")
		timerBetweenFlights()	
	EndEvent
endState


;hiding when player is in trigger
state Hiding

	Event OnBeginState(string asOldState)
	    startTimer(Utility.RandomInt(2, 15), hidingCaw)
	EndEvent

	event BirdSpawnerScript.safe(BirdSpawnerScript akSender, Var[] akArgs)
		playerInZone = false
		GotoState("safe") 
	endEvent

	Event OnTimer(int aiTimerID)
		if aiTimerID == hidingCaw
		    myCallSound.play(self) 
		    startTimer(Utility.RandomInt(2, 15), hidingCaw)
		endif
	EndEvent

	Event OnTranslationAlmostComplete()
		land()
	EndEvent

	;landing flap animation control
	Event OnTranslationComplete()
		;utility.wait(0.3)
		playAnimation("Land")
		;GotoState("safe") 
	EndEvent
endState

;sperate state
state safe
	Event OnBeginState(string asOldState)
		;if playerInZone == true
			myCallSound = NPCCrowCall
			utility.wait(Utility.RandomInt(2, 7))
			flyToTree(false)
			timerBetweenFlights()
			GotoState("Waiting") 
		;endif 
	EndEvent

	event BirdSpawnerScript.safe(BirdSpawnerScript akSender, Var[] akArgs)
		;if you ever get the safe event switch back to using the non hide tree list
		myCallSound = NPCCrowCall
		utility.wait(Utility.RandomInt(2, 7))
		flyToTree(false)
		timerBetweenFlights()
		GotoState("Waiting")
		playerInZone = false
	endEvent
endState

state interiorFleeState
	Event OnTranslationAlmostComplete()
		land()
	EndEvent

	;landing flap animation control
	Event OnTranslationComplete()
		playAnimation("Land")
		flee()

	EndEvent

endState

state flee
	;do nothing
endState

;;;functions-------------------------------------------------------------------------


function timerBetweenFlights()
	startTimer(Utility.RandomInt(10, 25), flyToTreeID)
endFunction

function flyToTree(bool akHide, bool InteriorFlee = false)
		float speedRandomFudge = Utility.RandomFloat(-10.0, 50.0)
		if akHide == false && InteriorFlee == false
			nextPerch = myParentScript.GetNthLinkedRef(Utility.RandomInt(1, numLinkedRefs))
		elseif InteriorFlee == true && akHide == false
			nextPerch = myParentScript.GetLinkedRef(LinkCustom01)
		else
			nextPerch = myParentScript.GetLinkedRef()
			playerinZone = true

		endif
		if currentPerch == nextPerch
			timerBetweenFlights()
		else
			playTakeoffSounds()
			SetAnimationVariableFloat("fDampRate", 1.0)
			SetAnimationVariableFloat("fFlapSpeed", 2.0)
			playAnimation("Takeoff")
			utility.wait(0.1)
			float perchDistance = currentPerch.GetDistance(nextPerch)
			;currentPerch = nextPerch
			SplineTranslateToRefNode(nextPerch, (myPerchName), (perchDistance * 2), 550.0 + speedRandomFudge)
			;debug.trace("I am " + self  + " and I am going to purch on " + crowNumber)
			utility.wait(0.6)
			;slow down winflap speed over time(dampened in graph).
			SetAnimationVariableFloat("fDampRate", 0.05)
			SetAnimationVariableFloat("fFlapSpeed", utility.RandomFloat (1.0, 1.5))
			NPCCrowWingFlap.play(self)
		endif
endFunction


function flee()
	GotoState("flee")
	playTakeoffSounds()
	PlayAnimation("flee")
	utility.wait(4)
	disable()
	delete()
endFunction

function land()
	SetAnimationVariableFloat("fDampRate", 1.0)
	SetAnimationVariableFloat("fFlapSpeed", 2.5)
	playAnimation("LandingGlide")
	playLandingSounds()
	currentPerch = nextPerch
endFunction

;Play takeoff sounds
function playTakeoffSounds()
		myCallSound.play(self)   
		;flapSoundID = NPCCrowWingFlapLP.play(self)
		NPCCrowWingFlapTakeoff.play(self)
endFunction

;Play landing sounds
function playLandingSounds()
		myCallSound.play(self)   
		;Sound.StopInstance(flapSoundID) 
		NPCCrowWingFlapLand.play(self)
endFunction

;;;functions-------------------------------------------------------------------------
