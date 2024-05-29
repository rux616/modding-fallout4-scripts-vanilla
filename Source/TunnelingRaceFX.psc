Scriptname TunnelingRaceFX extends ActiveMagicEffect 
{Adds fx for tunneling actors by magic fx on race }

;events for going in and out of ground for tunneling
String  enterDigEvent= "EnterGroundFX"  Const
String  exitDigEvent = "ExitGroundFX"  Const

;art to play at both ends of tunneling
Explosion Property RadScorpionDigExplosion Auto Const
{Dirt fx to play when breaking in to the ground}
Explosion Property RadScorpionOutDigExplosion Auto Const
{Dirt fx to play when breaking out of the ground}

EffectShader Property pDirtParticles Auto Const
{dirt particles to play when tunneling}

; Patch 1.4 - allow turning off dirt from getting into furniture
Faction Property TunnelingRaceNoDirtFromFurniture auto const mandatory

;bool to to stop dirt fading if actor dies
bool isALive = true
;random dirt amount holder
float  myDirtAmount = 1.0
;local storage for self
Actor selfRef 
;local storage for manually set race flag


;;events----------------------------------------------------------------------------------

Event OnEffectStart(Actor akTarget, Actor akCaster)
	selfRef = akCaster ; store local self
	if selfRef.Is3dLoaded()
		;set to listen for tunneling
		RegisterForAnimationEvent(selfRef, enterDigEvent)
    	RegisterForAnimationEvent(selfRef, exitDigEvent)
    	;check if sleeping (in ambush)
    	int mySleepState = selfRef.GetSleepState()
		if mySleepState == 3 ;then I started in furniture put dirt on   		
			addDirtFx(1.0) ;fast add dirt if in ambush
		endIf
    endIf
EndEvent

;unregister if ended
Event OnEffectFinish(Actor akTarget, Actor akCaster)
    unRegisterForAnimationEvent(selfRef, enterDigEvent)
    unRegisterForAnimationEvent(selfRef, exitDigEvent)
EndEvent

;if tunneling happens always place tunnel fx and play correct dir skin fk depending on going in or out
Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	
	if asEventName == enterDigEvent
		selfRef.placeatme(RadScorpionDigExplosion)
		addDirtFx(0.04)
    elseIf asEventName == exitDigEvent
    	selfRef.placeatme(RadScorpionOutDigExplosion)
    	fadeDirtFX()
	endIf
EndEvent

;if they get into a furniture add skin dirt
Event OnSit(ObjectReference akFurniture)
	if selfRef.IsInFaction(TunnelingRaceNoDirtFromFurniture) == false
    	addDirtFx(0.04)
    endif
EndEvent

;upon exiting furniture start remove dirt
Event OnGetUp(ObjectReference akFurniture)
	;debug.trace("i got up")
	if selfRef.IsInFaction(TunnelingRaceNoDirtFromFurniture) == false
		fadeDirtFX()
	endif
endEvent

;if they die stop removing the dirt to give variety to dead bodies
Event OnDying(Actor akKiller)
    isALive = false
    ;removing any falling particles on dying
	pDirtParticles.stop(selfRef)
EndEvent


;;functions--------------------------------------------------------------------------

function addDirtFx(float akDampSpeed)
	;add falling particles 
	pDirtParticles.play(selfRef)
	;fade in dirt on skin
    myDirtAmount = Utility.RandomFloat(0.8, 1.0)
    selfRef.SetSubGraphFloatVariable("fDampRate", akDampSpeed)
	selfRef.SetSubGraphFloatVariable("fToggleBlend", myDirtAmount) 
endFunction

function fadeDirtFX()
	float myDirtLeft = Utility.RandomFloat(0.0, 0.2)
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


