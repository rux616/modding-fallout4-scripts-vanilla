Scriptname RESceneKMK10AliasScript extends REAliasScript 

float property minHealthPercent = 0.25 auto const
{ when health reaches this, trigger HealthPercentStage (different for each deathclaw)}

int property HealthPercentStage auto const

function CustomRegisterForHit()
	debug.trace(self + "CustomRegisterForHit")
    ; register if necessary
    if HealthPercentStage > 0 && GetOwningQuest().GetStageDone(HealthPercentStage) == false
		debug.trace(self + " RegisterForHitEvent")
		if GetRef().GetValuePercentage(Game.GetHealthAV()) < minHealthPercent && GetOwningQuest().GetStageDone(OnHitStage) == false
			GetOwningQuest().SetStage(HealthPercentStage)
		else
			RegisterForHitEvent(self)
		endif
	endif
endFunction
