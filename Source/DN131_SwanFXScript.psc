Scriptname DN131_SwanFXScript extends ActiveMagicEffect Hidden
{Script for Swan's Swan Pond ambush vfx (the splash).}

ActorBase property DN131_EncSMBehemothSwan Auto Const Mandatory
{Swan's ActorBase.}

Explosion property SwanSupermutantAmbushExplosion Auto Const Mandatory
{The explosion to play when this effect is triggered.}

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if (akTarget.GetActorBase() == DN131_EncSMBehemothSwan)
		Self.RegisterForAnimationEvent(akTarget, "startSwanSplashOut")
	EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    Self.UnRegisterForAnimationEvent(akTarget, "startSwanSplashOut")
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	akSource.PlaceAtMe(SwanSupermutantAmbushExplosion)
EndEvent