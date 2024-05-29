;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_InstM02Post_0105E61C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE InstM02PostScript
Quest __temp = self as Quest
InstM02PostScript kmyQuest = __temp as InstM02PostScript
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
;Set when the player changes location, and the old and new location as not InstituteLocation.

;Change Alan Binet's anim archetype to "sad" if stage 1600 was set on InstM02
if InstM02.GetStageDone(1600)
     Alias_Alan.GetActorRef().ChangeAnimArchetype(AnimArchetypeDepressed)
endif

;Disable Liam Binet if the player sided with Liam in InstM02
if InstM02.GetStageDone(1600)
     Alias_Liam.GetActorRef().Disable()
endif

;Disable Justin Ayo if the player sided with Justin in InstM02
if InstM02.GetStageDone(1800)
     Alias_Justin.GetActorRef().Disable()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property InstM02 Auto Const

Keyword Property AnimFaceArchetypeSad Auto Const

Keyword Property AnimArchetypeDepressed Auto Const

ReferenceAlias Property Alias_Alan Auto Const

ReferenceAlias Property Alias_Justin Auto Const

ReferenceAlias Property Alias_Liam Auto Const
