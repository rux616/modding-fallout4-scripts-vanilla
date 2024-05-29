Scriptname DLC01:DLC01ExplodeOnContactBodyPartScript extends ActiveMagicEffect

{ExplodesBodyPartOnContact}

String Property myBodyPartString Auto Const
Bool Property dismemberActor = true Auto Const

EVENT OnEffectStart(Actor akTarget, Actor akCaster)
	if dismemberActor == true
		akTarget.Dismember(myBodyPartString, true, true, true)
	endif
	akTarget.Kill()
ENDEVENT