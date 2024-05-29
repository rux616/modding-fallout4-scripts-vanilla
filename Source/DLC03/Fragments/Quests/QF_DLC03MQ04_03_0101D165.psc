;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03MQ04_03_0101D165 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE dlc03:mq04script
Quest __temp = self as Quest
dlc03:mq04script kmyQuest = __temp as dlc03:mq04script
;END AUTOCAST
;BEGIN CODE
DLC03MQ04.SetStage(300)
; store turrets on workshop
kmyQuest.VRWorkshopAlias.GetRef().StoreInWorkshop(kmyQuest.MQ04.DLC03VRDefender01, kmyQuest.iTurretCount)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; need to make sure the holotape is a quest item
Actor PlayerREF = Game.GetPlayer()
ObjectReference HolotapeREF = PlayerREF.PlaceAtMe(DLC03MQ04Memory03Holotape)
DiMAHolotape03.ForceRefTo(HolotapeREF)
PlayerREF.AddItem(HolotapeREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN AUTOCAST TYPE dlc03:mq04script
Quest __temp = self as Quest
dlc03:mq04script kmyQuest = __temp as dlc03:mq04script
;END AUTOCAST
;BEGIN CODE
kmyquest.SetDataDisplayComplete()
; next objective
DLC03MQ04.SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
DLC03MQ04Memory03Scene.Start()
; failsafe
SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Holotape Property DLC03MQ04Memory03Holotape Auto Const Mandatory

Scene Property DLC03MQ04Memory03Scene Auto Const Mandatory

DLC03:MQ04MasterScript Property DLC03MQ04 Auto Const Mandatory

ReferenceAlias Property DiMAHolotape03 Auto Const
