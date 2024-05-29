;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueAbernathyFarm_0006B4CF Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Set in Lucy's say once hello about paying caps for picking melons
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Set in Connie's first hello
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; set workshop to player ownership
AbernathyFarmWorkshopRef.SetOwnedByPlayer(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Blake Auto Const

ReferenceAlias Property Alias_Connie Auto Const

ReferenceAlias Property Alias_Lucy Auto Const

WorkshopParentScript Property WorkshopParent Auto Const

Workshopscript Property AbernathyFarmWorkshopRef Auto Const

Potion Property Melon Auto Const

Keyword Property CA_Scene_Likes Auto Const

ReferenceAlias Property Alias_Companion Auto Const
