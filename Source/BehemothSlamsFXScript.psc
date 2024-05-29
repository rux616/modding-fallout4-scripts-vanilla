Scriptname BehemothSlamsFXScript extends ActiveMagicEffect

Explosion Property pBehemothSlamExplosion Auto Const Mandatory

Explosion Property pBehemothStompExplosion Auto Const Mandatory


Event OnEffectStart(Actor akTarget, Actor akCaster)
    	RegisterForAnimationEvent(akCaster, "GroundImpact")
	    RegisterForAnimationEvent(akCaster, "slamFX")
	    RegisterForAnimationEvent(akCaster, "stompFX")
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
       	unRegisterForAnimationEvent(akCaster, "GroundImpact")
	    unRegisterForAnimationEvent(akCaster, "slamFX")
	    unRegisterForAnimationEvent(akCaster, "stompFX")
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    if asEventName == "slamFX"
    	akSource.placeatNode("Weapon", pBehemothSlamExplosion)
    endif
    if asEventName == "stompFX"
    	akSource.placeatNode("RLeg_Ankle", pBehemothStompExplosion)
    endif
EndEvent