;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN056_0100B4D5 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_Actor.ForceRefTo(BoSKnightHaylenRef)
Alias_Temp.ForceRefTo(Alias_Danse.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Danse Auto Const

ReferenceAlias Property Alias_Actor Auto Const

ObjectReference Property BoSKnightHaylenRef Auto Const

ReferenceAlias Property Alias_TEMP Auto Const
