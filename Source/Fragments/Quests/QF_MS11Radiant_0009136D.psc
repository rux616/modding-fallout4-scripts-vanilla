;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS11Radiant_0009136D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; Fill MS11's aliases with newly created quest objects
(Alias_MS11PoseidonRadar as ReferenceAlias).ForceRefTo(Alias_MiscObject_PoseidonRadar.GetRef() as ObjectReference)
(Alias_MS11TurbopumpBearings as ReferenceAlias).ForceRefTo(Alias_MiscObject_Turbopump.GetRef() as ObjectReference)

;QuestObject_RadarTransmitter().ForceRefTo(Alias_MiscObject_PoseidonRadar)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property pMS11PoseidonRadar Auto Const

ReferenceAlias Property Alias_MiscObject_PoseidonRadar Auto Const

Quest Property pMS11 Auto Const

Alias Property Alias_MS11PoseidonRadar Auto Const

Alias Property Alias_MS11TurbopumpBearings Auto Const

ReferenceAlias Property Alias_MiscObject_Turbopump Auto Const
