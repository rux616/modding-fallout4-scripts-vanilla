;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_perkRobophobeInterface_00046D7A Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
actor Target = (game.getPlayer().getLinkedRef(perkRobophobeLink) as actor)

	if Target.getValue(MiscStatRobotHasBeenDisabled) == 0
		game.incrementStat("Robots Disabled", 1)
		Target.setValue(MiscStatRobotHasBeenDisabled, 1)
	endif

Target.setUnconscious()
Target.setCanDoCommand(FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
(game.getPlayer().getLinkedRef(perkRobophobeLink) as actor).setUnconscious(FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
actor Target = game.getPlayer().getLinkedRef(perkRobophobeLink) as actor

targetedRobot.forceRefTo(Target)

Target.setUnconscious(FALSE)
Target.setDoingFavor()

;Target.setPlayerTeammate()
;Target.setCanDoCommand()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
debug.trace("Robotics Expert: Player has initiated self-destruct on"+game.getPlayer().getLinkedRef(perkRobophobeLink))
(game.getPlayer().getLinkedRef(perkRobophobeLink)).activate(RobotSelfDestructerREF)
(game.getPlayer().getLinkedRef(perkRobophobeLink) as actor).sendAssaultAlarm()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
Actor RobophobeLink = (Game.GetPlayer().getLinkedRef(perkRobophobeLink) as actor)
if (Robophobelink.HasMagicEffect(RoboticsExpertFrenzySpellEffect))
	;do nothing

else
	RobotFrenzyRef.activate(Robophobelink as ObjectReference)

endIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property targetedRobot Auto Const
Keyword Property perkRobophobeLink Auto Const
ObjectReference Property RobotSelfDestructerREF Auto Const
ActorValue Property Aggression Auto Const

ActorValue Property IgnorePlayerWhileFrenzied Auto Const

ActorValue Property MiscStatRobotHasBeenDisabled Auto Const

ObjectReference Property RobotFrenzyREF Auto Const


MagicEffect Property RoboticsExpertFrenzySpellEffect Auto Const
