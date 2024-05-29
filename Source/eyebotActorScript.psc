Scriptname eyebotActorScript extends ActiveMagicEffect

Explosion Property EyebotExplosion Auto Const
{explosion to play on death random chance}

VisualEffect Property EyebotSmokingE Auto Const
{effect to play on death always}



actor selRef

Event OnEffectStart(Actor akTarget, Actor akCaster)
    selRef = akCaster
EndEvent


;on deathchance to play explosion and always play smoke
Event OnDying(Actor akKiller)
    int chanceToExplode = Utility.RandomInt(1, 2)
    if chanceToExplode == 1
        selRef.placeAtMe(EyebotExplosion)
    endif
    EyebotSmokingE.play(selRef, 20)
EndEvent




