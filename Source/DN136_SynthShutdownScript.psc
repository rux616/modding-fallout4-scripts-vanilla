ScriptName DN136_SynthShutdownScript extends Actor
{On load, if a quest variable is set, play shutdown idle}

Idle Property IdleSynthShutdown Auto Mandatory Const
Quest Property myQuest Auto Mandatory Const
Int Property myStage = 425 Auto Const
Faction Property PlayerFaction Auto Mandatory Const
ActorValue Property Aggression Auto Mandatory Const
ActorValue Property Health Auto Mandatory Const

bool doOnce = FALSE

;************************************

Event OnLoad()
    ;check to see if stage is set, if so, play idle and set unconcious
    if doOnce == FALSE
    	if (myQuest.getStageDone(myStage) == 1)
    		doOnce = TRUE
        setUnconscious(TRUE)
        SetValue(Health, 1)
        RemoveFromAllFactions()
        AddToFaction(PlayerFaction)
        StopCombat()
        SetValue(Aggression, 0)
        utility.wait(1.0)
       	PlayIdle(IdleSynthShutdown)
    	endif
    endif
EndEvent

;************************************