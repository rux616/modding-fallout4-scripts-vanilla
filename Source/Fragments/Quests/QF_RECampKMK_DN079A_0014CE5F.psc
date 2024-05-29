;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RECampKMK_DN079A_0014CE5F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_LongneckLukowskisMapMarker.GetRef().AddToMap()
Alias_Traveler.GetRef().RemoveItem(DN079_CannedMeat, 99, false, Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_LongneckLukowskisMapMarker Auto Const

Potion Property LukowskisPottedMeat Auto Const

Potion Property DN079_CannedMeat Auto Const

ReferenceAlias Property Alias_Traveler Auto Const
