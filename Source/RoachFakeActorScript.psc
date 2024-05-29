Scriptname RoachFakeActorScript extends ObjectReference

ObjectReference myNextLinkedRef

int numLinkedRefs
int nextPointIndex 

int waitTimerID


float Property tang = 800.0 Auto
float speed = 150.0
float rot = 150.0

bool isHidden = false
bool Property chanceToAdvanceOnAlmostComplete = true Auto

Event OnInit()
	;BlockActivation(true)
	;RegisterForAnimationEvent(game.getPlayer(), "WeaponFire")
EndEvent

Event OnCellLoad()
  ;BlockActivation(true) 
  if isHidden == true
  	enable()
  	playAnimation("reset")
  endif
  numLinkedRefs = countLinkedRefChain()  
  setWalkSpeeds()
  nextPointIndex = 1
  self.MoveTo(GetNthLinkedRef(nextPointIndex), abMatchRotation = true) 
  ;playAnimation("Idle")
  startTimer(Utility.RandomInt(5, 6), waitTimerID)
  ;utility.wait(2)
  ;playAnimation("Walk")
  SetScale(Utility.RandomFloat(0.75, 0.85))
  goToState ("waiting")
EndEvent

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
   goToState ("runAndHide")
    setRunSpeeds()
   runToNextSpot()
EndEvent


function pickNexSpot()
	;nextPointIndex = Utility.RandomInt(1, numLinkedRefs-1)
	nextPointIndex = nextPointIndex + 1
	if nextPointIndex == numLinkedRefs
		nextPointIndex = 1
	endif
	myNextLinkedRef = GetNthLinkedRef(nextPointIndex)
endFunction

function setWalkSpeeds()
	speed = 150.0
	rot = 150.0
endFunction

function setRunSpeeds()
	speed = 350.0
	rot = 300.0
endFunction


function walkToNextSpot()
	playAnimation("Walk")
	SplineTranslateToRef(myNextLinkedRef, tang, speed, rot)  
endFunction

function runToNextSpot()
	playAnimation("Run")
	SplineTranslateToRef(myNextLinkedRef, tang, speed, rot)  
endFunction

State waiting
Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
   goToState ("runAndHide")
   nextPointIndex = nextPointIndex + 1
    setRunSpeeds()
   runToNextSpot()
EndEvent
	Event OnTimer(int aiTimerID)
	    if aiTimerID == waitTimerID
	    	pickNexSpot()
	    	walkToNextSpot()
	    	goToState ("walking")
	    endif
	EndEvent
endState

State walking
	; Event OnAnimationEvent(ObjectReference akSource, string asEventName)
 ;   		goToState ("runAndHide")
 ;   		nextPointIndex = nextPointIndex + 1
 ;    	setRunSpeeds()
 ;  		runToNextSpot()
	; EndEvent
	Event OnTranslationAlmostComplete()
	    int chanceToKeepWalking = Utility.RandomInt(1, 5)
	    if chanceToKeepWalking == 1 && chanceToAdvanceOnAlmostComplete == true
	    	pickNexSpot()
	    	walkToNextSpot()
	    endif
	EndEvent
	Event OnTranslationComplete()
		goToState ("waiting")
	    playAnimation("Idle")
	    startTimer(Utility.RandomInt(1, 10), waitTimerID)
	EndEvent
endState

State runAndHide
	Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	    goToState("doNothing")
	EndEvent
	Event OnTranslationAlmostComplete()
	    nextPointIndex = nextPointIndex + 1
	    myNextLinkedRef = GetNthLinkedRef(nextPointIndex)
	    if nextPointIndex <= numLinkedRefs
	    	runToNextSpot()
	    endif
	EndEvent
	Event OnTranslationComplete()
		if nextPointIndex > numLinkedRefs
		    playAnimation("Idle")
		    disable()
		    isHidden = true
		 endif
	EndEvent
endState

State doNothing
endState

