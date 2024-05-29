Scriptname LibertyPrimeRaceFXScript extends ActiveMagicEffect
{Adds fx to all liberty prime actors}

Explosion Property pLibertyPrimeFootstepExplosion Auto Const

;new stuff for making the lights start on by default after a certain point in the quests.
;----------------------------------------------------------------------------
GlobalVariable Property BoSLPLightsOnForever Auto Const
;-----------------------------------------------------------------------------


Event OnEffectStart(Actor akTarget, Actor akCaster)

    if (akCaster.Is3DLoaded()) && BoSLPLightsOnForever.GetValue() == 1
        ; We can turn on lights now
        akCaster.PlaySubgraphAnimation("lightsOn")
    endIf

	RegisterForAnimationEvent(akCaster, "FootLeft")
	RegisterForAnimationEvent(akCaster, "FootRight")
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    UnregisterForAnimationEvent(akCaster, "FootLeft")
    UnregisterForAnimationEvent(akCaster, "FootRight")
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    actor selfRef = self.GetTargetActor()
	;debug.trace("animmmmmmmm")
	if asEventName == "FootLeft"
		;debug.trace("lefffftttttttt")

    	;selfRef.PlaceAtNode("LLeg_FootFront", pLibertyPrimeFootstepExplosion)
    	selfRef.PlaceAtNode("LLeg_FootRear", pLibertyPrimeFootstepExplosion) 	
    endIf
    if asEventName == "FootRight"
		;debug.trace("lefffftttttttt")
    	;selfRef.PlaceAtNode("RLeg_FootFront", pLibertyPrimeFootstepExplosion)
    	selfRef.PlaceAtNode("RLeg_FootRear", pLibertyPrimeFootstepExplosion) 	
    endIf
EndEvent