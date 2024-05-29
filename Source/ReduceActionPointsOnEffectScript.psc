Scriptname ReduceActionPointsOnEffectScript extends ActiveMagicEffect Hidden

ActorValue Property ActionPoints const auto
Int Property APCost = 25 auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	(akCaster as Actor).DamageValue(ActionPoints, APCost)
EndEvent