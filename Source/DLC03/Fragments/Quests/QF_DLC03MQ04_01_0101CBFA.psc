;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03MQ04_01_0101CBFA Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE dlc03:mq04script
Quest __temp = self as Quest
dlc03:mq04script kmyQuest = __temp as dlc03:mq04script
;END AUTOCAST
;BEGIN CODE
kmyQuest.EnterVR(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE dlc03:mq04script
Quest __temp = self as Quest
dlc03:mq04script kmyQuest = __temp as dlc03:mq04script
;END AUTOCAST
;BEGIN CODE
DLC03MQ04.SetStage(100)
; store turrets on workshop
kmyQuest.VRWorkshopAlias.GetRef().StoreInWorkshop(kmyQuest.MQ04.DLC03VRDefender01, kmyQuest.iTurretCount)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0102_Item_00
Function Fragment_Stage_0102_Item_00()
;BEGIN AUTOCAST TYPE dlc03:mq04script
Quest __temp = self as Quest
dlc03:mq04script kmyQuest = __temp as dlc03:mq04script
;END AUTOCAST
;BEGIN CODE
kmyquest.ResetDisplayTimer()
DLC03MQ04.SetStage(102)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0104_Item_00
Function Fragment_Stage_0104_Item_00()
;BEGIN AUTOCAST TYPE dlc03:mq04script
Quest __temp = self as Quest
dlc03:mq04script kmyQuest = __temp as dlc03:mq04script
;END AUTOCAST
;BEGIN CODE
kmyquest.ResetDisplayTimer()
DLC03MQ04.SetStage(104)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0106_Item_00
Function Fragment_Stage_0106_Item_00()
;BEGIN AUTOCAST TYPE dlc03:mq04script
Quest __temp = self as Quest
dlc03:mq04script kmyQuest = __temp as dlc03:mq04script
;END AUTOCAST
;BEGIN CODE
kmyquest.ResetDisplayTimer()
DLC03MQ04.SetStage(106)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0108_Item_00
Function Fragment_Stage_0108_Item_00()
;BEGIN AUTOCAST TYPE dlc03:mq04script
Quest __temp = self as Quest
dlc03:mq04script kmyQuest = __temp as dlc03:mq04script
;END AUTOCAST
;BEGIN CODE
kmyquest.ResetDisplayTimer()
DLC03MQ04.SetStage(108)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN AUTOCAST TYPE dlc03:mq04script
Quest __temp = self as Quest
dlc03:mq04script kmyQuest = __temp as dlc03:mq04script
;END AUTOCAST
;BEGIN CODE
;turn off Tutorial objective
kmyquest.ResetDisplayTimer()
DLC03MQ04.SetStage(103)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN AUTOCAST TYPE dlc03:mq04script
Quest __temp = self as Quest
dlc03:mq04script kmyQuest = __temp as dlc03:mq04script
;END AUTOCAST
;BEGIN CODE
;turn off tutorial objective
kmyquest.ResetDisplayTimer()
DLC03MQ04.SetStage(105)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN AUTOCAST TYPE dlc03:mq04script
Quest __temp = self as Quest
dlc03:mq04script kmyQuest = __temp as dlc03:mq04script
;END AUTOCAST
;BEGIN CODE
;turn off tutorial objective
kmyquest.ResetDisplayTimer()
DLC03MQ04.SetStage(107)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN AUTOCAST TYPE dlc03:mq04script
Quest __temp = self as Quest
dlc03:mq04script kmyQuest = __temp as dlc03:mq04script
;END AUTOCAST
;BEGIN CODE
;DLC03MQ04_01_DimaScene01.Stop()

;advance tutorial
kmyquest.ResetDisplayTimer()
DLC03MQ04.SetStage(109)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; need to make sure the holotape is a quest item
Actor PlayerREF = Game.GetPlayer()
ObjectReference HolotapeREF = PlayerREF.PlaceAtMe(DLC03MQ04Memory01Holotape)
DiMAHolotape01.ForceRefTo(HolotapeREF)
PlayerREF.AddItem(HolotapeREF)

;make sure the tutorial scene has stopped if for some reason it hasn't
DLC03MQ04_01_DimaScene01.Stop()
SetStage(170)
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
DLC03MQ04.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
DLC03MQ04Memory01Scene.Start()
; failsafe
SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC03MQ04 Auto Const Mandatory

Scene Property DLC03MQ04Memory01Scene Auto Const Mandatory

Holotape Property DLC03MQ04Memory01Holotape Auto Const Mandatory

Scene Property DLC03MQ04_01_DimaScene01 Auto Const Mandatory

ReferenceAlias Property DiMAHolotape01 Auto Const
