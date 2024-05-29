Scriptname DLC04:DLC04MQ05QuestScript extends Quest

GlobalVariable Property DLC04RankDisciples Auto Const Mandatory
GlobalVariable Property DLC04RankPack Auto Const Mandatory
GlobalVariable Property DLC04RankOperators Auto Const Mandatory
GlobalVariable Property DLC04EnemyGang Auto Const Mandatory

ReferenceAlias Property DLC04MQ05Nisha Auto Const Mandatory
ReferenceAlias Property DLC04MQ05Mags Auto Const Mandatory
ReferenceAlias Property DLC04MQ05Nathan Auto Const Mandatory
ReferenceAlias Property DLC04MQ05Mason Auto Const Mandatory
ReferenceAlias Property DLC04MQ05BossEMSTurf Auto Const Mandatory
ReferenceAlias Property DLC04MQ05BossEMSSleep01 Auto Const Mandatory
ReferenceAlias Property DLC04MQ05BossEMSSleep02 Auto Const Mandatory

Keyword Property EMSystemLinkToTurf auto const Mandatory
Keyword Property EMSystemLinkToSleep auto const Mandatory
Keyword Property DMP_Combat_HoldPreferredPositon auto const Mandatory
Keyword Property DMP_Combat_HoldUntilEngagedPositon auto const Mandatory
Keyword Property DMP_Combat_HoldPosition_128 auto const Mandatory


Faction Property DLC04GangDisciplesFaction Auto Const Mandatory
Faction Property DLC04GangOperatorsFaction Auto Const Mandatory
Faction Property DLC04GangPackFaction Auto Const Mandatory
Faction Property PlayerFaction Auto Const Mandatory
Faction Property DLC04ShankCrimeFaction Auto Const Mandatory

ObjectReference Property DLC04MQ05BossMarker01 Auto Const Mandatory
ObjectReference Property DLC04MQ05BossMarker02 Auto Const Mandatory
ObjectReference Property DLC04MQ05BossMarker03 Auto Const Mandatory
ObjectReference Property DLC04MQ05EnemyBossMarker01 Auto Const Mandatory
ObjectReference Property DLC04MQ05EnemyBossMarker02 Auto Const Mandatory
ObjectReference Property DLC04PowerPlantEnableMarker_TheOperators Auto Const Mandatory
ObjectReference Property DLC04PowerPlantEnableMarker_TheDisciples Auto Const Mandatory
ObjectReference Property DLC04PowerPlantEnableMarker_ThePack Auto Const Mandatory
ObjectReference Property DLC04PowerPlantEnableMarker_PreState Auto Const Mandatory
ObjectReference Property DLC04BPPowerOff Auto Const Mandatory
ObjectReference Property DLC04BPPowerOn Auto Const Mandatory
ObjectReference Property DLC04DRGPowerOff Auto Const Mandatory
ObjectReference Property DLC04DRGPowerOn Auto Const Mandatory
ObjectReference Property DLC04KKPowerOff Auto Const Mandatory
ObjectReference Property DLC04KKPowerOn Auto Const Mandatory
ObjectReference Property DLC04SAPowerOff Auto Const Mandatory
ObjectReference Property DLC04SAPowerOn Auto Const Mandatory
ObjectReference Property DLC04GZPowerOff Auto Const Mandatory
ObjectReference Property DLC04GZPowerOn Auto Const Mandatory
ObjectReference Property DLC04NTPowerOff Auto Const Mandatory
ObjectReference Property DLC04NTPowerOn Auto Const Mandatory
ObjectReference Property DLC04NIPowerOff Auto Const Mandatory
ObjectReference Property DLC04NIPowerOn Auto Const Mandatory
ObjectReference Property DLC04PPPowerOff Auto Const Mandatory
ObjectReference Property DLC04PPPowerOn Auto Const Mandatory
ObjectReference Property DLC04ColaCars_DisciplesClutterEnableMarker Auto Const Mandatory
ObjectReference Property DLC04ColaCars_OperatorsClutterEnableMarker Auto Const Mandatory
ObjectReference Property DLC04ColaCars_PackClutterEnableMarker Auto Const Mandatory
ObjectReference Property fireworksREF_GZ auto Const Mandatory
ObjectReference Property fireworksREF_SA auto Const Mandatory
ObjectReference Property fireworksREF_KK auto Const Mandatory
ObjectReference Property fireworksREF_DRG auto Const Mandatory
ObjectReference Property fireworksREF_NTUSA auto Const Mandatory
ObjectReference Property DLC04_PowerPlantControlRoomEnableMarker auto Const Mandatory
ObjectReference Property DLC04PackBackstageDisableRef Auto Const Mandatory
ObjectReference Property DLC04PackAmphitheaterDisableRef Auto Const Mandatory
ObjectReference Property DLC04OperatorsParlorDisableRef Auto Const Mandatory
ObjectReference Property DLC04DisciplesFizztopDisableRef Auto Const Mandatory
ObjectReference Property DLC04DisciplesFizztopDisablePrisonersRef Auto Const Mandatory
ObjectReference Property DLC04PackAmphitheaterDisableCaptivesRef Auto Const Mandatory
ObjectReference Property DLC04OBJNukaPowerPlantPowerOnmarkerREF auto Const Mandatory


