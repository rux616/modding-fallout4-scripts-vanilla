;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04DialogueSettlement_0101AABF Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
DLC04NukaNukeBlueprintAcquired.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
; Set in NIRA's first dialogue scene when phase 9 begins

; Conditions NIRA's greetings
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0047_Item_00
Function Fragment_Stage_0047_Item_00()
;BEGIN CODE
DLC04SettlementFF02.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Set in NIRA's dialogue scene

SetStage(40)

; Start the holotape scene of NIRA's tampering
DLC04HolotapesNIRAAudioLog.Start()

; The holotape scene then loops back into NIRA's first scene at phase
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
DLC04LaurenHatesPlayer.SetValue(1)

; Change Lauren's outfit so her collar stays on
Alias_LaurenPlummer.GetActorRef().GetActorBase().SetOutfit(DLC04TraderOutfit)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
; Set in Chip's first scene, phase 4, question option

; Completes in Ryan's quest in Dry Rock
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0087_Item_00
Function Fragment_Stage_0087_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
;Set if the player banished Katelyn

DLC04KatelynBanished.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Set at the end of Maddox' first dialogue scene

SetStage(60)

SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
; Set after the player has given 10 bloodworm meat to Maddox

SetStage(60)

;Remove 10 Bloofworm meat from the player
Game.GetPlayer().RemoveItem(DLC04_MeatBloodworm, 10)

SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

DLC04FFMaddoxGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
; Set from a script on the Player alias in this quest. Stage gets set when the player changes location 
; andthe new location is not the NukaTown hub location

SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)

Game.GetPlayer().AddItem(DLC04_Calmex, 3)
DLC04MaddoxSellsCalmexSilk.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
; Set in the startup stahe of DLC03MQ04

; Referenced in the "DLC04HubFF01PlayerAliasScript"
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
DLC04SettlementFF02.SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Set when the player changes location away from Nuka-World 
; and the "DLC04RaidersGone" global is set to 1

; Change the traders' outfits to remove their collars

Alias_LaurenPlummer.GetActorRef().RemoveItem(DLC04_ShockCollar, 99)
Alias_LaurenPlummer.GetActorRef().GetActorBase().SetOutfit(DLC04TraderOutfitNoCollar)
Alias_MackenzieBridgeman.GetActorRef().RemoveItem(DLC04_ShockCollar, 99)
Alias_MackenzieBridgeman.GetActorRef().GetActorBase().SetOutfit(DLC04TraderOutfitNoCollar)
Alias_Maddox.GetActorRef().RemoveItem(DLC04_ShockCollar, 99)
Alias_Maddox.GetActorRef().GetActorBase().SetOutfit(DLC04TraderOutfitNoCollar)
Alias_AaronCorbett.GetActorRef().RemoveItem(DLC04_ShockCollar, 99)
Alias_AaronCorbett.GetActorRef().GetActorBase().SetOutfit(DLC04TraderOutfitNoCollar)
Alias_ShelbieChase.GetActorRef().RemoveItem(DLC04_ShockCollar, 99)
Alias_ShelbieChase.GetActorRef().GetActorBase().SetOutfit(DLC04TraderOutfitNoCollar)
Alias_KeithDawkins.GetActorRef().RemoveItem(DLC04_ShockCollar, 99)
Alias_KeithDawkins.GetActorRef().GetActorBase().SetOutfit(DLC04TraderOutfitNoCollar)
Alias_ChipMorse.GetActorRef().RemoveItem(DLC04_ShockCollar, 99)
Alias_ChipMorse.GetActorRef().GetActorBase().SetOutfit(DLC04TraderOutfitNoCollar)
Alias_Harvey.GetActorRef().RemoveItem(DLC04_ShockCollar, 99)
Alias_Harvey.GetActorRef().GetActorBase().SetOutfit(DLC04TraderOutfitNoCollar)
Alias_TraderFemale01.GetActorRef().RemoveItem(DLC04_ShockCollar, 99)
Alias_TraderFemale01.GetActorRef().GetActorBase().SetOutfit(DLC04TraderOutfitNoCollar)
Alias_TraderFemale02.GetActorRef().RemoveItem(DLC04_ShockCollar, 99)
Alias_TraderFemale02.GetActorRef().GetActorBase().SetOutfit(DLC04TraderOutfitNoCollar)
Alias_TraderMale01.GetActorRef().RemoveItem(DLC04_ShockCollar, 99)
Alias_TraderMale01.GetActorRef().GetActorBase().SetOutfit(DLC04TraderOutfitNoCollar)
Alias_TraderMale02.GetActorRef().RemoveItem(DLC04_ShockCollar, 99)
Alias_TraderMale02.GetActorRef().GetActorBase().SetOutfit(DLC04TraderOutfitNoCollar)

; Change out the radios to play Diamond City Radio and not raider station

DLC04MarketRadioEnableMarker.Disable()
DLC04AlleyRadioEnableMarker.Disable()
DLC04RadioDoctorEnableMarkerRef.Disable()
DLC04RadioPondEnableMarkerRef.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Player heard or read about rumor. Display Map Marker.
If Alias_HubologistMapMarker.GetRef().IsMapMarkerVisible() == 0
   SetObjectiveDisplayed(400)
   ; Display map marker as well.
   Alias_HubologistMapMarker.GetRef().AddToMap()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
