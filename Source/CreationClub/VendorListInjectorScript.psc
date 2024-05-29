Scriptname CreationClub:VendorListInjectorScript extends Quest
{Places specified LeveledItem into vendor lists in such a way to guarantee 1 will always be available for sale by nearly all primary vendors without affecting any base game items.  Auto-fill these properties, then use the kmyQuest drop-down in your quest fragment to call back to the internal functions with your item, level, quantity.}

;rvogel 7/17/2017 -- These lists are the top-most lists used by vendor containers, and are the best place to put items to ensure they have a 100% chance of spawning, while not interfering with any base game spawn chances.

LeveledItem Property VL_Vendor_Armor Auto Const
LeveledItem Property VL_Vendor_Clothing Auto Const
LeveledItem Property VL_Vendor_General Auto Const
LeveledItem Property VL_Vendor_General_Drumlin Auto Const
LeveledItem Property VL_Vendor_Weapon Auto Const
LeveledItem Property LLC_DCShopArmor Auto Const
LeveledItem Property LLI_Armor_BoSCombatArmor_Vendor_Outfit Auto Const
LeveledItem Property LLC_WorkshopVendorArmor01 Auto Const
LeveledItem Property LLC_WorkshopVendorArmor02 Auto Const
LeveledItem Property LLC_WorkshopVendorArmor03 Auto Const
LeveledItem Property LL_Vendor_Weapon_GunSpecialty Auto Const
LeveledItem Property LL_Vendor_Weapon_GunBoS Auto Const

Function AddToVendorArmorLists(LeveledItem itemToAdd, int Level = 1, int Quantity = 1, Bool AddToBoS = True)

	;Shared Lists
	;Lucas Miller, Fallon's Basement, Rufus, Penny, Daisy, Trashcan Carla, DC Surplus, Atom Cats, Drumlin Diner, Opal, Tinker Tom
	
	VL_Vendor_Armor.AddForm(itemToAdd as Form, Level, Quantity)
	VL_Vendor_Clothing.AddForm(itemToAdd as Form, Level, Quantity)
	VL_Vendor_General.AddForm(itemToAdd as Form, Level, Quantity)
	VL_Vendor_General_Drumlin.AddForm(itemToAdd as Form, Level, Quantity)
	VL_Vendor_Weapon.AddForm(itemToAdd as Form, Level, Quantity)

	;Special Lists (these vendors don't use shared lists for wearables)
	;Arturo's Weapons in Diamond City, Proctor Teagan BoS aboard the Prydwen
	
	LLC_DCShopArmor.AddForm(itemToAdd as Form, Level, Quantity)
	
	If(AddToBoS)
		LLI_Armor_BoSCombatArmor_Vendor_Outfit.AddForm(itemToAdd as Form, Level, Quantity)
	EndIf

EndFunction

Function AddToVendorWeaponLists(LeveledItem itemToAdd, int Level = 1, int Quantity = 1, Bool AddToBoS = True)

		;Shared Lists
		;Arturo/Diamond City Weapons, Kill or Be Killed, Cricket, Tinker Tom, Eleanor, Workshop Vendor level 3 and 4
		
		VL_Vendor_Weapon.AddForm(itemToAdd as Form, Level, Quantity)		
		LL_Vendor_Weapon_GunSpecialty.AddForm(itemToAdd as Form, Level, Quantity)
		
		;Special Lists
		;Proctor Teagan
		
		If(AddToBoS)
			LL_Vendor_Weapon_GunBoS.AddForm(itemToAdd as Form, Level, Quantity)
		EndIf
		
EndFunction

