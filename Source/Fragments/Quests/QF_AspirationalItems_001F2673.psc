;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_AspirationalItems_001F2673 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; Put stuff in Caravan vendors chest
SetStage(700)
SetStage(710)
SetStage(720)
SetStage(1000)
SetStage(1010)
SetStage(1020)
SetStage(1030);END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
SetStage(110)
SetStage(210)
SetStage(220)
SetStage(310)
SetStage(320)
SetStage(430)
SetStage(440)
SetStage(450)
SetStage(510)
SetStage(610)
SetStage(710)
SetStage(720)
SetStage(810)
SetStage(820)
SetStage(910)
SetStage(1020)
SetStage(1030)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; RAILROAD HQ - Tinker Tom sells
ObjectReference oVendor = Alias_VendorRailroadTinkerTom.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Railroad_SniperRifle)
oItem.AttachMod(pmod_HuntingRifle_Receiver_MoreDamage2_and_BetterCriticals)
oItem.AttachMod(pmod_HuntingRifle_Scope_ScopeLong)
oItem.AttachMod(pmod_HuntingRifle_Barrel_Long)
oItem.AttachMod(pmod_HuntingRifle_Grip_Stock)
oItem.AttachMod(pmod_HuntingRifle_Muzzle_Suppressor)
oItem.AttachMod(pmod_Legendary_Weapon_AccuracyNotInCombat)
oItem.AttachMod(pmod_Aspiration_Weapon_IncreasedCost)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
; RAILROAD HQ - Tinker Tom sells
ObjectReference oVendor = Alias_VendorRailroadTinkerTom.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Armor_Railroad_Tuxedo)
oItem.AttachMod(pmod_Legendary_Armor_Luck)
oItem.AttachMod(pmod_Aspiration_Armor_IncreasedCost)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Queue up other aspirational items
SetStage(210)
SetStage(220)

; INSTITUTE sells
ObjectReference oVendor = Alias_VendorInstituteMisc.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Weapon_Institute_AutoPlasmaGun)
oItem.AttachMod(pmod_PlasmaGun_PlasmaReceiver_MoreDamage1_and_BetterCriticals2)
oItem.AttachMod(pmod_PlasmaGun_BarrelPlasma_Spin_B)
oItem.AttachMod(pmod_PlasmaGun_Grip_Stock)
oItem.AttachMod(pmod_Legendary_Weapon_Speed)
oItem.AttachMod(pmod_Aspiration_Weapon_IncreasedCost)

; IS THIS NEEDED?
; Attach this to the reference alias
;Alias_TinkerTomSpecial.ForceRefTo(oItem)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
; INSTITUTE sells
ObjectReference oVendor = Alias_VendorInstituteMisc.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Armor_Institute_SynthTorso)
oItem.AttachMod(pmod_armor_Synth_Arm_Material_4)
oItem.AttachMod(pmod_armor_Synth_Lining_Torso_Lighter2)
oItem.AttachMod(pmod_Legendary_Armor_Chameleon)
oItem.AttachMod(pmod_Aspiration_Armor_IncreasedCost)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
; INSTITUTE sells
ObjectReference oVendor = Alias_VendorInstituteMisc.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Armor_Institute_SynthHelmet)
oItem.AttachMod(pmod_armor_Synth_Helmet_Material_4)
oItem.AttachMod(pmod_Legendary_Armor_Agility_and_Perception)
oItem.AttachMod(pmod_Aspiration_Armor_IncreasedCost)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Queue up other aspirational items
SetStage(310)
SetStage(320)

; GOODNEIGHBOR Kleo sells
ObjectReference oVendor = Alias_VendorGoodneighborKleo.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Weapon_Goodneighbor_MissileLauncher)
oItem.AttachMod(pmod_MissileLauncher_Scope_ScopeLong_NV)
oItem.AttachMod(pmod_MissileLauncher_TubeMuzzle_Stabilizer)
oItem.AttachMod(pmod_Legendary_Weapon_DamageVsHumans)
oItem.AttachMod(pmod_Aspiration_Weapon_IncreasedCost)

