Scriptname BugSwarmFXScript extends ObjectReference
{controls the swarm of flies
 KMK - this may eventually extend a version of the Skyrim Critter script
 for now, keeping it simpler}

float myStartX
float myStartY
float myStartZ
float myStartRX
float myStartRY
float myStartRZ
float myCurrentTargetX
float myCurrentTargetY
float myCurrentTargetZ
float Property mySpeed = 275.0 Auto
int Property chaseTime = 20 Auto
int cancelTimerId = 1
int updateTimerId = 2
actor PlayerRef
actor ActorRef
bool Property goHomeWhenDone = true Auto

Bool property CleanMyselfUp = false auto
{ true: for initially disabled vultures which enable themselves when they unload, and then clean themselves up on next unload }


Event OnInit()
	ResetHomeCoords()	; set starting location as "home"
	PlayerRef = game.getPlayer()
EndEvent

Event OnTimer(int aiTimerID)
	if aiTimerID == cancelTimerId
		goHome()
	endif
EndEvent

Event OnUnload()
	if CleanMyselfUp
		if IsEnabled() == false
			debug.trace(self + " OnUnload: enabling")
			enable()
		else
			debug.trace(self + " OnUnload: already enabled, so deleting myself")
			delete()
		endif
	endif
	
endEvent

Auto State waiting
	Event OnBeginState(string asOldState)
		debug.trace(self + " has started waiting")
	EndEvent

	Event OnTriggerEnter(ObjectReference akActionRef)
		; if living actor gets near, trigger:
		ActorRef = akActionRef as Actor
		if ActorRef && !ActorRef.IsDead()
			debug.trace(self + " has been triggered")

		startFollowing()

		endif
	EndEvent
EndState


State chasing

	Event OnTimer(int aiTimerID)
		; if unloaded, don't do anything
		if Is3DLoaded()
	 		if aiTimerID == updateTimerId
	 			myCurrentTargetX = ActorRef.GetPositionX()
	 			myCurrentTargetY = ActorRef.GetPositionY()
	 			myCurrentTargetZ = ActorRef.GetPositionZ()
	 			TranslateTo(myCurrentTargetX, myCurrentTargetY, myCurrentTargetZ + 120, 0, 0, 0, mySpeed)
	 			;TranslateToRef(ActorRef, mySpeed)
	 			StartTimer(0.5, updateTimerId)
	 		elseif aiTimerID == cancelTimerId
	 			goHome()

	 		endif
	 	endif
 	EndEvent
EndState

function goHome()
	if goHomeWhenDone == true
 	    debug.trace(self + " is headed home")
		TranslateTo(myStartX, myStartY, myStartZ, myStartRX, myStartRY, myStartRZ, mySpeed)
		GotoState("waiting")
	else
		;leave it where it lies
	endif

endFunction

function startFollowing()
	GotoState("chasing")
	StartTimer(1, updateTimerId)
	StartTimer(chaseTime, cancelTimerId)
endFunction

; call this function to set my current location to my "home" coordinates
function ResetHomeCoords()
	myStartX = self.GetPositionX()
	myStartY = self.GetPositionY()
	myStartZ = self.GetPositionZ()
	myStartRX = self.GetAngleX()
	myStartRY = self.GetAngleY()
	myStartRZ = self.GetAngleZ()   
endFunction