musictype Property MUSReward auto const Mandatory

Perk Property DLC04PerkRaiderOperators Auto Const Mandatory
Perk Property DLC04PerkRaiderDisciples Auto Const Mandatory
Perk Property DLC04PerkRaiderPack Auto Const Mandatory

Quest Property DLC04MQ04DixieSceneQuest Auto Const Mandatory
Quest Property DLC04MQ04MasonSceneQuest Auto Const Mandatory
Quest Property DLC04DialogueRaiderBossOperators Auto Const Mandatory
Quest Property DLC04RaidWipeOut Auto Const Mandatory
Quest Property DLC04RaidSubdue Auto Const Mandatory
Quest Property DLC04RaidChaseOff Auto Const Mandatory
Quest Property DLC04RaidCoerce Auto Const Mandatory
Quest Property DLC04_NUK001_CrowdManager Auto Const Mandatory
Quest Property DLC04PostQuestFlags Auto Const Mandatory
Quest Property DLC04GZTrackingQuest Auto Const Mandatory
Quest Property DLC04RaiderControllerQuest Auto Const Mandatory

Message Property DLC04EndgameDisciplesDeadPerkMessage Auto Const Mandatory
Message Property DLC04EndgameOperatorsDeadPerkMessage Auto Const Mandatory
Message Property DLC04EndgamePackDeadPerkMessage Auto Const Mandatory

GlobalVariable Property DLC04MQ05ShankAtEnemySettlement Auto Const Mandatory
GlobalVariable Property DLC04NukaWorldPowerOnGlobal Auto Const Mandatory
ReferenceAlias Property DLC04MQ05Shank Auto Const Mandatory
DLC04:DLC04WorkshopParentScript Property DLC04WorkshopParent Auto Const Mandatory
WorkshopParentScript Property WorkshopParent Auto Const Mandatory

