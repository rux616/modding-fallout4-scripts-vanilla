Scriptname aliasCustomMusicScript extends ReferenceAlias

MusicType Property mySpecialMusic Auto Const
bool property bStartedMyMusic = FALSE auto 

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
    if aeCombatState == 1 && !bStartedMyMusic
    	; start my tunes
    	mySpecialMusic.add()
    	bStartedMyMusic = TRUE
    endif

    if aeCombatState == 0 && bStartedMyMusic
    	mySpecialMusic.remove()
    	bStartedMyMusic = FALSE
    endif
EndEvent

Event OnDeath(Actor akKiller)
    if bStartedMyMusic
    	mySpecialMusic.remove()
    	bStartedMyMusic = FALSE
    endif
EndEvent

Event OnUnload()
	if bStartedMyMusic
    	mySpecialMusic.remove()
    	bStartedMyMusic = FALSE
    endif
EndEvent