;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueRailroad_0005BC93 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE DialogueRailroadScript
Quest __temp = self as Quest
DialogueRailroadScript kmyQuest = __temp as DialogueRailroadScript
;END AUTOCAST
;BEGIN CODE
; register quest script for remote events:
kmyQuest.RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")

Utility.Wait(1.0) 

; Initialize quest
kmyQuest.InitializeQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
pRRM01.SetStage(800)
pRRR04.SetStage(400)
pPlayerBeenToInstitute.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN AUTOCAST TYPE DialogueRailroadScript
Quest __temp = self as Quest
DialogueRailroadScript kmyQuest = __temp as DialogueRailroadScript
;END AUTOCAST
;BEGIN CODE
; Initialize quest
kmyQuest.InitializeQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
; Player gets a minor perk
;Game.GetPlayer().AddPerk(pPRRInTheBloodPerk, TRUE)

; Damage the player
Actor aPlayer = Game.GetPlayer()
aPlayer.DamageValue(pHealth, aPlayer.GetValue(pHealth) / 1.1 )
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
; Set up global variables
pRailroadClothingArmor_ChanceNone.SetValue(0)
pRailroadClothingArmorModAvailable.SetValue(1)

; Temporarily add a bunch of clothing armor to Tinker Tom (will refresh on cell update)
pVendorRRTinkerTomREF.AddItem(pLL_Railroad_ClothingArmor, 7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
; Close off 1st and 2nd conversation
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
; Make it so Carrington offers a quest
pRRR09.SetStage(50)

; If Mercer Station isn't complete, then make that run, too
if ( pRRR04.GetStage() < 50 )
  pRRR04.SetStage(50)
elseif ( !pRRR10.IsRunning() && !pRRR11.IsRunning() )   ; If PAM doesn't already have post-game quests running
  pRRR10.SetStage(50)   ; Queue up Clean Equation
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0475_Item_00
Function Fragment_Stage_0475_Item_00()
;BEGIN CODE
; Close off the Burned Cover quest
pRRAct3Lost.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0480_Item_00
Function Fragment_Stage_0480_Item_00()
;BEGIN CODE
; Teleport home
Alias_Desdemona.GetActorRef().MoveTo(pDesdemonaHomeMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
; Play the scene where Deacon reacts to the Courser Chip
pDeaconReactsToCourserChip.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pRRM01 Auto Const

Quest Property pRRR04 Auto Const

GlobalVariable Property pPlayerBeenToInstitute Auto Const

Quest Property pRRAct3Lost Auto Const

Perk Property pPRRInTheBloodPerk Auto Const

ActorValue Property pHealth Auto Const

Scene Property pDeaconReactsToCourserChip Auto Const

GlobalVariable Property pRailroadClothingArmor_ChanceNone Auto Const

GlobalVariable Property pRailroadClothingArmorModAvailable Auto Const

LeveledItem Property pLL_Railroad_ClothingArmor Auto Const

ObjectReference Property pVendorRRTinkerTomREF Auto Const

Quest Property pRRR09 Auto Const

Quest Property pRRR10 Auto Const

Quest Property pRRR11 Auto Const

ObjectReference Property pDesdemonaHomeMarker Auto Const Mandatory

ReferenceAlias Property Alias_Desdemona Auto Const Mandatory
