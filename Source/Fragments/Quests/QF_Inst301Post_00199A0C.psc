;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Inst301Post_00199A0C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE Inst301PostScript
Quest __temp = self as Quest
Inst301PostScript kmyQuest = __temp as Inst301PostScript
;END AUTOCAST
;BEGIN CODE
;Startup stage - runs when the quest is started from the completion stage of quest Inst301
;Start to monitor for ChangeLocation event
kmyquest.InitializeQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Set when the player changes location, and the old and new location are not InstituteLocation.

;Disable Gabriel (he'll be in the Reclamation Chair at this point)
Alias_Gabriel.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Gabriel Auto Const
