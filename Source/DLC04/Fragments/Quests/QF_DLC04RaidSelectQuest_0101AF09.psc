;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04RaidSelectQuest_0101AF09 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
;Make sure to pull Shank out of his book reading anim
Alias_Shank.GetActorRef().ChangeAnimFlavor()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Shank Auto Const Mandatory
