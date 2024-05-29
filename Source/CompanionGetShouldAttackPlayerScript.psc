Scriptname CompanionGetShouldAttackPlayerScript extends ActiveMagicEffect Const

Event OnEffectStart(Actor akTarget, Actor akCaster)
	debug.trace(self + "OnEffectStart() sending hates event and dismissing companion")

	FollowersScript.SendAffinityEvent(self, (akTarget as CompanionActorScript).HatesEvent )
	
	akTarget.SetCompanion(false)
	

EndEvent