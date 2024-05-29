Scriptname SentryBotOverheatFXScript extends ActiveMagicEffect



;Heat variables-------------------------------------------------------------------------------------------------
Group overheat_Properties
	ActorValue Property SentryBotMaxHeatLevel Auto
	{actor value that sets max heat}
	Idle Property IdleOverHeated Auto
	{Anim to play when overheat is reached}
	VisualEffect Property SentryBotOverHeatParticles Auto Const
	{Particles to comunicate overheat}
	PROJECTILE Property overheatProjectile01 Auto Const
	{add heat on hit from this}
	PROJECTILE Property overheatProjectile02 Auto Const
	{add heat on hit from this}
	PROJECTILE Property overheatProjectile03 Auto Const
	{add heat on hit from this}
	PROJECTILE Property overheatProjectile04 Auto Const
	{add heat on hit from this}
	sound Property overheatPercentSound Auto Const
    {Charge up sound}
    sound Property overheatPercentSoundLoop Auto Const
    {loop sound}

	Armor Property pSkinSentryBotOverheatLight Auto Const Mandatory
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
int heatStage = 0
;used to do each heat stage once


bool rightAttactCrippled = false
bool leftAttactCrippled = false




bool isHeating = false

int OverheatPercentSoundID


Event OnEffectStart(Actor akTarget, Actor akCaster)
	
	;if akCaster.Is3DLoaded()
		Debug.Trace("SB regissssterrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr")
		;create the number of steps for the art heat increment to match the av heat
		;fArtIncrement = (fArtHeatMax-fArtHeat)/akCaster.GetBaseValue(SentryBotMaxHeatLevel)
		;register for event driving heat increment
	    RegisterForAnimationEvent(akCaster, "moveStartSlave")
	    RegisterForAnimationEvent(akCaster, "moveStopSlave")
	    RegisterForAnimationEvent(akCaster, "OverHeatedEnd")
	    ;set default heat visuals
	    ;akCaster.SetAnimationVariableFloat("fDampRate", 0.03)
	    ;akCaster.SetAnimationVariableFloat("fToggleBlend", fArtHeat)
	    ;akCaster.SetSubGraphFloatVariable("fDampRate", 0.03)
	    ;akCaster.SetSubGraphFloatVariable("fToggleBlend", fArtHeat)



	    ; only get hits from the flamer projectiles
	    RegisterForHitEvent(akCaster, akProjectileFilter = overheatProjectile01)
	    RegisterForHitEvent(akCaster, akProjectileFilter = overheatProjectile02)
	    RegisterForHitEvent(akCaster, akProjectileFilter = overheatProjectile03)
	    RegisterForHitEvent(akCaster, akProjectileFilter = overheatProjectile04)

		if  akCaster.WaitFor3DLoad()
	 	   SentryBotOverHeatParticles.play(akCaster)
	  	  goTostate("waiting")
		else
			;nothing
		endif

	;endIf
EndEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)

	UnregisterForAllHitEvents()
	UnregisterForAnimationEvent(akCaster, "moveStartSlave")
	UnregisterForAnimationEvent(akCaster, "moveStopSlave")
	UnregisterForAnimationEvent(akCaster, "OverHeatedEnd")
	Sound.StopInstance(OverheatPercentSoundID)
	isHeating = false

	;DLC01 fix to remove added fx art on unload
	SentryBotOverHeatParticles.stop(akCaster)
	;end fix
	goTostate("doNothing")

EndEvent

;Overheat blocks--------------------------------------------------------------------------------------------------------------------------------------------------------
;increment heat by 1 when hit by laser projectiles
Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	actor selfRef = self.GetTargetActor()
	;debug.trace("i got hit by " + akProjectile)
	;debug.trace("my var is " + LaserRifleBeamRed)
	if overheatProjectile01 == akProjectile || overheatProjectile02 == akProjectile || overheatProjectile03 == akProjectile || overheatProjectile04 == akProjectile 
		debug.trace("it worked")
		IncreaseHeat(1, selfRef)
	endIf
	;reregister
	    RegisterForHitEvent(selfRef, akProjectileFilter = overheatProjectile01)
	    RegisterForHitEvent(selfRef, akProjectileFilter = overheatProjectile02)
	    RegisterForHitEvent(selfRef, akProjectileFilter = overheatProjectile03)
	    RegisterForHitEvent(selfRef, akProjectileFilter = overheatProjectile04)
