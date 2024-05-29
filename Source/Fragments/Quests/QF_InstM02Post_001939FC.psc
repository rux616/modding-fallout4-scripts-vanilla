;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_InstM02Post_001939FC Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Set when the player changes location, and the old and new location are not InstituteLocation.

;Change Alan Binet's anim archetype to "sad" if stage 1600 was set on InstM02
if InstM02.GetStageDone(1600)
     Alias_Alan.GetActorRef().ChangeAnimArchetype(AnimArchetypeDepressed)
endif

;Disable Liam Binet if the player sided with Justin in InstM02
if InstM02.GetStageDone(1600)
     LiamBinetMarkerRef.Disable()
endif

;Disable Justin Ayo if the player sided with Liam in InstM02, and give Alana Secord his outfit
if InstM02.GetStageDone(1800)
     JustinAyoMarkerRef.Disable()
     Alias_Alana.GetActorRef().SetOutfit(InstituteDivisionHeadSRB) 
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

Outfit Property InstituteDivisionHeadSRB Auto Const

ReferenceAlias Property Alias_Alana Auto Const

ObjectReference Property LiamBinetMarkerRef Auto Const Mandatory

ObjectReference Property JustinAyoMarkerRef Auto Const Mandatory