; IS THIS NEEDED?
; Attach this to the reference alias
;Alias_TinkerTomSpecial.ForceRefTo(oItem)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
; GOODNEIGHBOR Daisy sells
ObjectReference oVendor = Alias_VendorGoodneighborDaisy.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Armor_Goodneighbor_CombatTorso)
oItem.AttachMod(pmod_armor_Combat_Torso_Material_1)
oItem.AttachMod(pmod_armor_Combat_Lining_Torso_ImprovedCarryCapacity)
oItem.AttachMod(pmod_Legendary_Armor_LessDMGHumans)
oItem.AttachMod(pmod_Aspiration_Armor_IncreasedCost)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
; GOODNEIGHBOR Daisy sells
ObjectReference oVendor = Alias_VendorGoodneighborDaisy.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Armor_Goodneighbor_CombatLeftLeg)
oItem.AttachMod(pmod_armor_Combat_Leg_Material_1)
oItem.AttachMod(pmod_armor_Combat_Lining_LimbLeg_ReducedSprint)
oItem.AttachMod(pmod_Legendary_Armor_Speed)
oItem.AttachMod(pmod_Aspiration_Armor_IncreasedCost)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Queue up other DC aspirational items
SetStage(405)
SetStage(410)
SetStage(420)
SetStage(450)

; DC Arturo sells
ObjectReference oVendor = Alias_VendorDCCommonwealthWeaponry.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Weapon_DC_Lasergun)
oItem.AttachMod(pmod_LaserGun_LaserReceiver_BetterCriticals2)
oItem.AttachMod(pmod_LaserGun_BarrelLaser_Short_B)
oItem.AttachMod(pmod_Legendary_Weapon_DamageFirstBlood)
oItem.AttachMod(pmod_Aspiration_Weapon_IncreasedCost)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0405_Item_00
Function Fragment_Stage_0405_Item_00()
;BEGIN CODE
; DC Arturo sells
ObjectReference oVendor = Alias_VendorDCCommonwealthWeaponry.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pLL_PipeGun)
oItem.AttachMod(pmod_PipeGun_Muzzle_Suppressor)
;oItem.AttachMod(pmod_PipeRevolver_Receiver_MoreDamage1)
;oItem.AttachMod(pmod_PipeRevolver_Barrel_LightShort)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
; DC Moe sells
ObjectReference oVendor = Alias_VendorDCSwatters.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Weapon_DC_Bat)
oItem.AttachMod(pmod_melee_BaseballBat_Spikes)
oItem.AttachMod(pmod_Legendary_Weapon_VATSMelee)
oItem.AttachMod(pmod_Aspiration_Weapon_IncreasedCost)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
; DC Arturo sells
ObjectReference oVendor = Alias_VendorDCCommonwealthWeaponry.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Weapon_DC_Fatman)
;oItem.AttachMod(pmod_Legendary_Weapon_Damage)
oItem.AttachMod(pmod_Legendary_Weapon_TwoShot)
oItem.AttachMod(pmod_Aspiration_Weapon_IncreasedCostLesser)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
; Queue up other aspirational items
SetStage(440)

