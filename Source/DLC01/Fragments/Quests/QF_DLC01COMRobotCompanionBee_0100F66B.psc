;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01COMRobotCompanionBee_0100F66B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_RobotCompanionBeep.GetActorReference().AddToFaction(HasBeenCompanionFaction)
Alias_RobotCompanionBeep.GetActorReference().SetValue(DLC01RobotDefaultOff,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_RobotCompanionBeep Auto Const Mandatory

ActorValue Property DLC01RobotDefaultOff Auto Const Mandatory

Faction Property HasBeenCompanionFaction Auto Const Mandatory
