Scriptname FXArtObjectMAgicAttachSCRIPT extends ActiveMagicEffect

VisualEffect Property pSentryBotFaceLightMPSVE Auto Const


Event OnEffectStart(Actor akTarget, Actor akCaster)

	if  (akCaster as objectReference).WaitFor3DLoad()
	    pSentryBotFaceLightMPSVE.Play(akCaster)
	else
		;nothing
	endif
EndEvent



Event OnEffectFinish(Actor akTarget, Actor akCaster)
	pSentryBotFaceLightMPSVE.Stop(akCaster)
EndEvent


Event OnDeath(Actor akKiller)
	actor selfRef = self.GetTargetActor()
    pSentryBotFaceLightMPSVE.Stop(selfRef)
EndEvent