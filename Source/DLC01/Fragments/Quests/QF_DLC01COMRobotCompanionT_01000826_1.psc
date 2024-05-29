;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01COMRobotCompanionT_01000826_1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_RobotCompanion.GetActorReference().AddToFaction(HasBeenCompanionFaction)
Alias_RobotCompanion.GetActorReference().SetValue(DLC01RobotDefaultOff,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Add the Self-Destruct spell to the robot, starting the initial visual effects.
Alias_RobotCompanion.GetActorRef().AddSpell(DLC01SelfDestructOrderAbility)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0201_Item_00
Function Fragment_Stage_0201_Item_00()
;BEGIN CODE
;Activate the robot with DLC01RobotSelfDestructOrderRef, causing it to explode.
Actor robot = Alias_RobotCompanion.GetActorRef()
if (robot != None)
     robot.Activate(DLC01RobotSelfDestructOrderRef)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property HasBeenCompanionFaction Auto Const Mandatory

ReferenceAlias Property Alias_RobotCompanion Auto Const Mandatory

ActorValue Property DLC01RobotDefaultOff Auto Const Mandatory
SPELL Property DLC01CompanionSelfDestructAbility Auto Const Mandatory

SPELL Property DLC01CompanionSelfDestructSpell Auto Const Mandatory

ObjectReference Property RobotSelfDestructerREF Auto Const Mandatory

SPELL Property DLC01SelfDestructOrderAbility Auto Const Mandatory

ObjectReference Property DLC01RobotSelfDestructOrderRef Auto Const Mandatory
