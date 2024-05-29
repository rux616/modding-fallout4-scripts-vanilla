Scriptname MQ106InvestgationDummySCRIPT extends ObjectReference Const

scene property myScene auto Const
int property stageToSet = 0 auto const
quest property MQ106Investigations auto const
Activator Property MQ106BloodyBandages Auto Const
referencealias property dogmeatAlias auto const
bool property bKeyObjectNoStage = FALSE auto const
{used specifically for assaultron head - treat this as a clue object despite not setting stage a directly}

Event OnLoad()
    ;blockActivation()
    ;debug.trace("MQ106: Successfully blocked activation on "+self)
EndEvent

Event OnActivate(ObjectReference akActionRef)

    debug.trace("MQ106: Clue being activated by "+akActionRef)
    debug.trace("       Clue is "+self)
    debug.trace("       Stage to Set is "+stageToSet)
    debug.trace("       MQ106inv stage is "+MQ106Investigations.getCurrentStageID())

    objectReference player = game.getPlayer()

    if akActionRef == player
    	
        if MQ106BloodyBandages
    		; the bloody bandages should disable (other objects are sent to inventory)
    		disable()
        else
            player.addItem(self)
    	endif
        
        if stageToSet != 0 || bKeyObjectNoStage
            if !MQ106Investigations.getStageDone(stageToSet)
                debug.trace("       MQ106inv stage "+stageToSet+" not set.  Doing it now.")
                ; advance the quest if this is marked as a key object.
                if !bKeyObjectNoStage
                    MQ106Investigations.setStage(stageToSet)
                endif
                if (dogmeatAlias.getReference()).getDistance(player) > 2000
                    ; dogmeat is really far away... scheat and get him hnere!
                    dogmeatAlias.getReference().moveto(player)
                endif
                myScene.start()
            else
                debug.trace("        Stage is already set!")
            endif
        endif
    endif
EndEvent
