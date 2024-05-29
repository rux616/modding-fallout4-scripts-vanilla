Scriptname holdupDispelEffectScript extends ActiveMagicEffect

actorValue property HoldupImmuneAV auto mandatory
GlobalVariable property HoldupPacifyTimer auto mandatory

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akTarget.getValue(HoldupImmuneAV) == 1
		StartTimer(HoldupPacifyTimer.getValue(), 1)
	elseif akTarget.getValue(HoldupImmuneAV) == 0
    	self.Dispel()
    endif
EndEvent

Event OnTimer(int aiTimerId)
	if aiTimerId == 1
		self.Dispel()
	endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	if akTarget.getValue(HoldupImmuneAV) == 1
		akTarget.SetValue(HoldupImmuneAV, 0)
		akTarget.getCrimeFaction().setPlayerEnemy(false)
	endif
Endevent
