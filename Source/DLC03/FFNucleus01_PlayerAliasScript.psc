Scriptname DLC03:FFNucleus01_PlayerAliasScript extends ReferenceAlias Conditional

FormList Property DLC03_FFNucleus01_ChildrenofAtomClothes Auto Const Mandatory
{Used to know if the player has CoA robes equipped}

Quest Property DLC03CoA_FFNucleus01 Auto Const Mandatory
{FFNucleus01 quest. Used to check appropriate stages.}

Armor Property Clothes_RaiderMod_Hood1 Auto Const Mandatory
{Sack hood player needs to wear}

DLC03:DLC03CoA_FFNucleus01Script Property DLC03CoA_FFNucleus01Script Auto Const Mandatory
{Quest script for FFNucleus01}

bool Property bRagsEquippedOnce Auto Conditional
{Bool to watch if player has equipped rags once}

bool Property bHoodEquippedOnce Auto Conditional
{Bool to watch if player has equipped hood once}

Event OnItemEquipped(Form akBaseObject, ObjectReference akReference)
	;debug.trace("Player has equipped " + akBaseObject)
	if (!bRagsEquippedOnce || !bHoodEquippedOnce) 
		bool bIsHood = false
		bool bIsRags = false

		;Are these the clothes we're looking for?
		if akBaseObject == Clothes_RaiderMod_Hood1
			bIsHood = true
		elseif DLC03_FFNucleus01_ChildrenofAtomClothes.HasForm(akBaseObject)
			bIsRags = true
		endif

		if (bIsRags || bIsHood) && DLC03CoA_FFNucleus01.GetStageDone(30) && !DLC03CoA_FFNucleus01.GetStageDone(100) && !DLC03CoA_FFNucleus01.GetStageDone(750)
		;If player has equipped CoA rags or hood, complete objective 
		;We're intenionally only doing this once to avoid spamming the system.
		;Subsequent updates are handled in the quest script by a timer
		;debug.trace(self + "Still processing equip events.")
			if !bHoodEquippedOnce && bIsHood
				bHoodEquippedOnce = true
				DLC03CoA_FFNucleus01Script.SetHoodObjComplete()

			elseif !bRagsEquippedOnce && bIsRags
				bRagsEquippedOnce = true
				DLC03CoA_FFNucleus01Script.SetRagsObjComplete()

			endif
		endif
	endif
EndEvent