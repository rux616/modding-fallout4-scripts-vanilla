Scriptname TestWeapAutoEquip extends ObjectReference

GlobalVariable property WeaponHasAutoEquipped auto

;when the player picks up the weapon, automatically equip the weapon and favorite it
Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	;Debug.Trace("**************" + self + "changed container!")
	
	if akNewContainer == Game.GetPlayer()		
		if WeaponHasAutoEquipped.GetValue() == 0
			;set the global so the autoequip only happens the first time
			WeaponHasAutoEquipped.SetValue(1)

			;autoequipping
			Game.GetPlayer().EquipItem(self.GetBaseObject())
			Game.GetPlayer().DrawWeapon()

			;favoriting
			Game.GetPlayer().MarkItemAsFavorite(self.GetBaseObject())
		endif
	endif
EndEvent