Function DLC04MakeEnemy()

	;Set the Value of DLC04's Enemy Gang
	;1 = Disciples
	;2 = Operators
	;3 = Pack

	If DLC04RankDisciples.GetValue() == 3
		DLC04EnemyGang.SetValue(1)
		DLC04DisciplesFizztopDisableRef.Disable()
		DLC04DisciplesFizztopDisablePrisonersRef.Disable()
		DLC04MQ05Nisha.GetActorRef().Disable()
	ElseIf DLC04RankOperators.GetValue() == 3
		DLC04EnemyGang.SetValue(2)
		DLC04OperatorsParlorDisableRef.Disable()
		DLC04MQ05Nathan.GetActorRef().Disable()
		DLC04MQ05Mags.GetActorRef().Disable()
	ElseIf DLC04RankPack.GetValue() == 3
		DLC04EnemyGang.SetValue(3)
		DLC04PackAmphitheaterDisableRef.Disable()
		DLC04PackAmphitheaterDisableCaptivesRef.Disable()
		DLC04PackBackstageDisableRef.Disable()
		DLC04MQ05Mason.GetActorRef().Disable()
	EndIf

	;If none of the above is true, because of "ties", use this logic

	If DLC04RankDisciples.GetValue() == 2 && DLC04RankOperators.GetValue() == 2 && DLC04RankPack.GetValue() == 1
		DLC04EnemyGang.SetValue(1)
		DLC04DisciplesFizztopDisableRef.Disable()
		DLC04DisciplesFizztopDisablePrisonersRef.Disable()
	EndIf

	If DLC04RankDisciples.GetValue() == 2 && DLC04RankPack.GetValue() == 2 && DLC04RankOperators.GetValue() == 1
		DLC04EnemyGang.SetValue(1)
		DLC04DisciplesFizztopDisableRef.Disable()
		DLC04DisciplesFizztopDisablePrisonersRef.Disable()
	EndIf

	If DLC04RankDisciples.GetValue() == 2 && DLC04RankPack.GetValue() == 2 && DLC04RankOperators.GetValue() == 2
		DLC04EnemyGang.SetValue(3)
		DLC04PackAmphitheaterDisableRef.Disable()
		DLC04PackBackstageDisableRef.Disable()	
		DLC04PackAmphitheaterDisableCaptivesRef.Disable()	
	EndIf

	If DLC04RankDisciples.GetValue() == 1 && DLC04RankOperators.GetValue() == 2 && DLC04RankPack.GetValue() == 2
		DLC04EnemyGang.SetValue(2)
		DLC04OperatorsParlorDisableRef.Disable()
	EndIf

	SetShankAtEnemySettlementGlobal()

	;Execute the Shutdown of the Raider Controller Quest
	DLC04RaiderControllerQuest.SetStage(255)

EndFunction