; DC Becky Fallon sells
ObjectReference oVendor = Alias_VendorDCFallon.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Armor_DC_MetalTorso)
oItem.AttachMod(pmod_armor_Metal_Torso_Material_4)
oItem.AttachMod(pmod_armor_Metal_Lining_Torso_Explosion2)
oItem.AttachMod(pmod_Legendary_Armor_LessDMGRobots)
oItem.AttachMod(pmod_Aspiration_Armor_IncreasedCost)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0440_Item_00
Function Fragment_Stage_0440_Item_00()
;BEGIN CODE
; DC Becky Fallon sells
ObjectReference oVendor = Alias_VendorDCFallon.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Armor_DC_MetalRightArm)
oItem.AttachMod(pmod_armor_Metal_Arm_Material_4)
oItem.AttachMod(pmod_armor_Metal_Lining_Limb_ResistanceLimbDamage)
oItem.AttachMod(pmod_Legendary_Armor_Agility_and_Perception)
oItem.AttachMod(pmod_Aspiration_Armor_IncreasedCost)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
; DC Becky Fallon sells
ObjectReference oVendor = Alias_VendorDCSurplus.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Armor_DC_LeatherTorso)
oItem.AttachMod(pmod_armor_Leather_Torso_Material_4)
oItem.AttachMod(pmod_armor_Leather_Lining_Torso_Mesh_BioComm)
oItem.AttachMod(pmod_Legendary_Armor_Agility_and_Perception)
oItem.AttachMod(pmod_Aspiration_Armor_IncreasedCost)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Queue up other aspirational items
SetStage(510)

; COVENANT Penny sells
ObjectReference oVendor = Alias_VendorCovenantPenny.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Weapon_Covenant_Shotgun)
oItem.AttachMod(pmod_CombatShotgun_Receiver_MoreDamage2)
oItem.AttachMod(pmod_CombatShotgun_GripShotgun_StockMarksmans)
oItem.AttachMod(pmod_CombatShotgun_Muzzle_Compensator)
oItem.AttachMod(pmod_Legendary_Weapon_ChanceToStagger)
oItem.AttachMod(pmod_Aspiration_Weapon_IncreasedCost)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
; COVENANT Penny sells
ObjectReference oVendor = Alias_VendorCovenantPenny.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Armor_Covenant_CombatHelmet)
oItem.AttachMod(pmod_armor_Combat_Helmet_Material_1)
oItem.AttachMod(pmod_Legendary_Armor_Charisma_and_Intelligence)
oItem.AttachMod(pmod_Aspiration_Armor_IncreasedCost)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
; Queue up other aspirational items
SetStage(610)

; BUNKER HILL Deb sells
ObjectReference oVendor = Alias_VendorBunkerHillDeb.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Weapon_BunkerHill_10mm)
oItem.AttachMod(pmod_10mm_Receiver_MoreDamage2_and_BetterCriticals)
oItem.AttachMod(pmod_10mm_Grip_Better2)
oItem.AttachMod(pmod_10mm_Mag_Large)
oItem.AttachMod(pmod_10mm_Scope_ScopeTargeting)
oItem.AttachMod(pmod_Legendary_Weapon_DamageLimb)
oItem.AttachMod(pmod_Aspiration_Weapon_IncreasedCost)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
; BUNKER HILL Deb sells
ObjectReference oVendor = Alias_VendorBunkerHillDeb.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Armor_BunkerHill_CombatLeftArm)
oItem.AttachMod(pmod_armor_Combat_Arm_Material_1)
oItem.AttachMod(pmod_armor_Combat_Lining_LimbArm_BetterBlocking)
oItem.AttachMod(pmod_Legendary_Armor_LessDamageBlockSprint)
oItem.AttachMod(pmod_Aspiration_Armor_IncreasedCost)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
; CARAVAN Cricket sells
ObjectReference oVendor = Alias_VendorCaravanCricket.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Weapon_Caravan_SMG)
oItem.AttachMod(pmod_SubmachineGun_Receiver_Automatic1_and_MoreDamage2)
oItem.AttachMod(pmod_SubmachineGun_Grip_StockRecoil)
oItem.AttachMod(pmod_SubmachineGun_Mag_LargeQuick)
oItem.AttachMod(pmod_SubmachineGun_Muzzle_Suppressor)
oItem.AttachMod(pmod_Legendary_Weapon_ExplosiveBullets)
oItem.AttachMod(pmod_Aspiration_Weapon_IncreasedCost)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
; CARAVAN Lucas Miller sells
ObjectReference oVendor = Alias_VendorCaravanLucas.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Armor_Caravan_MetalLeftArm)
oItem.AttachMod(pmod_armor_Metal_Arm_Material_4)
oItem.AttachMod(pmod_armor_Metal_Lining_Limb_ResistanceLimbDamage)
oItem.AttachMod(pmod_Legendary_Armor_Strength_and_Endurance)
oItem.AttachMod(pmod_Aspiration_Armor_IncreasedCost)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN CODE
; CARAVAN Lucas Miller sells
ObjectReference oVendor = Alias_VendorCaravanLucas.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Armor_Caravan_LeatherRightLeg)
oItem.AttachMod(pmod_armor_Leather_Leg_Material_4)
oItem.AttachMod(pmod_armor_Leather_Lining_Limb_ResistanceRadiation)
oItem.AttachMod(pmod_Legendary_Armor_LessDMGSuperMutants)
oItem.AttachMod(pmod_Aspiration_Armor_IncreasedCost)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
; Queue up other aspirational items
SetStage(810)
SetStage(820)

