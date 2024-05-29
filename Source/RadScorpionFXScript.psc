Scriptname RadScorpionFXScript extends  ActiveMagicEffect 
{Handles scripted fx for RadScorpion}

ActorValue Property LeftAttackCondition Auto const
ActorValue Property RightAttackCondition Auto const
ActorValue Property AvailableCondition1 Auto const
Action Property ActionLeftArmHeal Auto const
Action Property ActionRightArmHeal Auto const
Action Property ActionAvailableCondition1Heal Auto const


;art to play at both ends of tunneling
Explosion Property RadScorpionDigExplosion Auto Const
{Dirt fx to play when breaking in to the ground}
Explosion Property RadScorpionOutDigExplosion Auto Const
{Dirt fx to play when breaking out of the ground}
EffectShader Property pDirtParticles Auto Const
{dirt particles to play when tunneling}


;bool to to stop dirt fading if actor dies
bool isALive = true
;random dirt amount holder
float  myDirtAmount = 1.0
;local storage for self


Event OnEffectStart(Actor akTarget, Actor akCaster)

	if akCaster.Is3dLoaded()
		;set to listen for tunneling
		RegisterForAnimationEvent(akCaster, "EnterGroundFX" )
    	RegisterForAnimationEvent(akCaster, "ExitGroundFX" )
    	;check if sleeping (in ambush)
    	int mySleepState = akCaster.GetSleepState()
		if mySleepState == 3 ;then I started in furniture put dirt on   		
			addDirtFx(1.0, akCaster) ;fast add dirt if in ambush
		endIf
    endIf
EndEvent

;unregister if ended
Event OnEffectFinish(Actor akTarget, Actor akCaster)
    unRegisterForAnimationEvent(akCaster, "EnterGroundFX")
    unRegisterForAnimationEvent(akCaster, "ExitGroundFX")
EndEvent

Event OnCripple(ActorValue akActorValue, bool abCrippled)
	actor selfRef = self.GetTargetActor()
	if abCrippled == 0.0
	    if akActorValue == LeftAttackCondition
	    	debug.trace("LeftAttackCondition healed")
	        selfRef.PlayIdleAction(ActionLeftArmHeal)
	    endif
		if akActorValue == RightAttackCondition
	    	debug.trace("RightAttackCondition healed")
	        selfRef.PlayIdleAction(ActionRightArmHeal)
	    endif
		if akActorValue == AvailableCondition1
	    	debug.trace("AvailableCondition1 healed")
	        selfRef.PlayIdleAction(ActionAvailableCondition1Heal)
	    endif
	endif
EndEvent

;if tunneling happens always place tunnel fx and play correct dir skin fk depending on going in or out
Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	actor selfRef = self.GetTargetActor()
	if asEventName == "EnterGroundFX" 
		debug.trace("i duggggggg")
		selfRef.placeatme(RadScorpionDigExplosion)
		addDirtFx(0.4, selfRef)
		
	endIf
    If asEventName == "ExitGroundFX" 
    	debug.trace("im outtttt")
    	selfRef.placeatme(RadScorpionOutDigExplosion)
		fadeDirtFX(selfRef)
    	
	endIf
EndEvent

;if they get into a furniture add skin dirt
Event OnSit(ObjectReference akFurniture)
	actor selfRef = self.GetTargetActor()
    addDirtFx(0.4, selfRef)
EndEvent

;upon exiting furniture start remove dirt
Event OnGetUp(ObjectReference akFurniture)
	actor selfRef = self.GetTargetActor()
	;debug.trace("i got up")
	fadeDirtFX(selfRef)
endEvent

;if they die stop removing the dirt to give variety to dead bodies
Event OnDying(Actor akKiller)
	actor selfRef = self.GetTargetActor()
    isALive = false
    ;removing any falling particles on dying
	pDirtParticles.stop(selfRef)
EndEvent


;;functions--------------------------------------------------------------------------

function addDirtFx(float akDampSpeed, Actor selfRef)
	;add falling particles 
	if pDirtParticles
		pDirtParticles.play(selfRef)
	endIf
	;fade in dirt on skin
    myDirtAmount = Utility.RandomFloat(0.8, 0.9)
    selfRef.SetSubGraphFloatVariable("fDampRate", akDampSpeed)
	selfRef.SetSubGraphFloatVariable("fToggleBlend", myDirtAmount) 
endFunction

function fadeDirtFX(Actor selfRef)
	float myDirtLeft = Utility.RandomFloat(0.1, 0.4)
	; incriment the dirt away but stop if they die
    while isALive == true && myDirtAmount > myDirtLeft
    	myDirtAmount = myDirtAmount - 0.1
    	selfRef.SetSubGraphFloatVariable("fDampRate", 0.1)
		selfRef.SetSubGraphFloatVariable("fToggleBlend", myDirtAmount) 
		utility.wait(1)
	endWhile
	;remove dirt particles once faded away
	pDirtParticles.stop(selfRef)
endFunction


