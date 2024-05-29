Scriptname DLC01:DLC01WeapOnFireEffect extends ActiveMagicEffect Hidden

SPELL Property myWeaponFireSpell Auto Const
String Property myAnimEvent Auto Const

Event OnEffectStart(Actor akTarget, Actor akCaster)
    DEBUG.TRACE("Effect applied to "+akCaster+" by "+akTarget)
    registerForAnimationEvent(akTarget, myAnimEvent)
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    debug.trace("Received anim event: "+asEventName)
    if asEventName == myAnimEvent
    	myWeaponFireSpell.Cast(akSource)
    else
        ; get some other anim event?  re-register.
        registerForAnimationEvent(akSource, myAnimEvent)
    endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
        UnregisterForAnimationEvent(akCaster, myAnimEvent)
EndEvent