EndEvent

Event OnDying(Actor akKiller)
	actor selfRef = self.GetTargetActor()
    Sound.StopInstance(OverheatPercentSoundID)
    isHeating = false
    selfRef.playSubgraphAnimation("stage3")
    SentryBotOverHeatParticles.stop(selfRef)
    selfRef.unequipItem(pSkinSentryBotOverheatLight)
    goTostate("doNothing")
EndEvent

state waiting
	;when I move forward I wait to get some speed and increment my heat if it is over 1
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		Debug.Trace("SB heaaaaat event  " + asEventName)
		;utility.wait(0.5)
		if asEventName == "moveStartSlave"
			isHeating = true
			goTostate("heating")
		endIf
	EndEvent
endState



state heating
	Event OnBeginState(string asOldState)
		actor selfRef = self.GetTargetActor()
		while isHeating
			Debug.Trace("Speed is " + selfRef.GetAnimationVariableFloat("Speed"))
			speedHeat = (selfRef.GetAnimationVariableFloat("Speed")/100) as int ;returns 0 when walking based on current speeds
			;if speedHeat < 1
			;	speedHeat = 1
			;endif``
			Debug.Trace("Increasing heat by " + speedHeat)
			IncreaseHeat(speedHeat, selfRef)
			if iHeatLevel >= (selfRef.GetBaseValue(SentryBotMaxHeatLevel))
				isHeating = false
				goTostate("overheat")
			endIf
			utility.wait(1.0)
	    endWhile
	EndEvent
	;when I move forward I wait to get some speed and increment my heat if it is over 1
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		if asEventName == "moveStopSlave"
			Debug.Trace("Move end exit heatinggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg" + asEventName)
			 isHeating = false
			goTostate("waiting")
		endIf
	EndEvent
endState

Function IncreaseHeat(int iHeatIncrement, actor selfRef)
	iHeatLevel += iHeatIncrement
	;heat up skin arrelaod
	;fArtHeat += fArtIncrement * iHeatIncrement
	;selfRef.SetAnimationVariableFloat("fDampRate", 0.03)
    ;selfRef.SetAnimationVariableFloat("fToggleBlend", fArtHeat)
    ;selfRef.SetSubGraphFloatVariable("fDampRate", 0.03)
    ;selfRef.SetSubGraphFloatVariable("fToggleBlend", fArtHeat)

    If iHeatLevel >= (selfRef.GetBaseValue(SentryBotMaxHeatLevel))*0.3 && heatStage == 0
    	heatStage = 1
    	selfRef.playSubgraphAnimation("stage1")
    endIf
    if iHeatLevel >= (selfRef.GetBaseValue(SentryBotMaxHeatLevel))*0.7 && heatStage == 1
    	heatStage = 2
    	overheatPercentSound.play(selfRef) 
    	OverheatPercentSoundID =  overheatPercentSoundLoop.play(selfRef) 
    	selfRef.playSubgraphAnimation("stage2")
    endIf
EndFunction	

state overheat
	Event OnBeginState(string asOldState)
		actor selfRef = self.GetTargetActor()
		selfRef.PlayIdle(IdleOverHeated)
		utility.wait(1)
		;coolskin art
		;fArtHeat += fArtIncrement
		;fArtHeat = 0.2
		Sound.StopInstance(OverheatPercentSoundID)
		selfRef.playSubgraphAnimation("stage3")
		;utility.wait(3)
		;selfRef.SetAnimationVariableFloat("fDampRate", 0.003)
	    ;selfRef.SetAnimationVariableFloat("fToggleBlend", fArtHeat)
		;selfRef.SetSubGraphFloatVariable("fDampRate", 0.003)
	    ;selfRef.SetSubGraphFloatVariable("fToggleBlend", fArtHeat)
	    ;utility.wait(1)
	    
		;utility.wait(1)
	    ;SentryBotOverHeatParticles.stop(selfRef)
	    ;isHeating = false
		
	EndEvent
		Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		if asEventName == "OverHeatedEnd"
			Debug.Trace("over heat is overrrrrr    " + asEventName)
			; selfRef.playSubgraphAnimation("reset")
			iHeatLevel = 0
			heatStage = 0
			goTostate("waiting")
		endIf
	EndEvent
endState

state doNothing
;endstate
endState


