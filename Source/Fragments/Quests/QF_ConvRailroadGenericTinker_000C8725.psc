;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_ConvRailroadGenericTinker_000C8725 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Utility.Wait(0.1)

; Terry equips the prototype weapon
Alias_GenericTerry.GetActorRef().EquipItem(pRailwayRifle_Fake)
;Alias_GenericTerry.GetActorRef().EquipItem(pRailwayRifle)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
pRRRailwayTestExplosionMarker.PlaceAtMe(pRRRailwayTestingExplosion)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Remove Terry's Railway Rifle
Alias_GenericTerry.GetActorRef().RemoveItem(pRailwayRifle_Fake, 10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_GenericTerry Auto Const Mandatory

ObjectReference Property pRRRailwayTestExplosionMarker Auto Const Mandatory

Explosion Property pRRRailwayTestingExplosion Auto Const Mandatory

Weapon Property pRailwayRifle_Fake Auto Const Mandatory
