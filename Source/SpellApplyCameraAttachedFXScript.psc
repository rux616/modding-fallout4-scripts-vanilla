Scriptname SpellApplyCameraAttachedFXScript extends ActiveMagicEffect
{Applies a camera attached fx}

Group fx_Properties
    VisualEffect Property camAttachedFX Auto Const
    {FX to attach to the camera}
    float Property timeToApply = 2.0 Auto Const
    {How long to play cam attach default 2 sec}
EndGroup

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akTarget == game.getPlayer()
    	camAttachedFX.play(akTarget, timeToApply)
	endIf
EndEvent