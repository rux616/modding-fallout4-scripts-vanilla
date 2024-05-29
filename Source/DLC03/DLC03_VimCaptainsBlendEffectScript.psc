Scriptname DLC03:DLC03_VimCaptainsBlendEffectScript extends activemagiceffect
{This script is the cloak effect on Captains Blend}


combatStyle Property DLC03_csCaptainsBlend Auto Const mandatory
Faction Property DLC03VimCaptainsBlendFaction Auto Const mandatory
ActorValue Property DLC03_VimCaptainsBlendLimiter Auto Const mandatory
ActorValue Property Health Auto Const mandatory
Int Property StopCombatChance = 75 Auto Const
{Percentage chance that we stop combat on the actor when this is applied
	If Health % is lower, that is used instead}
RefCollectionAlias Property AffectedCreatures Auto Const mandatory

Event OnEffectStart(Actor akTarget, Actor akCaster)
	int StopCombatRoll = utility.RandomInt(0, 100)
	float HealthPercent = akTarget.GetValuePercentage(Health)
	float ChanceToStop

	;Take the lower number as the chance to stop combat
	if HealthPercent < StopCombatChance
		ChanceToStop = StopCombatChance
	else
		ChanceToStop = HealthPercent
	endif

	if StopCombatRoll <= ChanceToStop
		akTarget.StopCombat()
	endif
	akTarget.SetCombatStyle(DLC03_csCaptainsBlend)
	akTarget.AddToFaction(DLC03VimCaptainsBlendFaction)
	AffectedCreatures.AddRef(akTarget)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.SetCombatStyle(none)
	akTarget.RemoveFromFaction(DLC03VimCaptainsBlendFaction)

	;Increase the limiter
	float newAV = akTarget.GetValue(DLC03_VimCaptainsBlendLimiter)
	newAV += (utility.RandomInt(3, 6) as float)
	if newAV > 10.0
		newAV = 10.0
	endif
	akTarget.SetValue(DLC03_VimCaptainsBlendLimiter, newAV)
	AffectedCreatures.RemoveRef(akTarget)
EndEvent