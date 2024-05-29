Scriptname COMDeaconScript extends Quest Conditional

int bSpecialCase
int bValidOutfit
int nRandomDisguise
Armor aArmor01
Armor aArmor02
Armor aArmor03
Armor aArmor04
Armor aHat

Armor aOldArmor01
Armor aOldArmor02
Armor aOldArmor03
Armor aOldArmor04
Armor aOldHat

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	; watch for player to change location
	if akSender == Game.GetPlayer() && bCanSwapDisguises

		Debug.Trace("COMDeacon has detected the player has moved.")

		; Clear variables
		bSpecialCase = 0
		bValidOutfit = 0

		aArmor01 = NONE
		aArmor02 = NONE
		aArmor03 = NONE
		aArmor04 = NONE
		aHat = NONE

		; First check to see if Deacon has been unloaded
		if ( pCOMDeaconUnloaded.GetValue() == 1.0 )
			; Now check to see if the player can see Deacon
			Actor aDeacon = Deacon.GetActorRef()		
			if ( !Game.GetPlayer().HasDirectLOS(aDeacon) )

				nRandomDisguise = Utility.RandomInt(1,6)

				if ( Game.GetPlayer().IsInLocation(pVault81Location) )    ; Is this Vault 81?
					if ( pCOMDeaconBeenToVault81.GetValue() == 1 )   ; Has Deacon been to Vault 81?
						aArmor01 = pArmor_DeaconVault81_Underwear
						bSpecialCase = 1
						bValidOutfit = 1
					else
						pCOMDeaconBeenToVault81.SetValue(1)          ; If not, flag that he's been there for next time
					endif
				; Is this a Vault? Has Deacon been to Vault 81 yet?
				elseif ( akNewLoc.HasKeyword(pLocSetVault) && pCOMDeaconBeenToVault81.GetValue() == 1 )         
					aArmor01 = pArmor_DeaconVault81_Underwear
					bSpecialCase = 1
					bValidOutfit = 1
				elseif ( Game.GetPlayer().IsInLocation(pGoodneighborLocation) )
					aArmor01 = pClothesDeaconMobster
					aHat = pClothesDeaconMobsterHat
					bSpecialCase = 1
					bValidOutfit = 1
				elseif ( Game.GetPlayer().IsInLocation(pDiamondCityLocation) )
					aArmor01 = pArmor_DeaconDCGuard_LArm
					aArmor02 = pArmor_DeaconDCGuard_RArm
					aArmor03 = pArmor_DeaconDCGuard_TorsoArmor
					aArmor04 = pArmor_DeaconDCGuard_UnderArmor
					bSpecialCase = 1
					bValidOutfit = 1
				elseif ( Game.GetPlayer().IsInLocation(pSanctuaryHillsLocation) && pPlayerMinutemen_JoinedFaction.GetValue() == 1 )
					aArmor01 = pClothesDeaconMinutemanOutfit
					aHat = pClothesDeaconMinutemanHat
					bSpecialCase = 1
					bValidOutfit = 1
				elseif ( Game.GetPlayer().IsInLocation(pOldNorthChurchLocation) || Game.GetPlayer().IsInLocation(pRailroadHQLocation) )
					aArmor01 = pArmor_DeaconHighschool_UnderArmor
					bSpecialCase = 1
					bValidOutfit = 1
				endif
				;if ( akNewLoc == )
				
				if ( bSpecialCase == 1 )
					; NULL - move on
				elseif ( nRandomDisguise == 1)
					aArmor01 = pClothesDeaconResident7
					aHat = pClothesDeaconResident7Hat
					bValidOutfit = 1
				elseif ( nRandomDisguise == 2)
					aArmor01 = pArmor_DeaconRustic_Underarmor
					bValidOutfit = 1
				elseif ( nRandomDisguise == 3)
					aArmor01 = pClothesDeaconResident3
					bValidOutfit = 1
				elseif ( nRandomDisguise == 4)
					aArmor01 = pClothesDeaconMechanic
					bValidOutfit = 1
				elseif ( nRandomDisguise == 5)
					aArmor01 = pClothesDeaconScientist
					bValidOutfit = 1
				elseif ( nRandomDisguise == 6)
					aArmor01 = pArmor_DeaconRaider_Underarmor
					aArmor02 = pArmor_DeaconLeather_LegRight
					bValidOutfit = 1
				endif

				Debug.Trace("COMDeacon: " + nRandomDisguise + ", " + aArmor01)

				if ( bValidOutfit == 1 )
					Actor oDeacon = Deacon.GetActorRef()
					;oDeacon.UnequipAll()
					oDeacon.UnequipItem(aOldArmor01)
					oDeacon.UnequipItem(aOldArmor02)
					oDeacon.UnequipItem(aOldArmor03)
					oDeacon.UnequipItem(aOldArmor04)
					oDeacon.EquipItem(aArmor01)
					oDeacon.EquipItem(aArmor02)
					oDeacon.EquipItem(aArmor03)
					oDeacon.EquipItem(aArmor04)

					oDeacon.EquipItem(pClothesDeaconSunGlasses)   ; He always wears his sunglasses

					if ( Utility.RandomInt(1,2) == 1 )
						oDeacon.EquipItem(pClothesDeaconWig)		; 50/50 chance to wear the wig
						aOldHat = pClothesDeaconWig
					else
						oDeacon.UnequipItem(aOldHat)
						oDeacon.EquipItem(aHat)
						aOldHat = aHat			; This is the old hat the player is wearing
					endif

					aOldArmor01 = aArmor01
					aOldArmor02 = aArmor02
					aOldArmor03 = aArmor03
					aOldArmor04 = aArmor04
					;Deacon.GetActorRef().SetOutfit(oOutfitToWear)
					;pCOMDeaconUnloaded.SetValue(0)
				endif

			endif
		endif

		;Is the player entering Railroad HQ?
		;if ( Game.GetPlayer().IsInLocation(pRailroadHQLocation) )
		;endif

	endif