;/
; BROTHERHOOD Teagan sells
ObjectReference oVendor = Alias_VendorBoSTeagan.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Weapon_BoS_PlasmaGun)
oItem.AttachMod(pmod_PlasmaGun_PlasmaReceiver_MoreDamage_2)
oItem.AttachMod(pmod_PlasmaGun_BarrelPlasma_Sniper_B)
oItem.AttachMod(pmod_PlasmaGun_Scope_ScopeLong)
oItem.AttachMod(pmod_Legendary_Weapon_DamageVsSupermutants)
oItem.AttachMod(pmod_Aspiration_Weapon_IncreasedCost)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
/;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
; BROTHERHOOD Teagan sells
ObjectReference oVendor = Alias_VendorBoSTeagan.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Armor_BoS_ShadowHelmet)
oItem.AttachMod(pmod_armor_Combat_Helmet_Material_3)
oItem.AttachMod(pmod_Legendary_Armor_APCost)
oItem.AttachMod(pmod_Aspiration_Armor_IncreasedCost)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN CODE
; BROTHERHOOD Teagan sells
ObjectReference oVendor = Alias_VendorBoSTeagan.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Armor_BoS_ShadowTorso)
oItem.AttachMod(pmod_armor_Combat_Torso_Material_3)
oItem.AttachMod(pmod_armor_Combat_Lining_Torso_ResistanceRadiation)
oItem.AttachMod(pmod_Legendary_Armor_APRegen)
oItem.AttachMod(pmod_Aspiration_Armor_IncreasedCost)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
; Queue up other aspirational items
SetStage(910)

