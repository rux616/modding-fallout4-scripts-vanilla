Scriptname DN138Quest extends Quest Hidden Conditional

Int Property RewardTracker Auto Conditional

Sound Property OBJGeneratorMotorLPM Auto
{Looping sound for the pump}

ReferenceAlias Property PumpSoundSource Auto

Int FloodDisableTimerID = 1 Const

Int PumpSoundInstance

Function PlayPumpSound()
	PumpSoundInstance = OBJGeneratorMotorLPM.Play(PumpSoundSource.GetReference())
EndFunction

Function StartFloodDisableTimer()
	StartTimerGametime(24, FloodDisableTimerID)
EndFunction

Event OnTimerGameTime(int aiTimerID)
    if (aiTimerID == FloodDisableTimerID)
    	if Game.GetPlayer().GetLevel() >= 12
    		SetStage(1500)
    	else
    		StartTimerGametime(24, FloodDisableTimerID)
    	endif
    endif
EndEvent