EndEvent

GlobalVariable Property pCOMDeaconUnloaded Auto Const

Outfit Property pDeaconDisguiseBunkerHill Auto Const
Outfit Property pDeaconDisguiseDCGuard Auto Const
Outfit Property pDeaconDisguiseFarmhand Auto Const
Outfit Property pDeaconDisguiseFlannel Auto Const
Outfit Property pDeaconNormalOutfit Auto Const
Outfit Property pDeaconWastelanderDisguise Auto Const
Outfit Property pDeaconDisguiseMechanic Auto Const
Outfit Property pDeaconDisguiseScientist Auto Const
Outfit Property pDeaconDisguiseLeather Auto Const
Outfit Property pDeaconDisguiseTriggerman Auto Const
Outfit Property pDeaconDisguiseMinuteman Auto Const
Outfit Property pDeaconDisguiseVault81 Auto Const

ReferenceAlias Property Deacon Auto Const

GlobalVariable Property pCOMDeaconBeenToVault81 Auto Const
GlobalVariable Property pPlayerMinutemen_JoinedFaction Auto Const

Keyword Property pLocSetVault Auto Const

Location Property pSanctuaryHillsLocation Auto Const
Location Property pOldNorthChurchLocation Auto Const
Location Property pRailroadHQLocation Auto Const
Location Property pDiamondCityLocation Auto Const
Location Property pGoodneighborLocation Auto Const

Location Property pVault81Location Auto Const

Armor Property pClothesDeaconSunGlasses Auto Const Mandatory
Armor Property pClothesDeaconWig Auto Const Mandatory

Armor Property pArmor_DeaconVault81_Underwear Auto Const Mandatory
Armor Property pClothesDeaconMobster Auto Const Mandatory
Armor Property pClothesDeaconMobsterHat Auto Const Mandatory
Armor Property pArmor_DeaconDCGuard_LArm Auto Const Mandatory
Armor Property pArmor_DeaconDCGuard_RArm Auto Const Mandatory
Armor Property pArmor_DeaconDCGuard_TorsoArmor Auto Const Mandatory
Armor Property pArmor_DeaconDCGuard_UnderArmor Auto Const Mandatory
Armor Property pClothesDeaconMinutemanHat Auto Const Mandatory
Armor Property pClothesDeaconMinutemanOutfit Auto Const Mandatory
Armor Property pArmor_DeaconHighschool_UnderArmor Auto Const Mandatory
Armor Property pClothesDeaconResident7 Auto Const Mandatory
Armor Property pClothesDeaconResident7Hat Auto Const Mandatory
Armor Property pArmor_DeaconRustic_Underarmor Auto Const Mandatory
Armor Property pClothesDeaconResident3 Auto Const Mandatory
Armor Property pClothesDeaconMechanic Auto Const Mandatory
Armor Property pClothesDeaconScientist Auto Const Mandatory
Armor Property pArmor_DeaconRaider_Underarmor Auto Const Mandatory
Armor Property pArmor_DeaconLeather_LegRight Auto Const Mandatory

Int Property bCanSwapDisguises = 1 Auto Conditional