; V81 Alexis Combes sells
ObjectReference oVendor = Alias_VendorV81Alexis.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Weapon_V81_CombatRifle)
oItem.AttachMod(pmod_CombatRifle_Receiver_Automatic1_and_ArmorPiercing)
oItem.AttachMod(pmod_CombatRifle_Grip_StockRecoil)
oItem.AttachMod(pmod_CombatRifle_Scope_ScopeShort_NV)
oItem.AttachMod(pmod_Legendary_Weapon_TwoShot)
oItem.AttachMod(pmod_Aspiration_Weapon_IncreasedCost)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0910_Item_00
Function Fragment_Stage_0910_Item_00()
;BEGIN CODE
; V81 Alexis Combes sells
ObjectReference oVendor = Alias_VendorV81Alexis.GetRef()

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Armor_V81_CombatRightLeg)
oItem.AttachMod(pmod_armor_Combat_Leg_Material_1)
oItem.AttachMod(pmod_armor_Combat_Lining_Limb_ResistanceLimbDamage)
oItem.AttachMod(pmod_Legendary_Armor_Speed)
oItem.AttachMod(pmod_Aspiration_Armor_IncreasedCost)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
; WORKSHOP sells
ObjectReference oVendor = pWorkshopVendorChestWeaponRonnieShawNoRespawn

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Weapon_Work_GaussRifle)
oItem.AttachMod(pmod_GaussRifle_GaussBarrel_Long_and_MoreDamage1)
oItem.AttachMod(pmod_GaussRifle_GaussMag_ExtraLarge_and_MoreDamage2)
oItem.AttachMod(pmod_GaussRifle_Scope_ScopeLong_NV)
oItem.AttachMod(pmod_GaussRifle_Muzzle_Compensator)
oItem.AttachMod(pmod_Legendary_Weapon_DamageLimb)
oItem.AttachMod(pmod_Aspiration_Weapon_IncreasedCost)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1010_Item_00
Function Fragment_Stage_1010_Item_00()
;BEGIN CODE
; WORKSHOP sells
ObjectReference oVendor = pWorkshopVendorChestWeapon05NoRespawn

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Weapon_Work_Ripper)
oItem.AttachMod(pmod_Legendary_Weapon_LessDamageStandStill)
oItem.AttachMod(pmod_Aspiration_Weapon_IncreasedCost)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1020_Item_00
Function Fragment_Stage_1020_Item_00()
;BEGIN CODE
; WORKSHOP sells
ObjectReference oVendor = pWorkshopVendorChestArmor05NoRespawn

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Armor_Work_MetalTorso)
oItem.AttachMod(pmod_armor_Metal_Torso_Material_4)
oItem.AttachMod(pmod_armor_Metal_Lining_Torso_FlameResistance)
oItem.AttachMod(pmod_Legendary_Armor_LowHealthSlowTime)
oItem.AttachMod(pmod_Aspiration_Armor_IncreasedCostMedium)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1030_Item_00
Function Fragment_Stage_1030_Item_00()
;BEGIN CODE
; WORKSHOP sells
ObjectReference oVendor= pWorkshopVendorChestMisc05NoRespawn

; Change out the mods
ObjectReference oItem = oVendor.PlaceAtMe(pAspiration_Armor_Work_MetalLeftLeg)
oItem.AttachMod(pmod_armor_Metal_Leg_Material_4)
oItem.AttachMod(pmod_armor_Metal_Lining_Limb_ResistanceRadiation)
oItem.AttachMod(pmod_Legendary_Armor_ResistancesInverseHealth)
oItem.AttachMod(pmod_Aspiration_Armor_IncreasedCostMediumNotTorso)

; Move it into the vendor
;Game.GetPlayer().AddItem(oItem)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectMod Property pmod_HuntingRifle_Receiver_MoreDamage2_and_BetterCriticals Auto Const
ObjectMod Property pmod_HuntingRifle_Scope_ScopeLong Auto Const

ReferenceAlias Property Alias_VendorRailroadTinkerTom Auto Const

LeveledItem Property pAspiration_Railroad_SniperRifle Auto Const

ReferenceAlias Property Alias_TinkerTomSpecial Auto Const

ObjectMod Property pmod_Aspiration_Weapon_IncreasedCost Auto Const

ObjectMod Property pmod_Legendary_Weapon_AccuracyNotInCombat Auto Const

LeveledItem Property pAspiration_Weapon_Institute_AutoPlasmaGun Auto Const

ObjectMod Property pmod_Legendary_Weapon_Speed Auto Const

ObjectMod Property pmod_PlasmaGun_PlasmaReceiver_MoreDamage1_and_BetterCriticals2 Auto Const

ObjectMod Property pmod_PlasmaGun_BarrelPlasma_Spin_B Auto Const

ObjectMod Property pmod_PlasmaGun_Grip_Stock Auto Const

ObjectMod Property pmod_HuntingRifle_Barrel_Long Auto Const

ObjectMod Property pmod_HuntingRifle_Grip_Stock Auto Const

ObjectMod Property pmod_HuntingRifle_Muzzle_Suppressor Auto Const

ObjectMod Property pmod_Legendary_Weapon_DamageVsHumans Auto Const

LeveledItem Property pAspiration_Weapon_Goodneighbor_MissileLauncher Auto Const

ObjectMod Property pmod_MissileLauncher_Scope_ScopeLong_NV Auto Const

ObjectMod Property pmod_MissileLauncher_TubeMuzzle_Stabilizer Auto Const