; Player met the Hubologists. Complete misc objective.
SetObjectiveCompleted(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
; Player killed Cleansed and didn't complete the objective, so remove it.
SetObjectiveDisplayed(400, False, False)
Alias_DLC04MS02Cleansed.TryToClear()
Alias_DLC04MS02Dara.TryToClear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Player read about rumor. Display Map Marker if it's not already revealed.
If Alias_GrandchesterMapMarker.GetRef().IsMapMarkerVisible() == 0
    SetObjectiveDisplayed(500)
   ; Display map marker as well.
   Alias_GrandchesterMapMarker.GetRef().AddToMap()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
; Player met the Hubologists. Complete misc objective.
SetObjectiveCompleted(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
DLC04HubDiscipleDisableMarker.Disable()

; Shut down staged scenes with Disciples to prevent weirdness
DLC04SettlementSS2.Stop()
DLC04SettlementSS4.Stop()
DLC04MS01_OpeningScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
DLC04HubOperatorsDisableMarker.Disable()

; Shut down staged scenes with Operators to prevent weirdness
DLC04SettlementSS1.Stop()
DLC04SettlementSS3.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
DLC04HubPackDisableMarker.Disable()

; Shut down staged scenes with Pack to prevent weirdness
DLC04SettlementSS1.Stop()
DLC04SettlementSS2.Stop()
DLC04SettlementSS5.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0630_Item_00
Function Fragment_Stage_0630_Item_00()
;BEGIN CODE
; Stop combat alarms on the civilians

;x.StopCombatAlarms()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
; Makes the traders and travelers enemies of the raiders, and allies of the player
; Triggered from the quest where the player decides to kill all of the raiders
; Note that traders and travelers are Protected, so the raiders cannot kill them
; However, the traders and travelers all flee

DLC04SettlementTraderFaction.SetEnemy(DLC04HubRaiderFaction)
DLC04SettlementTraderFaction.SetAlly(PlayerFaction)
DLC04SettlementVisitorFaction.SetEnemy(DLC04HubRaiderFaction)
DLC04SettlementVisitorFaction.SetAlly(PlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DLC04HolotapesNIRAAudioLog Auto Const Mandatory

GlobalVariable Property DLC04FFMaddoxGlobal Auto Const Mandatory

GlobalVariable Property DLC04LaurenHatesPlayer Auto Const Mandatory

Outfit Property DLC04TraderOutfit Auto Const Mandatory

ReferenceAlias Property Alias_LaurenPlummer Auto Const Mandatory

Quest Property DLC04SettlementFF02 Auto Const Mandatory

GlobalVariable Property DLC04KatelynBanished Auto Const Mandatory

GlobalVariable Property DLC04NukaNukeBlueprintAcquired Auto Const Mandatory

Outfit Property DLC04TraderOutfitNoCollar Auto Const Mandatory

ReferenceAlias Property Alias_MackenzieBridgeman Auto Const Mandatory

ReferenceAlias Property Alias_AaronCorbett Auto Const Mandatory

ReferenceAlias Property Alias_Maddox Auto Const Mandatory

ReferenceAlias Property Alias_KeithDawkins Auto Const Mandatory

ReferenceAlias Property Alias_ChipMorse Auto Const Mandatory

ReferenceAlias Property Alias_ShelbieChase Auto Const Mandatory

ObjectReference Property DLC04TraderMale01Ref Auto Const Mandatory

ObjectReference Property DLC04TraderMale02Ref Auto Const Mandatory

ObjectReference Property DLC04TraderFemale01Ref Auto Const Mandatory

ObjectReference Property DLC04TraderFemale02Ref Auto Const Mandatory

ReferenceAlias Property Alias_TraderMale01 Auto Const Mandatory

ReferenceAlias Property Alias_TraderMale02 Auto Const Mandatory

ReferenceAlias Property Alias_TraderFemale01 Auto Const Mandatory

ReferenceAlias Property Alias_TraderFemale02 Auto Const Mandatory

Potion Property DLC04_Calmex Auto Const Mandatory

ObjectReference Property DLC04MarketRadioEnableMarker Auto Const Mandatory

ObjectReference Property DLC04AlleyRadioEnableMarker Auto Const Mandatory

ObjectReference Property DLC04RadioDoctorEnableMarkerRef Auto Const Mandatory

ObjectReference Property DLC04RadioPondEnableMarkerRef Auto Const Mandatory

Armor Property DLC04_ShockCollar Auto Const Mandatory

ReferenceAlias Property Alias_Harvey Auto Const Mandatory

ReferenceAlias Property Alias_HubologistMapMarker Auto Const Mandatory

Potion Property DLC04_MeatBloodworm Auto Const Mandatory

ReferenceAlias Property Alias_GrandchesterMapMarker Auto Const Mandatory

GlobalVariable Property DLC04MaddoxSellsCalmexSilk Auto Const Mandatory

ObjectReference Property DLC04HubDiscipleDisableMarker Auto Const Mandatory

ObjectReference Property DLC04HubOperatorsDisableMarker Auto Const Mandatory

ObjectReference Property DLC04HubPackDisableMarker Auto Const Mandatory

Quest Property DLC04SettlementSS1 Auto Const Mandatory

Quest Property DLC04SettlementSS2 Auto Const Mandatory

Quest Property DLC04SettlementSS3 Auto Const Mandatory

Quest Property DLC04SettlementSS4 Auto Const Mandatory

Quest Property DLC04SettlementSS5 Auto Const Mandatory

Scene Property DLC04MS01_OpeningScene Auto Const Mandatory

Faction Property DLC04HubRaiderFaction Auto Const Mandatory

Faction Property DLC04SettlementTraderFaction Auto Const Mandatory

Faction Property DLC04SettlementVisitorFaction Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

ReferenceAlias Property Alias_DLC04MS02Cleansed Auto Const Mandatory

ReferenceAlias Property Alias_DLC04MS02Dara Auto Const Mandatory
