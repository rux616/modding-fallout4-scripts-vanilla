Scriptname DLC01:DLC01SentryBotOverheatFXScript extends ActiveMagicEffect
{Script to allow DLC01 Player-Constructed Sentry Bot Torsos to overheat.}
;
;- This is an adaptation of the base game's SentryBotOverheatFXScript, which only worked with the Sentry Bot's specific set of movement animation events.
;  Since this torso can now be used on any type of robot, if we still want it to overheat, the script needs to handle all of the possible movement events.
;- We also don't want it to overheat when the robot is not in combat, since it's annoying to keep having to stop for it.

Group overheat_Properties
	ActorValue Property SentryBotMaxHeatLevel Auto Const Mandatory
	{Actor value that sets max heat.}

	Idle Property IdleOverHeated Auto Const Mandatory
	{Anim to play when overheat is reached.}

	VisualEffect Property SentryBotOverHeatParticles Auto Const Mandatory
	{Particles to comunicate overheat}

	sound Property overheatPercentSound Auto Const Mandatory
    	{Charge up sound}

	sound Property overheatPercentSoundLoop Auto Const Mandatory
	{Loop sound}

	Armor Property pSkinSentryBotOverheatLight Auto Const Mandatory

	FormList Property SentryBotOverheatProjectiles Auto Const Mandatory
Endgroup

;Local variables.
int iHeatLevel = 0			;Current Heat Level
int heatStage = 0			;Current Heat Stage
int OverheatPercentSoundID	;Overheat Sound



Event OnEffectStart(Actor akTarget, Actor akCaster)
	;Register for all of the possible movement events.
	RegisterForAnimationEvent(akCaster, "MoveStartSlave")
	RegisterForAnimationEvent(akCaster, "FootRight")
    	RegisterForAnimationEvent(akCaster, "MoveForward")

    	;Register for the Overheated End animation event.
	RegisterForAnimationEvent(akCaster, "OverHeatedEnd")	

	;Only get hits from the flamer projectiles
	RegisterForHitEvent(akCaster, akProjectileFilter = SentryBotOverheatProjectiles)

	if (akCaster.WaitFor3DLoad())
		SentryBotOverHeatParticles.play(akCaster)
	endif
EndEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
	UnregisterForAllEvents()
	Sound.StopInstance(OverheatPercentSoundID)
EndEvent


Auto State Waiting
	;When transitioning back to this state from Heating, if we were partially Overheated,
	;go ahead and Overheat now so we can return to normal.
	Event OnBeginState(String asOldState)
		if (heatStage > 0)
			GoToState("Overheat")
		EndIf
	EndEvent

	;When we get a movement event at the appropriate speed while in combat, start watching for overheating.
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		if ((asEventName != "OverHeatedEnd") && (GetSpeedHeat() > 0))
			GoToState("Heating")
		EndIf
	EndEvent
EndState


State Heating
	Event OnBeginState(String asOldState)
		StartTimer(0, 0)
	EndEvent

	Event OnTimer(int timerID)
		;Per the base script, every second, monitor for heating.
		Actor mySelf = Self.GetTargetActor()
		int speedHeat = GetSpeedHeat()
		if ((mySelf.IsInCombat()) && (GetSpeedHeat() > 0))
			IncreaseHeat(speedHeat, mySelf)
			Debug.Trace("Heat at " + iHeatLevel + "/" + mySelf.GetBaseValue(SentryBotMaxHeatLevel))
			if (iHeatLevel >= (mySelf.GetBaseValue(SentryBotMaxHeatLevel)))
				GoToState("Overheat")
			EndIf
			StartTimer(1, 0)
		ElseIf (timerID < 10)
			;Run this loop a few times before bailing out, to handle short drops out of combat.
			StartTimer(1, timerID + 1)
		Else
			GoToState("Waiting")
		EndIf
	EndEvent
EndState

State Overheat
	Event OnBeginState(string asOldState)
		Actor mySelf = Self.GetTargetActor()
		mySelf.PlayIdle(IdleOverHeated)
		utility.wait(1)
		Sound.StopInstance(OverheatPercentSoundID)
		mySelf.playSubgraphAnimation("stage3")
	EndEvent

	;If the robot goes into Bleedout while overheating, we need to bail out,
	;or they'll become stuck in this stage and never Overheat again.
	Event OnEnterBleedout()
		iHeatLevel = 0
		heatStage = 0
		GoTostate("Waiting")
	EndEvent

	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		if (asEventName == "OverHeatedEnd")
			iHeatLevel = 0
			heatStage = 0
			GoTostate("Waiting")
		EndIf
	EndEvent
EndState


int Function GetSpeedHeat()
	Debug.Trace(GetTargetActor().GetAnimationVariableFloat("Speed"))
	return (GetTargetActor().GetAnimationVariableFloat("Speed") / 100) as int ;returns 0 when walking based on current speeds
EndFunction

Function IncreaseHeat(int iHeatIncrement, actor mySelf)
	iHeatLevel += iHeatIncrement
	if ((iHeatLevel >= (mySelf.GetBaseValue(SentryBotMaxHeatLevel))*0.3) && (heatStage == 0))
    		heatStage = 1
    		mySelf.playSubgraphAnimation("stage1")
	EndIf
	if ((iHeatLevel >= (mySelf.GetBaseValue(SentryBotMaxHeatLevel))*0.7) && (heatStage == 1))
		heatStage = 2
    		overheatPercentSound.play(mySelf) 
    		OverheatPercentSoundID =  overheatPercentSoundLoop.play(mySelf) 
    		mySelf.playSubgraphAnimation("stage2")
    	EndIf
EndFunction	


Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	actor mySelf = self.GetTargetActor()
	if (SentryBotOverheatProjectiles.HasForm(akProjectile))
		IncreaseHeat(1, mySelf)
	endIf
	RegisterForHitEvent(mySelf, akProjectileFilter = SentryBotOverheatProjectiles)
EndEvent

Event OnDying(Actor akKiller)
	Actor mySelf = GetTargetActor()
    	Sound.StopInstance(OverheatPercentSoundID)
   	mySelf.playSubgraphAnimation("stage3")
   	SentryBotOverHeatParticles.stop(mySelf)
   	mySelf.unequipItem(pSkinSentryBotOverheatLight)
EndEvent