ReferenceAlias Property Alias_VendorGoodneighborKleo Auto Const

ObjectReference Property pVendorAspirationInstitute Auto Const

ReferenceAlias Property Alias_VendorInstituteMisc Auto Const

ReferenceAlias Property Alias_VendorDCCommonwealthWeaponry Auto Const

LeveledItem Property pAspiration_Weapon_DC_Lasergun Auto Const

ObjectMod Property pmod_Legendary_Weapon_DamageFirstBlood Auto Const

ObjectMod Property pmod_LaserGun_LaserReceiver_BetterCriticals2 Auto Const

ObjectMod Property pmod_LaserGun_BarrelLaser_Short_B Auto Const

ReferenceAlias Property Alias_VendorDCSwatters Auto Const

LeveledItem Property pAspiration_Weapon_DC_Bat Auto Const

ObjectMod Property pmod_Legendary_Weapon_VATSMelee Auto Const

ObjectMod Property pmod_melee_BaseballBat_Spikes Auto Const

ReferenceAlias Property Alias_VendorCovenantPenny Auto Const

ObjectMod Property pmod_Legendary_Weapon_ChanceToStagger Auto Const

LeveledItem Property pAspiration_Weapon_Covenant_Shotgun Auto Const

ObjectMod Property pmod_CombatShotgun_Receiver_MoreDamage2 Auto Const

ObjectMod Property pmod_CombatShotgun_GripShotgun_StockMarksmans Auto Const

ObjectMod Property pmod_CombatShotgun_Muzzle_Compensator Auto Const

ReferenceAlias Property Alias_VendorBunkerHillDeb Auto Const

LeveledItem Property pAspiration_Weapon_BunkerHill_10mm Auto Const

ObjectMod Property pmod_10mm_Receiver_MoreDamage2_and_BetterCriticals Auto Const

ObjectMod Property pmod_10mm_Grip_Better2 Auto Const

ObjectMod Property pmod_10mm_Mag_Large Auto Const

ObjectMod Property pmod_10mm_Scope_ScopeTargeting Auto Const

ObjectMod Property pmod_Legendary_Weapon_DamageLimb Auto Const

ReferenceAlias Property Alias_VendorCaravanCricket Auto Const

LeveledItem Property pAspiration_Weapon_Caravan_SMG Auto Const

ObjectMod Property pmod_Legendary_Weapon_ExplosiveBullets Auto Const

ObjectMod Property pmod_SubmachineGun_Receiver_Automatic1_and_MoreDamage2 Auto Const

ObjectMod Property pmod_SubmachineGun_Grip_StockRecoil Auto Const

ObjectMod Property pmod_SubmachineGun_Mag_LargeQuick Auto Const

ObjectMod Property pmod_SubmachineGun_Muzzle_Suppressor Auto Const

ReferenceAlias Property Alias_VendorBoSTeagan Auto Const

LeveledItem Property pAspiration_Weapon_BoS_PlasmaGun Auto Const

ObjectMod Property pmod_Legendary_Weapon_DamageVsSupermutants Auto Const

ObjectMod Property pmod_PlasmaGun_PlasmaReceiver_MoreDamage_2 Auto Const

ObjectMod Property pmod_PlasmaGun_BarrelPlasma_Sniper_B Auto Const

ObjectMod Property pmod_PlasmaGun_Scope_ScopeLong Auto Const

ReferenceAlias Property Alias_VendorV81Alexis Auto Const

LeveledItem Property pAspiration_Weapon_V81_CombatRifle Auto Const

ObjectMod Property pmod_Legendary_Weapon_TwoShot Auto Const

ObjectMod Property pmod_CombatRifle_Receiver_Automatic1_and_ArmorPiercing Auto Const

ObjectMod Property pmod_CombatRifle_Grip_StockRecoil Auto Const

ObjectMod Property pmod_CombatRifle_Scope_ScopeShort_NV Auto Const

LeveledItem Property pAspiration_Weapon_DC_Fatman Auto Const

