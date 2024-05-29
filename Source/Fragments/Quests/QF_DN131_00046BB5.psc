;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN131_00046BB5 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;On startup, give Swan his reward item.
CustomItemQuest.SetStage(160)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;When Swan is killed, shut down DN131_Commons, allowing other enemies in.
DN131_Commons.SetStage(255)

;Allow the Vertibird RE Trigger, DN131_BostonCommonVertibirdRETrigger, to
;enable when Boston Common next unloads.

;Then stop the quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DN131_Commons Auto Const

Quest Property CustomItemQuest Auto Const Mandatory
