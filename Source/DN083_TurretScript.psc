Scriptname DN083_TurretScript extends Actor 

GlobalVariable Property DN083_DeadTurrets Auto 

Int IsOn = 0

Event OnCellAttach()

	if (IsOn == 0)
		Self.SetUnconscious(True)
		isOn = 1
	endif
	
    
EndEvent

Event OnDeath(Actor akKiller)
    if (akKiller == game.getplayer())
    	debug.trace("Before: DN083_DeadTurrets = " + DN083_DeadTurrets.value)
    	DN083_DeadTurrets.Mod(1)
       	debug.trace("After: DN083_DeadTurrets = " + DN083_DeadTurrets.value)
    endif
EndEvent
