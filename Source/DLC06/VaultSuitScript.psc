Scriptname DLC06:VaultSuitScript extends ObjectReference Const

Armor property RequiredEquippedArmor auto const mandatory 
DLC06:DLC06WorkshopParent property DLC06WorkshopParent auto const mandatory 

Event OnEquipped(Actor akActor)
	if akActor is WorkshopNPCScript
		if akActor.IsEquipped(RequiredEquippedArmor)
			DLC06WorkshopParent.AddVaultSuitAchievement()
		endif
	endif
EndEvent