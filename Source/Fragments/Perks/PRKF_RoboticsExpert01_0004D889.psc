;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Perks:PRKF_RoboticsExpert01_0004D889 Extends Perk Hidden Const

;BEGIN FRAGMENT Fragment_Entry_00
Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
if !akTargetRef.HasKeyword(perkRoboticsExpertImmune)
    akTargetRef.AddKeyword(perkRoboticsExpertImmune)
    InputEnableLayer myLayer = InputEnableLayer.Create()
    myLayer.disablePlayerControls()

    game.forcefirstperson()
    debug.trace("PERK: ROBOTICS EXPERT Invoked!  - (3/20 b revisions active)") 
    objectReference player = game.getPlayer()
    actor aPlayer = player as actor

    ; store the targeted actor so we can refer to it in conditions and other scripts 
    player.setLinkedRef(akTargetRef, perkRoboticsExpertLink)
    if (akTargetRef as actor).isUnconscious()
    	player.setValue(RoboticsExpertTargetConscious, 0)
    else
    	player.setvalue(RoboticsExpertTargetConscious, 1)
    endif

    if akTargetRef.hasEffectkeyword(robotCanSelfDestruct)
    	player.setValue(RoboticsExpertTargetCanSelfDestruct, 1)
    else
    	player.setValue(RoboticsExpertTargetCanSelfDestruct, 0)
    endif
    ;debug.trace("RoboExp: suspending player controls")
    
    debug.trace("RoboExp: play jackin idle: "+idlepipboyjackin)
    if !aPlayer.IsSneaking()
        aPlayer.playIdle(idlepipboyjackin)
        ; when done, pull up pip-boy interface
        utility.wait(0.833) ; "exact" time is 0.83333
    endif

    debug.trace("RoboExp: Interface now displayed on Pip-Boy")
    myLayer.enablePlayerControls()
    perkRoboticsExpertInterface.showOnPipBoy()

    ;debug.trace("RoboExp: Interface closing, clean up & return control...")
    ;debug.trace("RoboExp: play jackout idle: "+idlepipboyjackout)
    ;(player as actor).playIdle(idlepipboyjackout)
    akTargetRef.ResetKeyword(perkRoboticsExpertImmune)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    debug.trace("RoboExp: received animation event: "+asEventName)
    if akSource == game.getPlayer() && asEventName == "furnitureIdleSlave"
    	roboticsExpertVar.setValue(1.0)
    endif
EndEvent

Event OnTimer(int aiTimerID)
	if (roboticsExpertVar.getValue() != 1.0)
    	roboticsExpertVar.setValue(1.0)
  	endif
EndEvent


globalvariable property roboticsExpertVar auto const
Furniture Property hijackAnimFurniture Auto Const
Keyword Property perkRoboticsExpertLink Auto Const
Keyword Property perkRoboticsExpertImmune auto Const
Terminal Property perkRoboticsExpertInterface Auto Const
quest property perksQuest auto const
referenceAlias property roboticsExpertTarget auto const
ActorValue Property RoboticsExpertTargetConscious Auto Const
ActorValue Property IgnorePlayerWhileFrenzied Auto Const
Idle Property IdlePipBoyJackIn Auto Const
Idle Property IdlePipBoyJackOut Auto Const
Keyword Property robotCanSelfDestruct Auto Const
ActorValue Property RoboticsExpertTargetCanSelfDestruct Auto Const
