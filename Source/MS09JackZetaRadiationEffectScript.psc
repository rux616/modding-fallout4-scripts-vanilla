Scriptname MS09JackZetaRadiationEffectScript extends ActiveMagicEffect Const

Topic Property MS09LorenzoWeakenedTopic Auto Const
ActorBase Property LorenzoCabot auto const

Event OnEffectStart(Actor akTarget, Actor akCaster)
	debug.trace(self + " OnEffectStart")
    if akTarget.GetActorBase() == LorenzoCabot
    	akTarget.Say(MS09LorenzoWeakenedTopic)
    endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	if akTarget.GetActorBase() == LorenzoCabot
		akTarget.Say(MS09LorenzoWeakenedTopic)
	endif
EndEvent