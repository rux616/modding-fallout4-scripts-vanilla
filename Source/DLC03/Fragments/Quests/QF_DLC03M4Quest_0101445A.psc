;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03M4Quest_0101445A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Change out the mods
ObjectReference oItem = pDLC03KyeWeaponMarker.PlaceAtMe(pDLC03_LL_M4_Weapon)
oItem.AttachMod(pmod_CombatRifle_Scope_SightReflexDot)
oItem.AttachMod(pmod_CombatRifle_Barrel_PortedShort)
oItem.AttachMod(pmod_CombatRifle_Grip_StockMarksmans)
oItem.AttachMod(pDLC03_mod_Legendary_Weapon_M4)

Alias_DecemberChild.ForceRefTo(oItem)   ; Force into a reference so it's persistent
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property pDLC03_LL_M4_Weapon Auto Const Mandatory

ObjectReference Property pDLC03KyeWeaponMarker Auto Const Mandatory

ObjectMod Property pDLC03_mod_Legendary_Weapon_M4 Auto Const Mandatory

ObjectMod Property pmod_CombatRifle_Scope_SightReflexDot Auto Const Mandatory

ObjectMod Property pmod_CombatRifle_Barrel_PortedShort Auto Const Mandatory

ObjectMod Property pmod_CombatRifle_Grip_StockMarksmans Auto Const Mandatory

ReferenceAlias Property Alias_DecemberChild Auto Const Mandatory
