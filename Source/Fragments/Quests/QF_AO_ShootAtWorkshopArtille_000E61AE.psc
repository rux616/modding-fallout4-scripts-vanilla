;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_AO_ShootAtWorkshopArtille_000E61AE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
debug.trace(self + "stage 0: startup")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_myObject Auto Const

Scene Property AO_LightsOutGJ_Scene Auto Const

ReferenceAlias Property Alias_myActor Auto Const

RefCollectionAlias Property Alias_ActorAllies Auto Const

Faction Property AO_SuspicionFaction Auto Const

RefCollectionAlias Property Alias_OtherMissingLights Auto Const
