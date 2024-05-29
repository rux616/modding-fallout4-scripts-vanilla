;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04_AspirationalItems_0104E421 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Katelyn - Caravan Merchant
ObjectReference oVendor = Alias_CaravanVendor.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pDLC04_Aspiration_DiscipleBlade)
oItem.AttachMod(pDLC04_mod_melee_DisciplesBlade_Hatchet_Serrated)
oItem.AttachMod(pmod_Legendary_Weapon_Bleed)
oItem.AttachMod(pmod_Aspiration_Weapon_IncreasedCost_3000)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Aaron - Weapon Merchant
ObjectReference oVendor = Alias_WeaponVendor.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pDLC04_Aspiration_HandMadeGun)
oItem.AttachMod(DLC04_mod_HandmadeGun_Receiver_Automatic1_and_MoreDamage2)
oItem.AttachMod(DLC04_mod_HandmadeGun_Barrel_ShortCovered_Sniper)
oItem.AttachMod(DLC04_mod_HandmadeGun_Mag_QuickExtraLarge)
oItem.AttachMod(DLC04_mod_HandmadeGun_Scope_ScopeLong)
oItem.AttachMod(DLC04_mod_HandmadeGun_Muzzle_Suppressor)
oItem.AttachMod(mod_Legendary_Weapon_DamageConsecutiveHits)
oItem.AttachMod(pmod_Aspiration_Weapon_IncreasedCost_6000)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Shelby - Misc Merchant
ObjectReference oVendor = Alias_MiscVendor.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pDLC04_FragGrenadeSmart)
oItem.AttachMod(pDLC04_mod_Custom_FragGrenadeSmart_Description_00)
;Game.GetPlayer().AddItem(oItem) ; Move it into the vendor
oVendor.AddItem(oItem)

; Change out the mods
oItem = oVendor.PlaceAtMe(pDLC04_FragGrenadeSmart)
oItem.AttachMod(pDLC04_mod_Custom_FragGrenadeSmart_Description_00)
;Game.GetPlayer().AddItem(oItem) ; Move it into the vendor
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property pDLC04_Aspiration_DiscipleBlade Auto Const Mandatory

ObjectMod Property pDLC04_mod_melee_DisciplesBlade_Hatchet_Serrated Auto Const Mandatory

ReferenceAlias Property Alias_CaravanVendor Auto Const Mandatory

ObjectMod Property pmod_Legendary_Weapon_Bleed Auto Const Mandatory

ObjectMod Property pmod_Aspiration_Armor_IncreasedCostHeavyNotTorso Auto Const Mandatory

ObjectMod Property pmod_Aspiration_Weapon_IncreasedCost_6000 Auto Const Mandatory

ReferenceAlias Property Alias_WeaponVendor Auto Const Mandatory

LeveledItem Property pDLC04_Aspiration_HandMadeGun Auto Const Mandatory

ObjectMod Property pmod_Aspiration_Weapon_IncreasedCost_3000 Auto Const Mandatory

ObjectMod Property DLC04_mod_HandmadeGun_Receiver_Automatic1_and_MoreDamage2 Auto Const Mandatory

ObjectMod Property DLC04_mod_HandmadeGun_Barrel_ShortCovered_Sniper Auto Const Mandatory

ObjectMod Property DLC04_mod_HandmadeGun_Mag_QuickExtraLarge Auto Const Mandatory

ObjectMod Property DLC04_mod_HandmadeGun_Scope_ScopeLong Auto Const Mandatory

ObjectMod Property DLC04_mod_HandmadeGun_Muzzle_Suppressor Auto Const Mandatory

ObjectMod Property mod_Legendary_Weapon_DamageConsecutiveHits Auto Const Mandatory

Weapon Property pDLC04_FragGrenadeSmart Auto Const Mandatory

ObjectMod Property pDLC04_mod_Custom_FragGrenadeSmart_Description_00 Auto Const Mandatory

ReferenceAlias Property Alias_MiscVendor Auto Const Mandatory