ObjectMod Property pmod_Legendary_Weapon_Damage Auto Const

ReferenceAlias Property Alias_VendorDCFallon Auto Const

LeveledItem Property pAspiration_Armor_DC_MetalTorso Auto Const

ObjectMod Property pmod_Legendary_Armor_LessDMGRobots Auto Const

ObjectMod Property pmod_armor_Metal_Leg_Material_4 Auto Const

ObjectMod Property pmod_armor_Metal_Torso_Material_4 Auto Const

LeveledItem Property pAspiration_Armor_DC_MetalRightArm Auto Const

ObjectMod Property pmod_Legendary_Armor_Agility_and_Perception Auto Const

ObjectMod Property pmod_armor_Metal_Arm_Material_4 Auto Const

ObjectMod Property pmod_armor_Metal_Lining_Limb_ResistanceLimbDamage Auto Const

LeveledItem Property pAspiration_Armor_DC_LeatherTorso Auto Const

ReferenceAlias Property Alias_VendorDCSurplus Auto Const

ObjectMod Property pmod_Legendary_Armor_LowHealthSlowTime Auto Const

ObjectMod Property pmod_armor_Leather_Torso_Material_4 Auto Const

ObjectMod Property pmod_Aspiration_Weapon_IncreasedCostLesser Auto Const

ReferenceAlias Property Alias_VendorCaravanLucas Auto Const

LeveledItem Property pAspiration_Armor_Caravan_MetalLeftArm Auto Const

ObjectMod Property pmod_Legendary_Armor_Strength_and_Endurance Auto Const

LeveledItem Property pAspiration_Armor_Caravan_LeatherRightLeg Auto Const

ObjectMod Property pmod_Legendary_Armor_LessDMGSuperMutants Auto Const

ObjectMod Property pmod_armor_Leather_Leg_Material_4 Auto Const

ObjectMod Property pmod_armor_Leather_Lining_Limb_ResistanceRadiation Auto Const

ObjectMod Property pmod_Aspiration_Armor_IncreasedCost Auto Const

LeveledItem Property pAspiration_Armor_Goodneighbor_CombatTorso Auto Const

ObjectMod Property pmod_Legendary_Armor_LessDMGHumans Auto Const

ObjectMod Property pmod_armor_Combat_Torso_Material_1 Auto Const

ObjectMod Property pmod_armor_Combat_Lining_Torso_ImprovedCarryCapacity Auto Const

LeveledItem Property pAspiration_Armor_Goodneighbor_CombatLeftLeg Auto Const

ObjectMod Property pmod_Legendary_Armor_Speed Auto Const

ObjectMod Property pmod_armor_Combat_Leg_Material_1 Auto Const

ReferenceAlias Property Alias_VendorGoodneighborDaisy Auto Const

LeveledItem Property pAspiration_Armor_Covenant_CombatHelmet Auto Const

ObjectMod Property pmod_Legendary_Armor_Charisma_and_Intelligence Auto Const

ObjectMod Property pmod_armor_Combat_Helmet_Material_1 Auto Const

LeveledItem Property pAspiration_Armor_BunkerHill_CombatLeftArm Auto Const

ObjectMod Property pmod_Legendary_Armor_LessDamageBlockSprint Auto Const

ObjectMod Property pmod_armor_Combat_Arm_Material_1 Auto Const

ObjectMod Property pmod_armor_Combat_Lining_LimbArm_BetterBlocking Auto Const

LeveledItem Property pAspiration_Armor_V81_CombatRightLeg Auto Const

ObjectMod Property pmod_armor_Combat_Lining_Limb_ResistanceLimbDamage Auto Const

LeveledItem Property pAspiration_Armor_Railroad_Tuxedo Auto Const

ObjectMod Property pmod_Legendary_Armor_Luck Auto Const

LeveledItem Property pAspiration_Armor_BoS_ShadowHelmet Auto Const

ObjectMod Property pmod_Legendary_Armor_APCost Auto Const

