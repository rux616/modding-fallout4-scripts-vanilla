;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoS101POI_010076E0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Update Enable Markers.
BoS101POI_Enable.Enable()
BoS101POI_EnableTemp.Enable()
BoS101POI_Disable.Disable()
BoS101POI_DisableTemp.Disable()

;Enable the Caravan Fight actors.
int i = 0
While (i < Alias_BoS101POI_Raiders.GetCount())
     Alias_BoS101POI_Raiders.GetAt(i).Enable()
     i = i + 1
EndWhile
i = 0
While (i < Alias_BoS101POI_Guards.GetCount())
     Alias_BoS101POI_Guards.GetAt(i).Enable()
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
int i = 0
Actor current
While (i < Alias_BoS101POI_Raiders.GetCount())
     current = Alias_BoS101POI_Raiders.GetAt(i) as Actor
     current.RemoveFromFaction(BoS101POIFaction)
     current.EvaluatePackage()
     i = i + 1
EndWhile
i = 0
While (i < Alias_BoS101POI_Guards.GetCount())
     current = Alias_BoS101POI_Guards.GetAt(i) as Actor
     current.RemoveFromFaction(BoS101POIFaction)
     current.EvaluatePackage()
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Make sure Stage 30 got set so the Raiders are hostile if the player later bumps into them.
SetStage(30)

;Update Enable Markers.
BoS101POI_EnableTemp.Disable()
BoS101POI_DisableTemp.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_BoS101POI_Guards Auto Const

RefCollectionAlias Property Alias_BoS101POI_Raiders Auto Const

Faction Property BoS101POIFaction Auto Const

ObjectReference Property BoS101POI_Enable Auto Const

ObjectReference Property BoS101POI_EnableTemp Auto Const

ObjectReference Property BoS101POI_Disable Auto Const

ObjectReference Property BoS101POI_DisableTemp Auto Const