Function DLC04GangSetup()

	;Startup Post-Quest Flags to Reset Park Zones if necessary
	DLC04PostQuestFlags.SetStage(10)

	;Clear player ownership of gangs that are now enemies
	DLC04WorkshopParent.ClearRaiderSettlementOwnership(DLC04EnemyGang.GetValueInt())

	;Disciples Are The Enemy!
	If DLC04EnemyGang.GetValue() == 1
		;Faction Adjustments
		Game.GetPlayer().RemoveFromFaction(DLC04GangDisciplesFaction)
		DLC04GangDisciplesFaction.SetPlayerEnemy()
		DLC04GangDisciplesFaction.SetEnemy(PlayerFaction)
		DLC04GangDisciplesFaction.SetEnemy(DLC04GangOperatorsFaction)
		DLC04GangDisciplesFaction.SetEnemy(DLC04GangPackFaction)
		DLC04GangDisciplesFaction.SetEnemy(DLC04ShankCrimeFaction)

		;Close out Disciples-related quests
		DLC04MQ04DixieSceneQuest.SetStage(1510)

		;Fail Raid quests if the chosen gang was the Disciples
		if DLC04RaidSubdue.IsRunning() && (DLC04RaidSubdue as DLC04:DLC04RaidSubdueScript).iChosenGang == 1
			DLC04RaidSubdue.SetStage(850)
		endif

		if DLC04RaidChaseOff.IsRunning() && (DLC04RaidChaseOff as DLC04:DLC04RaidChaseOffScript).iChosenGang == 1
			DLC04RaidChaseOff.SetStage(850)
		endif

		if DLC04RaidWipeOut.IsRunning() && (DLC04RaidWipeOut as DLC04:DLC04RaidWipeOutScript).iChosenGang == 1
			DLC04RaidWipeOut.SetStage(850)
		endif

		if DLC04RaidCoerce.IsRunning() && (DLC04RaidCoerce as DLC04:DLC04RaidCoerceScript).iChosenGang == 1
			DLC04RaidCoerce.SetStage(850)
		endif

		;Movement of Main Characters
		DLC04MQ05Nathan.GetActorRef().MoveTo(DLC04MQ05BossMarker01)
		DLC04MQ05Nathan.GetActorRef().EvaluatePackage()
		DLC04MQ05Mags.GetActorRef().MoveTo(DLC04MQ05BossMarker02)
		DLC04MQ05Mags.GetActorRef().EvaluatePackage()
		DLC04MQ05Mason.GetActorRef().MoveTo(DLC04MQ05BossMarker03)
		DLC04MQ05Mason.GetActorRef().EvaluatePackage()
		DLC04MQ05Nisha.GetActorRef().MoveTo(DLC04MQ05EnemyBossMarker01)
		DLC04MQ05Nisha.GetActorRef().Enable()
		DLC04MQ05Nisha.getReference().SetLinkedRef(DLC04MQ05BossEMSTurf.getReference(), EMSystemLinkToTurf)
		DLC04MQ05Nisha.getReference().SetLinkedRef(DLC04MQ05BossEMSSleep01.getReference(), EMSystemLinkToSleep)
		DLC04MQ05Nisha.getReference().SetLinkedRef(DLC04MQ05BossEMSSleep01.getReference(), DMP_Combat_HoldPreferredPositon)
		DLC04MQ05Nisha.getReference().SetLinkedRef(DLC04MQ05BossEMSSleep01.getReference(), DMP_Combat_HolduntilEngagedPositon)
		DLC04MQ05Nisha.getReference().SetLinkedRef(DLC04MQ05BossEMSSleep01.getReference(), DMP_Combat_HoldPosition_128)
		DLC04MQ05Nisha.GetActorRef().EvaluatePackage()
	
		;Setup PowerPlant Space
		DLC04PowerPlantEnableMarker_PreState.Disable()
		DLC04PowerPlantEnableMarker_TheDisciples.Enable()

		;Setup Cola-Cars Arena Space. (Remove the gang's clutter; remove members of the gang from the crowd if the Arena Radiant is active)
		DLC04ColaCars_DisciplesClutterEnableMarker.Disable()
		if (DLC04_NUK001_CrowdManager.IsRunning())
			DLC04_NUK001_CrowdManager.SetStage(11)
		EndIf
	EndIf

	;Operators Are The Enemy!
	If DLC04EnemyGang.GetValue() == 2
		;Faction Adjustments
		Game.GetPlayer().RemoveFromFaction(DLC04GangOperatorsFaction)
		DLC04GangOperatorsFaction.SetPlayerEnemy()
		DLC04GangOperatorsFaction.SetEnemy(PlayerFaction)
		DLC04GangOperatorsFaction.SetEnemy(DLC04GangDisciplesFaction)
		DLC04GangOperatorsFaction.SetEnemy(DLC04GangPackFaction)
		DLC04GangOperatorsFaction.SetEnemy(DLC04ShankCrimeFaction)

		;Close out Operators-related quests
		DLC04DialogueRaiderBossOperators.SetStage(1510)

		;Fail Raid quests if the chosen gang was the Disciples
		if DLC04RaidSubdue.IsRunning() && (DLC04RaidSubdue as DLC04:DLC04RaidSubdueScript).iChosenGang == 2
			DLC04RaidSubdue.SetStage(850)
		endif

		if DLC04RaidChaseOff.IsRunning() && (DLC04RaidChaseOff as DLC04:DLC04RaidChaseOffScript).iChosenGang == 2
			DLC04RaidChaseOff.SetStage(850)
		endif

		if DLC04RaidWipeOut.IsRunning() && (DLC04RaidWipeOut as DLC04:DLC04RaidWipeOutScript).iChosenGang == 2
			DLC04RaidWipeOut.SetStage(850)
		endif

		if DLC04RaidCoerce.IsRunning() && (DLC04RaidCoerce as DLC04:DLC04RaidCoerceScript).iChosenGang == 2
			DLC04RaidCoerce.SetStage(850)
		endif

		;Movement of Main Characters
		DLC04MQ05Nathan.GetActorRef().MoveTo(DLC04MQ05EnemyBossMarker01)
		DLC04MQ05Nathan.GetActorRef().MoveTo(DLC04MQ05EnemyBossMarker01)
		DLC04MQ05Nathan.GetActorRef().Enable()
		DLC04MQ05Nathan.getReference().SetLinkedRef(DLC04MQ05BossEMSTurf.getReference(), EMSystemLinkToTurf)
		DLC04MQ05Nathan.getReference().SetLinkedRef(DLC04MQ05BossEMSSleep02.getReference(), EMSystemLinkToSleep)
		DLC04MQ05Nathan.getReference().SetLinkedRef(DLC04MQ05BossEMSSleep01.getReference(), DMP_Combat_HoldPreferredPositon)
		DLC04MQ05Nathan.getReference().SetLinkedRef(DLC04MQ05BossEMSSleep01.getReference(), DMP_Combat_HolduntilEngagedPositon)
		DLC04MQ05Nathan.getReference().SetLinkedRef(DLC04MQ05BossEMSSleep01.getReference(), DMP_Combat_HoldPosition_128)
		DLC04MQ05Nathan.GetActorRef().EvaluatePackage()
		DLC04MQ05Mags.GetActorRef().MoveTo(DLC04MQ05EnemyBossMarker02)
		DLC04MQ05Mags.GetActorRef().MoveTo(DLC04MQ05EnemyBossMarker01)
		DLC04MQ05Mags.GetActorRef().Enable()
		DLC04MQ05Mags.getReference().SetLinkedRef(DLC04MQ05BossEMSTurf.getReference(), EMSystemLinkToTurf)
		DLC04MQ05Mags.getReference().SetLinkedRef(DLC04MQ05BossEMSSleep01.getReference(), EMSystemLinkToSleep)
		DLC04MQ05Mags.getReference().SetLinkedRef(DLC04MQ05BossEMSSleep01.getReference(), DMP_Combat_HoldPreferredPositon)
		DLC04MQ05Mags.getReference().SetLinkedRef(DLC04MQ05BossEMSSleep01.getReference(), DMP_Combat_HolduntilEngagedPositon)
		DLC04MQ05Mags.getReference().SetLinkedRef(DLC04MQ05BossEMSSleep01.getReference(), DMP_Combat_HoldPosition_128)
		DLC04MQ05Mags.GetActorRef().EvaluatePackage()		
		DLC04MQ05Mason.GetActorRef().MoveTo(DLC04MQ05BossMarker01)
		DLC04MQ05Mason.GetActorRef().EvaluatePackage()
		DLC04MQ05Nisha.GetActorRef().MoveTo(DLC04MQ05BossMarker02)
		DLC04MQ05Nisha.GetActorRef().EvaluatePackage()

		;Setup PowerPlant Space
		DLC04PowerPlantEnableMarker_PreState.Disable()
		DLC04PowerPlantEnableMarker_TheOperators.Enable()

		;Setup Cola-Cars Arena Space. (Remove the gang's clutter; remove members of the gang from the crowd if the Arena Radiant is active)
		DLC04ColaCars_OperatorsClutterEnableMarker.Disable()
		if (DLC04_NUK001_CrowdManager.IsRunning())
			DLC04_NUK001_CrowdManager.SetStage(11)
		EndIf
	EndIf

	;Pack Are The Enemy!
	If DLC04EnemyGang.GetValue() == 3
		;Faction Adjustments
		Game.GetPlayer().RemoveFromFaction(DLC04GangPackFaction)
		DLC04GangPackFaction.SetPlayerEnemy()
		DLC04GangPackFaction.SetEnemy(PlayerFaction)
		DLC04GangPackFaction.SetEnemy(DLC04GangDisciplesFaction)
		DLC04GangPackFaction.SetEnemy(DLC04GangOperatorsFaction)
		DLC04GangPackFaction.SetEnemy(DLC04ShankCrimeFaction)

		;Close out Pack only quests
		DLC04MQ04MasonSceneQuest.SetStage(1510)

		;Fail Raid quests if the chosen gang was the Disciples
		if DLC04RaidSubdue.IsRunning() && (DLC04RaidSubdue as DLC04:DLC04RaidSubdueScript).iChosenGang == 3
			DLC04RaidSubdue.SetStage(850)
		endif

		if DLC04RaidChaseOff.IsRunning() && (DLC04RaidChaseOff as DLC04:DLC04RaidChaseOffScript).iChosenGang == 3
			DLC04RaidChaseOff.SetStage(850)
		endif

		if DLC04RaidWipeOut.IsRunning() && (DLC04RaidWipeOut as DLC04:DLC04RaidWipeOutScript).iChosenGang == 3
			DLC04RaidWipeOut.SetStage(850)
		endif

		if DLC04RaidCoerce.IsRunning() && (DLC04RaidCoerce as DLC04:DLC04RaidCoerceScript).iChosenGang == 3
			DLC04RaidCoerce.SetStage(850)
		endif

		;Movement of Main Characters
		DLC04MQ05Nathan.GetActorRef().MoveTo(DLC04MQ05BossMarker01)
		DLC04MQ05Nathan.GetActorRef().EvaluatePackage()
		DLC04MQ05Mags.GetActorRef().MoveTo(DLC04MQ05BossMarker02)
		DLC04MQ05Mags.GetActorRef().EvaluatePackage()
		DLC04MQ05Mason.GetActorRef().MoveTo(DLC04MQ05EnemyBossMarker01)
		DLC04MQ05Mason.GetActorRef().MoveTo(DLC04MQ05EnemyBossMarker01)
		DLC04MQ05Mason.GetActorRef().Enable()
		DLC04MQ05Mason.getReference().SetLinkedRef(DLC04MQ05BossEMSTurf.getReference(), EMSystemLinkToTurf)
		DLC04MQ05Mason.getReference().SetLinkedRef(DLC04MQ05BossEMSSleep01.getReference(), EMSystemLinkToSleep)
		DLC04MQ05Mason.getReference().SetLinkedRef(DLC04MQ05BossEMSSleep01.getReference(), DMP_Combat_HoldPreferredPositon)
		DLC04MQ05Mason.getReference().SetLinkedRef(DLC04MQ05BossEMSSleep01.getReference(), DMP_Combat_HolduntilEngagedPositon)
		DLC04MQ05Mason.getReference().SetLinkedRef(DLC04MQ05BossEMSSleep01.getReference(), DMP_Combat_HoldPosition_128)
		DLC04MQ05Mason.GetActorRef().EvaluatePackage()
		DLC04MQ05Nisha.GetActorRef().MoveTo(DLC04MQ05BossMarker01)
		DLC04MQ05Nisha.GetActorRef().EvaluatePackage()

		;Setup PowerPlant Space
		DLC04PowerPlantEnableMarker_PreState.Disable()
		DLC04PowerPlantEnableMarker_ThePack.Enable()

		;Setup Cola-Cars Arena Space. (Remove the gang's clutter; remove members of the gang from the crowd if the Arena Radiant is active)
		DLC04ColaCars_PackClutterEnableMarker.Disable()
		if (DLC04_NUK001_CrowdManager.IsRunning())
			DLC04_NUK001_CrowdManager.SetStage(11)
		EndIf
	EndIf

EndFunction

Function SetShankAtEnemySettlementGlobal()
	;Determine if Shank is at an enemy settlement
	Location CurrentLoc = DLC04MQ05Shank.GetRef().GetCurrentLocation()
	WorkshopScript workshopRef = WorkshopParent.GetWorkshopFromLocation(CurrentLoc)

	if workshopRef != none
		int iLocalGangIndex = DLC04WorkshopParent.GetRaiderGangValue(workshopRef)

		;Whew. Now that that's done with, check to see if the current location's index is the same as the enemy gang's
		if iLocalGangIndex == DLC04EnemyGang.GetValue()
			DLC04MQ05ShankAtEnemySettlement.SetValue(1)
		endif
	endif
EndFunction

Function ParkPowerOn()

	Debug.Trace("DLC05MQ PARK POWER ON")
	fireworksREF_GZ.enable()
	fireworksREF_SA.enable()
	fireworksREF_DRG.enable()
	fireworksREF_NTUSA.enable()
	fireworksREF_KK.enable()
	DLC04OBJNukaPowerPlantPowerOnmarkerREF.enable()
	utility.wait(1)
	game.getPlayer().RampRumble(0.5, 0.25, 512)
	utility.wait(1)
	MUSReward.Add()
	DLC04_PowerPlantControlRoomEnableMarker.Enable()
	utility.wait(1)
	DLC04PPPowerOff.Disable()
	DLC04PPPowerOn.Enable()
	utility.wait(1)
	DLC04NIPowerOff.Disable()
	DLC04NIPowerOn.Enable()
	utility.wait(1)
	DLC04GZPowerOff.Disable()
	DLC04GZPowerOn.Enable()
	utility.wait(1)
	fireworksREF_GZ.playAnimation("stage2")
	DLC04DRGPowerOff.Disable()
	DLC04DRGPowerOn.Enable()
	utility.wait(1)
	fireworksREF_DRG.playAnimation("stage2")
	DLC04SAPowerOff.Disable()
	DLC04SAPowerOn.Enable()
	utility.wait(1)
	fireworksREF_SA.playAnimation("stage2")
	DLC04BPPowerOff.Disable()
	DLC04BPPowerOn.Enable()
	utility.wait(1)
	DLC04KKPowerOff.Disable()
	DLC04KKPowerOn.Enable()
	utility.wait(1)
	fireworksREF_KK.playAnimation("stage2")
	DLC04NTPowerOff.Disable()
	DLC04NTPowerOn.Enable()
	utility.wait(1)
	fireworksREF_NTUSA.playAnimation("stage2")

	;Ride Controllers Activate
	DLC04NukaWorldPowerOnGlobal.SetValue(1)

	;Galactic Zone - Let the Galactic Zone tracking quest know that power has been restored.
	DLC04GZTrackingQuest.SetStage(2000)
EndFunction

;For debug only - we will never be switching the power back off
Function ParkPowerOff()

	Debug.Trace("DLC05MQ PARK POWER OFF")
	DLC04BPPowerOff.Enable()
	DLC04BPPowerOn.Disable()
	DLC04GZPowerOff.Enable()
	DLC04GZPowerOn.Disable()
	DLC04DRGPowerOff.Enable()
	DLC04DRGPowerOn.Disable()
	DLC04KKPowerOff.Enable()
	DLC04KKPowerOn.Disable()
	DLC04SAPowerOff.Enable()
	DLC04SAPowerOn.Disable()
	DLC04NTPowerOff.Enable()
	DLC04NTPowerOn.Disable()
	DLC04NIPowerOff.Enable()
	DLC04NIPowerOn.Disable()
	DLC04PPPowerOff.Enable()
	DLC04PPPowerOn.Disable()

EndFunction

Function FinalRank()

	If DLC04EnemyGang.GetValue() == 1
		DLC04RankPack.SetValue(1)
		DLC04RankOperators.SetValue(1)
	ElseIf DLC04EnemyGang.GetValue() == 2
		DLC04RankPack.SetValue(1)
		DLC04RankDisciples.SetValue(1)
	ElseIf DLC04EnemyGang.GetValue() == 3
		DLC04RankOperators.SetValue(1)
		DLC04RankDisciples.SetValue(1)
	EndIf

	ModRaiderReward()

EndFunction

Function ModRaiderReward()

	If DLC04EnemyGang.GetValue() == 1
		Debug.Trace("DLC04 - Adding Operators and Pack Perks")
		DLC04EndgameDisciplesDeadPerkMessage.Show()
		Game.GetPlayer().AddPerk(DLC04PerkRaiderOperators)
		Game.GetPlayer().AddPerk(DLC04PerkRaiderPack)		
	ElseIf DLC04EnemyGang.GetValue() == 2
		Debug.Trace("DLC04 - Adding Disciples and Pack Perks")
		DLC04EndgameOperatorsDeadPerkMessage.Show()
		Game.GetPlayer().AddPerk(DLC04PerkRaiderDisciples)
		Game.GetPlayer().AddPerk(DLC04PerkRaiderPack)
	ElseIf DLC04EnemyGang.GetValue() == 3
		Debug.Trace("DLC04 - Adding Disciples and Operators Perks")
		DLC04EndgamePackDeadPerkMessage.Show()		
		Game.GetPlayer().AddPerk(DLC04PerkRaiderDisciples)
		Game.GetPlayer().AddPerk(DLC04PerkRaiderOperators)
	EndIf

EndFunction

CustomEvent StopFighting
Function SendStopFighting()
	SendCustomEvent("StopFighting")
endfunction