ObjectMod Property pmod_armor_Combat_Helmet_Material_3 Auto Const

LeveledItem Property pAspiration_Armor_BoS_ShadowTorso Auto Const

ObjectMod Property pmod_Legendary_Armor_APRegen Auto Const

ObjectMod Property pmod_armor_Combat_Torso_Material_3 Auto Const

ObjectMod Property pmod_armor_Combat_Lining_Torso_ResistanceRadiation Auto Const

LeveledItem Property pAspiration_Armor_Institute_SynthTorso Auto Const

ObjectMod Property pmod_Legendary_Armor_Chameleon Auto Const

ObjectMod Property pmod_armor_Synth_Arm_Material_4 Auto Const

LeveledItem Property pAspiration_Armor_Institute_SynthHelmet Auto Const

ObjectMod Property pmod_armor_Synth_Helmet_Material_4 Auto Const

LeveledItem Property pAspiration_Weapon_Work_GaussRifle Auto Const Mandatory

ObjectMod Property pmod_GaussRifle_GaussBarrel_Long_and_MoreDamage1 Auto Const Mandatory

ObjectMod Property pmod_GaussRifle_GaussMag_ExtraLarge_and_MoreDamage2 Auto Const Mandatory

ObjectMod Property pmod_GaussRifle_Scope_ScopeLong_NV Auto Const Mandatory

ObjectMod Property pmod_GaussRifle_Muzzle_Compensator Auto Const Mandatory

LeveledItem Property pAspiration_Weapon_Work_Ripper Auto Const Mandatory

ObjectMod Property pmod_Legendary_Weapon_LessDamageStandStill Auto Const Mandatory

LeveledItem Property pAspiration_Armor_Work_MetalTorso Auto Const Mandatory

ObjectMod Property pmod_Legendary_Armor_ResistancesInverseHealth Auto Const Mandatory

LeveledItem Property pAspiration_Armor_Work_MetalLeftLeg Auto Const Mandatory

ObjectMod Property pmod_armor_Metal_Lining_Limb_ResistanceRadiation Auto Const Mandatory

ObjectReference Property pWorkshopVendorChestArmor05NoRespawn Auto Const
ObjectReference Property pWorkshopVendorChestMisc05NoRespawn Auto Const
ObjectReference Property pWorkshopVendorChestWeapon05NoRespawn Auto Const
ObjectReference Property pWorkshopVendorChestWeaponRonnieShawNoRespawn Auto Const

LeveledItem Property pLL_PipeRevolver Auto Const Mandatory

ObjectMod Property pmod_PipeRevolver_Muzzle_Suppressor Auto Const Mandatory

ObjectMod Property pmod_PipeRevolver_Receiver_MoreDamage1 Auto Const Mandatory

ObjectMod Property pmod_PipeRevolver_Barrel_LightShort Auto Const Mandatory

ObjectMod Property pmod_armor_Synth_Lining_Torso_Lighter2 Auto Const Mandatory

ObjectMod Property pmod_armor_Combat_Lining_LimbLeg_ReducedSprint Auto Const Mandatory

ObjectMod Property pmod_armor_Metal_Lining_Torso_Explosion2 Auto Const Mandatory

ObjectMod Property pmod_armor_Leather_Lining_Torso_Mesh_BioComm Auto Const Mandatory

ObjectMod Property pmod_armor_Metal_Lining_Torso_FlameResistance Auto Const Mandatory

LeveledItem Property pLL_PipeGun Auto Const Mandatory

ObjectMod Property pmod_Aspiration_Armor_IncreasedCostMedium Auto Const Mandatory

ObjectMod Property pmod_Aspiration_Armor_IncreasedCostMediumNotTorso Auto Const Mandatory

LeveledItem Property pLL_PipeBoltAction Auto Const Mandatory

ConstructibleObject Property pco_mod_Pipe_Muzzle_Suppressor Auto Const Mandatory

ObjectMod Property pmod_PipeGun_Muzzle_Suppressor Auto Const Mandatory
