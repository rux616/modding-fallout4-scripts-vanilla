;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03FarHarborFF03c_0102039A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; If "Changing Tide" is running - update it
if ( pDLC03FarHarborM03.IsRunning() )
  pDLC03FarHarborM03.SetStage(600)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03FarHarborFF03cScript
Quest __temp = self as Quest
DLC03:DLC03FarHarborFF03cScript kmyQuest = __temp as DLC03:DLC03FarHarborFF03cScript
;END AUTOCAST
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(100)

; Make it so you can now loot the quest item of Carapaces
pDLC03CanLootMirelurkCarapace.SetValue(0)

; End the pointer
pDLC03FarHarborFF03c_Misc.SetStage(100)

; If "Changing Tide" is running - update it
if ( pDLC03FarHarborM03.IsRunning() )
  pDLC03FarHarborM03.SetStage(650)
endif

; Make sure Mirelurks exist to be killed
Alias_Mirelurks.ResetAll()

SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
; Add Haddock Cove to the map
Alias_MapMarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Update the global tracking number - and refresh the objective display
UpdateCurrentInstanceGlobal(pDLC03_FH_FF03cCarapaceCounter)
SetObjectiveDisplayed(100, TRUE)

; Objectives
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03FarHarborFF03cScript
Quest __temp = self as Quest
DLC03:DLC03FarHarborFF03cScript kmyQuest = __temp as DLC03:DLC03FarHarborFF03cScript
;END AUTOCAST
;BEGIN CODE
; Stop tracking the carapaces
kmyQuest.NoLongerTrackCarapaces()

; Rite of Passage is now available
pDLC03FarHarborM01.SetStage(50)

; If "Changing Tide" is running - update it
if ( pDLC03FarHarborM03.IsRunning() )
  pDLC03FarHarborM03.SetStage(675)
endif

; Spawn the reward item
pDLC03_CustomItemQuest.SetStage(20)
;Game.GetPlayer().AddItem(Alias_DefenderHarpoonGun.GetRef())

; Take away the Mirelurk Carapaces
Game.GetPlayer().RemoveItem(pDLC03FH_FF03bMirelurkCarapace, 3)

Game.GivePlayerCaps(615)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
; Toggle the last of the defenses
pLevel3.Enable()

; Queue up the Great Hunt
pDLC03FarHarborS03.SetStage(50)

;End the quest
SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8990_Item_00
Function Fragment_Stage_8990_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03FarHarborFF03cScript
Quest __temp = self as Quest
DLC03:DLC03FarHarborFF03cScript kmyQuest = __temp as DLC03:DLC03FarHarborFF03cScript
;END AUTOCAST
;BEGIN CODE
; Stop tracking the carapaces
kmyQuest.NoLongerTrackCarapaces()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property pDLC03CanLootMirelurkCarapace Auto Const Mandatory

GlobalVariable Property pDLC03_FH_FF03cCarapaceCounter Auto Const Mandatory

ObjectReference Property pLevel3 Auto Const Mandatory

Quest Property PDLC03FarHarborFF03c_Misc Auto Const Mandatory

Quest Property pDLC03FarHarborS03 Auto Const Mandatory

Quest Property pDLC03FarHarborM01 Auto Const Mandatory

RefCollectionAlias Property Alias_Mirelurks Auto Const Mandatory

Quest Property pDLC03FarHarborM03 Auto Const Mandatory

Quest Property pDLC03_CustomItemQuest Auto Const Mandatory

ReferenceAlias Property Alias_DefenderHarpoonGun Auto Const Mandatory

MiscObject Property pDLC03FH_FF03bMirelurkCarapace Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory
