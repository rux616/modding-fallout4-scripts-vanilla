;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN055_00056107 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_TempMirelurk.getReference().enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
Alias_RodneyDoor.GetReference().unlock()
Alias_Rodney.GetReference().enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TEMPMirelurk Auto Const

ReferenceAlias Property Alias_RodneyMarker Auto Const

ReferenceAlias Property Alias_Rodney Auto Const

ReferenceAlias Property Alias_RodneyIntercom Auto Const

ReferenceAlias Property Alias_RodneyDoor Auto Const
