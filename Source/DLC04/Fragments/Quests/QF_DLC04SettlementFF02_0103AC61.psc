;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04SettlementFF02_0103AC61 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
if !GetStageDone(110)
  SetObjectiveDisplayed(10)
endif

if !GetStageDone(120)
  SetObjectiveDisplayed(20)
endif

if !GetStageDone(130)
  SetObjectiveDisplayed(30)
endif

if !GetStageDone(140)
  SetObjectiveDisplayed(40)
endif

if !GetStageDone(150)
  SetObjectiveDisplayed(50)
endif

if !GetStageDone(160)
  SetObjectiveDisplayed(60)
endif

if !GetStageDone(170)
  SetObjectiveDisplayed(70)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04SettlementFF02Script
Quest __temp = self as Quest
DLC04:DLC04SettlementFF02Script kmyQuest = __temp as DLC04:DLC04SettlementFF02Script
;END AUTOCAST
;BEGIN CODE
; Set when the player activates the activator trigger around the dispenser at Vault-Tec: Stars

; Run the update medallion count function
kmyquest.UpdateMedallions(Alias_MedallionFerrisWheel, DLC04FF02_Dispenser_FerrisWheel_Ref)

; Update objectives
if IsObjectiveDisplayed(10)
   SetObjectiveCompleted(10)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04SettlementFF02Script
Quest __temp = self as Quest
DLC04:DLC04SettlementFF02Script kmyQuest = __temp as DLC04:DLC04SettlementFF02Script
;END AUTOCAST
;BEGIN CODE
; Set when the player activates the activator trigger around the dispenser at Vault-Tec: Stars

; Run the update medallion count function
kmyquest.UpdateMedallions(Alias_MedallionMineCart, DLC04FF02_Dispenser_MineCart_Ref)

; Update objectives
if IsObjectiveDisplayed(20)
   SetObjectiveCompleted(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04SettlementFF02Script
Quest __temp = self as Quest
DLC04:DLC04SettlementFF02Script kmyQuest = __temp as DLC04:DLC04SettlementFF02Script
;END AUTOCAST
;BEGIN CODE
; Set when the player activates the activator trigger around the dispenser at Vault-Tec: Stars

; Run the update medallion count function
kmyquest.UpdateMedallions(Alias_MedallionNukaGalaxy, DLC04FF02_Dispenser_NukaGalaxy_Ref)

; Update objectives
if IsObjectiveDisplayed(30)
   SetObjectiveCompleted(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04SettlementFF02Script
Quest __temp = self as Quest
DLC04:DLC04SettlementFF02Script kmyQuest = __temp as DLC04:DLC04SettlementFF02Script
;END AUTOCAST
;BEGIN CODE
; Set when the player activates the activator trigger around the dispenser at Vault-Tec: Stars

; Run the update medallion count function
kmyquest.UpdateMedallions(Alias_MedallionNukaRacers, DLC04FF02_Dispenser_NukaRacers_Ref)

; Update objectives
if IsObjectiveDisplayed(50)
   SetObjectiveCompleted(50)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04SettlementFF02Script
Quest __temp = self as Quest
DLC04:DLC04SettlementFF02Script kmyQuest = __temp as DLC04:DLC04SettlementFF02Script
;END AUTOCAST
;BEGIN CODE
; Set when the player activates the activator trigger around the dispenser at Vault-Tec: Stars

; Run the update medallion count function
kmyquest.UpdateMedallions(Alias_MedallionTreehouse, DLC04FF02_Dispenser_Treehouse_Ref)

; Update objectives
if IsObjectiveDisplayed(40)
   SetObjectiveCompleted(40)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04SettlementFF02Script
Quest __temp = self as Quest
DLC04:DLC04SettlementFF02Script kmyQuest = __temp as DLC04:DLC04SettlementFF02Script
;END AUTOCAST
;BEGIN CODE
; Set when the player activates the activator trigger around the dispenser at Vault-Tec: Stars

; Run the update medallion count function
kmyquest.UpdateMedallions(Alias_MedallionVaultTec, DLC04FF02_Dispenser_VaultTec_Ref)

; Update objectives
if IsObjectiveDisplayed(60)
   SetObjectiveCompleted(60)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04SettlementFF02Script
Quest __temp = self as Quest
DLC04:DLC04SettlementFF02Script kmyQuest = __temp as DLC04:DLC04SettlementFF02Script
;END AUTOCAST
;BEGIN CODE
; Set when the player activates the activator trigger around the dispenser at World of Refreshment

; Run the update medallion count function
kmyquest.UpdateMedallions(Alias_MedallionWorldOfRefreshment, DLC04FF02_Dispenser_WoR_Ref)

; Update objectives
if IsObjectiveDisplayed(70)
   SetObjectiveCompleted(70)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Used as a dialogue condition in NIRA's dialogue

SetObjectiveDisplayed(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Remove the park medallions from the player's inventory
Game.GetPlayer().RemoveItem(Alias_MedallionFerrisWheel.GetReference(),1)
Game.GetPlayer().RemoveItem(Alias_MedallionMineCart.GetReference(),1)
Game.GetPlayer().RemoveItem(Alias_MedallionNukaGalaxy.GetReference(),1)
Game.GetPlayer().RemoveItem(Alias_MedallionNukaRacers.GetReference(),1)
Game.GetPlayer().RemoveItem(Alias_MedallionTreehouse.GetReference(),1)
Game.GetPlayer().RemoveItem(Alias_MedallionVaultTec.GetReference(),1)
Game.GetPlayer().RemoveItem(Alias_MedallionWorldOfRefreshment.GetReference(),1)

; Give reward items
Game.GetPlayer().AddItem(DLC04_NukaCola_Dark,1)
Game.GetPlayer().AddItem(DLC04_NukaCola_Grape,1)
Game.GetPlayer().AddItem(NukaColaQuantum,1)

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC04_NUK001_ArenaManager Auto Const Mandatory

GlobalVariable Property DLC04FF01Global Auto Const Mandatory

GlobalVariable Property DLC04FF01GlobalRepeater Auto Const Mandatory

ReferenceAlias Property Alias_MedallionWorldofRefreshment Auto Const Mandatory

ReferenceAlias Property Alias_MedallionVaultTec Auto Const Mandatory

ObjectReference Property DLC04FF02_Dispenser_VaultTec_Ref Auto Const Mandatory

ReferenceAlias Property Alias_MedallionTreehouse Auto Const Mandatory

ObjectReference Property DLC04FF02_Dispenser_Treehouse_Ref Auto Const Mandatory

ObjectReference Property DLC04FF02_Dispenser_NukaRacers_Ref Auto Const Mandatory

ReferenceAlias Property Alias_MedallionNukaRacers Auto Const Mandatory

ObjectReference Property DLC04FF02_Dispenser_NukaGalaxy_Ref Auto Const Mandatory

ReferenceAlias Property Alias_MedallionNukaGalaxy Auto Const Mandatory

ObjectReference Property DLC04FF02_Dispenser_MineCart_Ref Auto Const Mandatory

ReferenceAlias Property Alias_MedallionMineCart Auto Const Mandatory

ReferenceAlias Property Alias_MedallionFerrisWheel Auto Const Mandatory

ObjectReference Property DLC04FF02_Dispenser_FerrisWheel_Ref Auto Const Mandatory

ObjectReference Property DLC04FF02_Dispenser_WoR_Ref Auto Const Mandatory

Potion Property DLC04_NukaCola_Dark Auto Const Mandatory

Potion Property DLC04_NukaCola_Grape Auto Const Mandatory

Potion Property NukaColaQuantum Auto Const Mandatory
