;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFDiamondCity02_0014191C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Tell player where to go
SetObjectiveDisplayed(10)

;remove money
Game.GetPlayer().RemoveItem(Caps001, ServiceCostBuyHouse.GetValueInt())

;give key and set ownership
Game.GetPlayer().AddItem(DmndPlayerHouseKey)
DmndPlayerHouse01.SetFactionOwner(PlayerFaction)
Alias_Door01.GetRef().SetFactionOwner(PlayerFaction)
Alias_Door02.GetRef().SetFactionOwner(PlayerFaction)
Alias_Door03.GetRef().SetFactionOwner(PlayerFaction)

;add map marker
DiamondCityPlayerHouseMapMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Game.IncrementStat("Workshops Unlocked")
CompleteAllObjectives()
;Game.RewardPlayerXP(XPRadiant.GetValue() as int)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Caps001 Auto Const

GlobalVariable Property DiamondCityHousePurchase Auto Const

Key Property DmndPlayerHouseKey Auto Const

Cell Property DmndPlayerHouse01 Auto Const

ReferenceAlias Property Alias_Door02 Auto Const

ReferenceAlias Property Alias_Door01 Auto Const

Faction Property PlayerFaction Auto Const

GlobalVariable Property XPRadiant Auto Const

GlobalVariable Property ServiceCostBuyHouse Auto Const

ReferenceAlias Property Alias_Door03 Auto Const

ObjectReference Property DiamondCityPlayerHouseMapMarker Auto Const
