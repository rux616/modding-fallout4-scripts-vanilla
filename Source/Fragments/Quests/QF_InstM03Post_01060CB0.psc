;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_InstM03Post_01060CB0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE InstM03PostScript
Quest __temp = self as Quest
InstM03PostScript kmyQuest = __temp as InstM03PostScript
;END AUTOCAST
;BEGIN CODE
;Startup stage - runs when the quest is started from the completion stage of quest Inst302
;Start to monitor for ChangeLocation event
kmyquest.InitializeQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Set when the player changes location, and the old and new location are not InstituteLocation.

;Change Alan Binet's anim archetype to "sad" if stage 1600 was set on InstM02
;if InstM02.GetStageDone(1600)
;     Alias_Alan.GetActorRef().ChangeAnimArchetype(AnimArchetypeDepressed)
;endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property InstM03 Auto Const
