;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS04PostQuest_000DEC92 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE MS04PostQuestScript
Quest __temp = self as Quest
MS04PostQuestScript kmyQuest = __temp as MS04PostQuestScript
;END AUTOCAST
;BEGIN CODE
; Initialize the quest
kmyQuest.InitializeQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE MS04PostQuestScript
Quest __temp = self as Quest
MS04PostQuestScript kmyQuest = __temp as MS04PostQuestScript
;END AUTOCAST
;BEGIN CODE
; register quest script for remote events:
kmyQuest.RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
; Remove old armor - get new armor
Game.GetPlayer().RemoveItem(pMS04_SilverShroudArmor_15)

; Get the new and improved Silver Shroud Armor
ObjectReference oShroudCostume = Game.GetPlayer().PlaceAtMe(pMS04ShroudArmorLL)
oShroudCostume.AttachMod(pmod_Legendary_Armor_LessDMGHumans)
Game.GetPlayer().AddItem(oShroudCostume)

pMS04ArmorLevel.SetValue(35)    ; This is the next level an upgrade is available at

; Turn off the Radio Transmitter (for now)
pMS04ShroudRadioTransmitter.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
; Remove old armor - get new armor
Game.GetPlayer().RemoveItem(pMS04_SilverShroudArmor_15)
Game.GetPlayer().RemoveItem(pMS04_SilverShroudArmor_25)

; Get the new and improved Silver Shroud Armor
ObjectReference oShroudCostume = Game.GetPlayer().PlaceAtMe(pMS04ShroudArmorLL)
oShroudCostume.AttachMod(pmod_Legendary_Armor_LessDMGHumans)
Game.GetPlayer().AddItem(oShroudCostume)

pMS04ArmorLevel.SetValue(45)    ; This is the next level an upgrade is available at

; Turn off the Radio Transmitter (for now)
pMS04ShroudRadioTransmitter.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN AUTOCAST TYPE MS04PostQuestScript
Quest __temp = self as Quest
MS04PostQuestScript kmyQuest = __temp as MS04PostQuestScript
;END AUTOCAST
;BEGIN CODE
; Remove old armor - get new armor
Game.GetPlayer().RemoveItem(pMS04_SilverShroudArmor_15)
Game.GetPlayer().RemoveItem(pMS04_SilverShroudArmor_25)
Game.GetPlayer().RemoveItem(pMS04_SilverShroudArmor_35)

; Get the new and improved Silver Shroud Armor
ObjectReference oShroudCostume = Game.GetPlayer().PlaceAtMe(pMS04ShroudArmorLL)
oShroudCostume.AttachMod(pmod_Legendary_Armor_LessDMGHumans)
Game.GetPlayer().AddItem(oShroudCostume)

pMS04ArmorLevel.SetValue(999)    ; Arbitary high number, no more upgrades

; Turn off the Radio Transmitter (for now)
pMS04ShroudRadioTransmitter.Disable()

; register quest script for remote events:
kmyQuest.UnregisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; The player gets a costume
Game.GetPlayer().AddItem(pMS04_SilverShroudCostume)

; Plus some $$$
Game.GivePlayerCaps(500)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Armor Property pMS04_SilverShroudCostume Auto Const

Armor Property pMS04_SilverShroudArmor_15 Auto Const

Armor Property pMS04_SilverShroudArmor_25 Auto Const

Armor Property pMS04_SilverShroudArmor_35 Auto Const

Armor Property pMS04_SilverShroudArmor_45 Auto Const

GlobalVariable Property pMS04ArmorLevel Auto Const

ObjectReference Property pMS04ShroudRadioTransmitter Auto Const

ObjectMod Property pmod_Legendary_Armor_LessDMGHumans Auto Const Mandatory

LeveledItem Property pMS04ShroudArmorLL Auto Const Mandatory

ReferenceAlias Property Alias_KentConnolly Auto Const Mandatory
