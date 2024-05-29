Scriptname SentryBotActorScript extends Actor
{Controls added functionality for sentry bot}

; general_Properties
	;SPELL Property SentryBotFaceLightSpell Auto Const
	;{ability that sets the bots face to glow}
;
;Heat variables-------------------------------------------------------------------------------------------------
Group overheat_Properties
	ActorValue Property SentryBotMaxHeatLevel Auto
	{actor value that sets max heat}
	Idle Property IdleOverHeated Auto
	{Anim to play when overheat is reached}
	VisualEffect Property SentryBotOverHeatParticles Auto Const
	{Particles to comunicate overheat}
	PROJECTILE Property LaserRifleBeamRed Auto Const
	{add heat on hit from this}
	PROJECTILE Property LaserSmallBeamRed Auto Const
	{add heat on hit from this}
	sound Property overheatPercentSound Auto Const
	{add heat on hit from this}
endgroup

int iHeatLevel = 0
;int iInitialHealLevel
float fArtHeatMax = 1.0 const
;float that we max out the art heat
float fArtHeat = 0.2
;float that we set the art to between 0-1
float fArtIncrement
;float to add to art heat each time we increment the art 
; bool isOverheating = false
;bool to test against to see if actor is currently overheating
int speedHeat
;an int representing current speed / 100 use to boost the normal heant incrment whn going faster
bool isWalking = false
;bool to test against to see if actor is currently overheating

;end Heat variables-------------------------------------------------------------------------------------------------
Group Explosion_Properties
	Explosion Property sentryBotExplosion Auto Const
	String Property animEventExplode Auto Const
	String Property animEventEffects Auto Const

	ActorValue  property perceptioncondition Auto
	ActorValue  property endurancecondition Auto

	ActorValue  property leftmobilitycondition Auto
	ActorValue  property rightmobilitycondition Auto
	ActorValue  property leftattackcondition Auto
	ActorValue  property rightattackcondition Auto

	ActorValue  property braincondition Auto

	ActorValue  property availablecondition1 Auto
	ActorValue  property availablecondition2 Auto
	ActorValue  property availablecondition3 Auto

	ActorValue  property attackconditionalt1 Auto
	ActorValue  property attackconditionalt2 Auto
endGroup

bool rightAttactCrippled = false
bool leftAttactCrippled = false

;fake limb cripple art--------------------------------------------------------------------------------------

; Group fakeCripple_Properties
; 	; Armor Property SkinSentryBotRLPanel Auto Const
; 	; Armor Property SkinSentryBotLLPanel Auto Const
; 	; Armor Property SkinSentryBotBLPanel Auto Const

; 	Explosion Property SentryBotLLegExplosion Auto Const
; 	Explosion Property SentryBotRLegExplosion Auto Const
; 	Explosion Property SentryBotBLegExplosion Auto Const

; 	ActorValue Property myRMobilityAV Auto Const
; 	ActorValue Property myLMobilityAV Auto Const
; endGroup
;end fake limb cripple art--------------------------------------------------------------------------------------

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
  Debug.Trace("Out destruction stage changed from " + aiOldStage + " to " + aiCurrentStage)
  SentryBotOverHeatParticles.play(self)
  SetAnimationVariableFloat("fCrippledNoiseRamp", 1.0)
EndEvent


Event OnLoad()
	if Is3DLoaded()
		;create the number of steps for the art heat increment to match the av heat
		fArtIncrement = (fArtHeatMax-fArtHeat)/Self.GetBaseValue(SentryBotMaxHeatLevel)
		;register for event driving heat increment
	    RegisterForAnimationEvent(self, "moveForward")
	    RegisterForAnimationEvent(self, "moveLeft")
	    RegisterForAnimationEvent(self, "moveRight")
	    RegisterForAnimationEvent(self, "moveBackward")
	    ;set default heat visuals
	    SetAnimationVariableFloat("fDampRate", 0.03)
	    SetAnimationVariableFloat("fToggleBlend", fArtHeat)


	    RegisterForHitEvent(self, akProjectileFilter = LaserRifleBeamRed) ; only get hits from the laser rifle
	    RegisterForHitEvent(self, akProjectileFilter = LaserSmallBeamRed)

	    RegisterForAnimationEvent(self, animEventExplode)
	    RegisterForAnimationEvent(self, animEventEffects)
	endIf
EndEvent

Event OnUnload()
	UnregisterForAllHitEvents()
EndEvent

;Overheat blocks--------------------------------------------------------------------------------------------------------------------------------------------------------
;increment heat by 1 when hit by laser projectiles
Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	;debug.trace("i got hit by " + akProjectile)
	;debug.trace("my var is " + LaserRifleBeamRed)
	if LaserRifleBeamRed == akProjectile || LaserSmallBeamRed == akProjectile 
		debug.trace("it worked")
		IncreaseHeat(1)
	endIf
	;temp fake boosted damage when overheating. Should be handled by body part data.
	; if isOverheating == true
	; 	damageobject(200)
	; endif

	RegisterForHitEvent(self, akProjectileFilter = LaserRifleBeamRed) ; get more hits
	RegisterForHitEvent(self, akProjectileFilter = LaserSmallBeamRed)
EndEvent

;when I move forward I wait to get some speed and increment my heat if it is over 1
Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	utility.wait(0.5)
	if isWalking == false
		speedHeat = (GetAnimationVariableFloat("Speed")/100) as int ;returns 0 when walking based on current speeds
		if speedHeat >= 1
			IncreaseHeat(speedHeat)
		endIF
	else
		IncreaseHeat(2)
	endif
	;SetAnimationVariableFloat("fDampRate", 0.01)
	;SetAnimationVariableFloat("fToggleBlend", 1.0)

	if asEventName == animEventExplode
		blowUp()
	endIf
EndEvent

Function IncreaseHeat(int iHeatIncrement)
	iHeatLevel += iHeatIncrement
	;heat up skin art
	fArtHeat += fArtIncrement * iHeatIncrement
	SetAnimationVariableFloat("fDampRate", 0.03)
    SetAnimationVariableFloat("fToggleBlend", fArtHeat)
    if iHeatLevel >= (Self.GetBaseValue(SentryBotMaxHeatLevel))*0.7
    	SentryBotOverHeatParticles.play(self)
    	overheatPercentSound.play(self)
    endIf
  
	if iHeatLevel >= (Self.GetBaseValue(SentryBotMaxHeatLevel))
		; isOverheating = true
		Self.PlayIdle(IdleOverHeated)
		 
		iHeatLevel = 0
		;coolskin art
		fArtHeat += fArtIncrement
		fArtHeat = 0.2
		utility.wait(1)
		playSubgraphAnimation("stage2")
		utility.wait(3)
		SetAnimationVariableFloat("fDampRate", 0.003)
	    SetAnimationVariableFloat("fToggleBlend", fArtHeat)
	    utility.wait(2)
	    SentryBotOverHeatParticles.stop(self)
	    ; isOverheating = false
	endIf
EndFunction	

;end Overheat blocks--------------------------------------------------------------------------------------------------------------------------------------------------------
Event OnDying(Actor akKiller)
	utility.wait(0.25)
	self.DamageValue(leftmobilitycondition, 100)
	utility.wait(0.2)
	self.DamageValue(rightmobilitycondition, 100)
	utility.wait(0.25)
	self.DamageValue(leftattackcondition, 100)
	utility.wait(0.2)
	self.DamageValue(rightattackcondition, 100)

	;SentryBotOverHeatParticles.play(self)
	;utility.wait(2)
	;blowUp()	    
EndEvent

; fake cripple art block-------------------------------------------------------------------------------------------------------------------------------------------------------
Event OnCripple(ActorValue akActorValue, bool abCrippled)
	;Back Legs
    ; if akActorValue == myRMobilityAV 
    ; 	placeatme(SentryBotBLegExplosion)
    ; 	;self.unequipItem(SkinSentryBotBLPanel, true)
    ; 	isWalking = true
    ; endif
    ; ;Front Legs
    ; if akActorValue == myLMobilityAV
    ; 	isWalking = true
    ; 	placeatme(SentryBotLLegExplosion)
    ; 	;self.unequipItem(SkinSentryBotLLPanel, true)
    ; 	placeatme(SentryBotRLegExplosion)
    ; 	;self.unequipItem(SkinSentryBotRLPanel, true)
    ; endif

    ;SelfDestruct
    if akActorValue == leftattackcondition
		leftAttactCrippled = true
		if rightAttactCrippled ==true
    		selfDestructMode()
    	endIf
    endIf 
    if akActorValue == rightattackcondition
    	rightAttactCrippled = true
    	if leftAttactCrippled ==true
    		selfDestructMode()
    	endIf
    endIf 
EndEvent
; end fake cripple art block-------------------------------------------------------------------------------------------------------------------------------------------------------

function blowUp()
	debug.trace("SentryBot go BOOM!")	
	;self.DamageValue(leftmobilitycondition, 100)
	;utility.wait(0.25)
	;self.DamageValue(rightmobilitycondition, 100)
	;utility.wait(0.5)
	;self.DamageValue(leftattackcondition, 100)
	;utility.wait(0.25)
	;self.DamageValue(rightattackcondition, 100)
	placeatme(sentryBotExplosion)
	;utility.wait(0.25)
	self.DamageValue(perceptioncondition, 100)
	self.DamageValue(endurancecondition, 100)	
	self.DamageValue(braincondition, 100)
	self.DamageValue(availablecondition1, 100)
	self.DamageValue(availablecondition2, 100)
	self.DamageValue(availablecondition3, 100)
	self.DamageValue(attackconditionalt1, 100)
	self.DamageValue(attackconditionalt2, 100)
	SentryBotOverHeatParticles.stop(self)
	;self.Kill(self)
endFunction

function selfDestructMode()

endFunction
