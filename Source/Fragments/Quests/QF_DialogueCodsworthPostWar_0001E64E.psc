;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueCodsworthPostWar_0001E64E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
(Alias_CodsworthAlias.GetActorRef() as WorkshopNPCScript).SetCommandable(true)
WorkshopScript workshopRef = Alias_SanctuaryWorkshop.GetRef() as WorkshopScript
WorkshopParent.AddPermanentActorToWorkshopPUBLIC(Alias_CodsworthAlias.GetActorRef(), workshopRef.GetWorkshopID())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN AUTOCAST TYPE DialogueCodsworthPostWarScript
Quest __temp = self as Quest
DialogueCodsworthPostWarScript kmyQuest = __temp as DialogueCodsworthPostWarScript
;END AUTOCAST
;BEGIN CODE
kmyquest.RegisterForAnimationEvent(Alias_CodsWorthAlias.GetActorRef(), "FoodAcquired")
Alias_CodsworthAlias.GetActorRef().PlayIdle(pHandyGetFood)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(SugarBombs, 1)
SetStage(35)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
MQ102.SetStage(30)
MQ102_CodsworthSearch.Start()

;if player doesn't have the spouse holotape, enable it in the player house
If MQ102.GetStageDone(22) == 0
  CodsworthHolotapeEnableMarker.Enable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;shutdown scene
MQ102_CodsworthSearch01.Stop()

Alias_CodsworthAlias.GetActorRef().EvaluatePackage()

;if player doesn't have the spouse holotape, enable it in the player house
If MQ102.GetStageDone(22) == 0
  CodsworthHolotapeEnableMarker.Enable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
MQ102.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
;make Codsworth eligible as a companion
Alias_CodsworthAlias.GetActorRef().SetAvailableToBeCompanion()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0275_Item_00
Function Fragment_Stage_0275_Item_00()
;BEGIN CODE
;if player hasn't been pointed to Concord, point him to Concord
If (MQ102.GetStageDone(50) == 0) && (MQ102.GetStageDone(55) == 0)
  MQ102.SetStage(50)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; turn on companion functionality (without forcing him as a follower)
SetStage(250)

;if player doesn't have the spouse holotape, enable it in the player house
If MQ102.GetStageDone(22) == 0
  CodsworthHolotapeEnableMarker.Enable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_01
Function Fragment_Stage_0300_Item_01()
;BEGIN CODE
; if Min01 hasn't already done this, make Codsworth workshop actor
SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;Codsworth dead
;advance quest

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_CodsworthAlias Auto Const

Idle Property pHandyGetFood Auto Const

Scene Property p004_CodsworthPatrolHumming Auto Const

Quest Property MQ102 Auto Const

Potion Property SugarBombs Auto Const

Scene Property MQ102_CodsworthSearch Auto Const

Faction Property HasBeenCompanionFaction Auto Const

ReferenceAlias Property Alias_SanctuaryWorkshop Auto Const

workshopparentscript Property WorkshopParent Auto Const

Quest Property Min01 Auto Const

Scene Property MQ102_CodsworthSearch01 Auto Const

ObjectReference Property CodsworthHolotapeEnableMarker Auto Const
