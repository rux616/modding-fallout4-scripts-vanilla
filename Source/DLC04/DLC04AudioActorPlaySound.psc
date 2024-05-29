Scriptname DLC04:DLC04AudioActorPlaySound extends Actor
{One shot sound plays via a timer on an actor until combat starts.}

Import Utility
Import Debug

Sound Property SoundDescriptor const auto
{Sound Descriptor that this script will play}

float property delayMin = 1.0 const auto
float property delayMax = 5.0 const auto
Bool bRunning = True

int iPlaySoundTimerID = 1 const

Function EnableSoundTimer()
	bRunning = isEnabled()
	if (bRunning && GetCombatState() !=1 && IsDead() == false)
		StartTimer(GetWaitTime(), iPlaySoundTimerID)
	endIf
EndFunction
;Function to enable the timer that plays the sound within a definied interval

Function DisableSoundTimer()
	If (bRunning == isEnabled())
		bRunning = false
		CancelTimer(iPlaySoundTimerID)
	EndIf
EndFunction
;Function to disable the timer that plays the sound within a definied interval

EVENT OnLoad()
	;debug.trace("Audio Debug: loaded successfully "+self)
	EnableSoundTimer()
EndEvent
;When the actor loads, then enable the sound timer

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
  if (aeCombatState == 0)
	 EnableSoundTimer()
    Debug.Trace("We have left combat")    	
  elseif (aeCombatState == 1)
  	DisableSoundTimer()
    Debug.Trace("We have entered combat")
  elseif (aeCombatState == 2)
  	DisableSoundTimer()
	Debug.Trace("We are searching...")
EndIf
EndEvent
;Starts and stops the sound timer based on the actor's combat state.

Event OnCellDetach()
	DisableSoundTimer()
	;debug.trace("Audio Debug: turning loop off "+self)
EndEvent
;Stops the timer on cell detach

Event OnUnload()
	DisableSoundTimer()
	;debug.trace("Audio Debug: turning loop off "+self)
EndEvent
;Stops the timer on unload.

Event OnDying(Actor akKiller)
	DisableSoundTimer()
EndEvent
;Stops the timer when the actor starts to die

Event OnTimer(int aiTimerID)
	if (aiTimerID == iPlaySoundTimerID)
		SoundDescriptor.Play (self)
		if (bRunning && isEnabled())
			StartTimer(GetWaitTime(), iPlaySoundTimerID)
		endIf
	endIf
EndEvent
;The timer which plays the sound

float Function GetWaitTime()
	return RandomFloat (DelayMin,DelayMax)
endFunction
;Part of the timer