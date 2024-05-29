Scriptname VultureCritterScript extends ObjectReference 
{For vulture critters}


Bool property StartFlying auto
{ true = start out flying (never land) }

Bool property isInjured = false auto
{ Have I beed damaged ? This will keep me from landing on trigger exit}

Bool property CleanMyselfUp = false auto
{ true: for initially disabled vultures which enable themselves when they unload, and then clean themselves up on next unload }

;Marks death variables
container Property myContainer Auto
{vulture dead body}
objectReference myContainerRef
;local starage for dead body to move it to subnote within vulture art}
int doOnce
;Gate for stopping onHit from running the death code more that once}
string Property myLocationOffset Auto
{name of node within vulture art to place dead body at.}

actor ActorRef
;{stores who entered the trigger and used to force landing when they leave}

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

Event OnLoad()
	debug.trace(self + " OnLoad")
	self.SetMotionType(Self.Motion_Keyframed)
	if StartFlying
		debug.trace(self + " OnLoad - call StartFlying")
		playanimation("StartFlying")
	endif
	RegisterForAnimationEvent(self, "Drop");register for the event that plays if i do the crash land
EndEvent

;crash if event has been received
Event OnAnimationEvent(ObjectReference akSource, string asEventName)
  if (akSource == self) && (asEventName == "Drop")
    utility.wait(Utility.RandomFloat(0.0, 2.0))
    damageObject(100)
    ; playanimation("InjuredGround")
    ; utility.wait(0.5)
    ; SetMotionType(self.Motion_Dynamic)
  endIf
endEvent

Event OnTriggerEnter(ObjectReference akActionRef)
	; if living actor gets near, trigger:
	ActorRef = akActionRef as Actor
	if ActorRef && !ActorRef.IsDead()
		debug.trace(self + " OnTriggerEnter - call Takeoff")
		Takeoff()
	endif
EndEvent

;if actor who hits trigger leaves it land
Event OnTriggerLeave(ObjectReference akActionRef)
    if akActionRef == ActorRef 
    	debug.trace(ActorRef + " left my trigger - call land")
    	Land()
    endif
EndEvent

;first d state change talkeoff and block landing, second trasition to injured
Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	;co``self.SetMotionType(self.Motion_Dynamic, true)
	;debug.trace("Vultuuuuure dynamicccccccccccccccccccccc")
	debug.trace("leaving " + aiOldStage + " now " +aiCurrentStage)
	if aiOldStage == 0
		isInjured = true
		Takeoff()
	else
   		playanimation("Injured")
   		playanimation("DamageShader")
   		utility.wait(0.1)
   		playanimation("InjuredLand")
   		utility.wait(1.1)
   		;self.SetMotionType(Self.Motion_Dynamic)
   	endIf
EndEvent


; call to cause vulture to fly
function Takeoff()
	if !StartFlying
		StartFlying = true
		utility.wait(Utility.RandomFloat(0.1, 0.5))
		playanimation("Takeoff")
	endif
endFunction

; call to cause vulture to land if not injured
function Land()
	if StartFlying == true && isInjured == false
		StartFlying = false
		;utility.wait(Utility.RandomFloat(0.1, 0.5))
		playanimation("Land")
	endif
endFunction

