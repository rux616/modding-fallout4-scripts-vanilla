Scriptname BoSKickOutScript extends Quest

Quest Property BoS000 Auto Const
Quest Property BoS100 Auto Const
Quest Property BoS101 Auto Const
Quest Property BoS200 Auto Const
Quest Property BoS201 Auto Const
Quest Property BoS201B Auto Const
Quest Property BoS202 Auto Const
Quest Property BoS203 Auto Const
Quest Property BoS204 Auto Const
Quest Property BoS301 Auto Const
Quest Property BoS302 Auto Const
Quest Property BoS302B Auto Const
Quest Property BoS303 Auto Const
Quest Property BoS304 Auto Const
Quest Property BoS305 Auto Const
Quest Property BoSR01 Auto Const
Quest Property BosR02 Auto Const
Quest Property BoSR03 Auto Const
Quest Property BoSR04 Auto Const
Quest Property BoSR05 Auto Const
Quest Property BoSM00 Auto Const
Quest Property BoSM01 Auto Const
Quest Property BoSStoragePointer Auto Const
Quest Property BoS100Radio Auto Const
Quest Property BoS101POI Auto Const
Quest Property BoSM01Pointer Auto Const
Quest Property BoSM01Postquest Auto Const
Quest Property BoSM02 Auto Const
Quest Property BoSM04 Auto Const
Quest Property BoSM04Postquest Auto Const
Quest Property BoSMarshal Auto Const
Quest Property BoSKickOut Auto Const
Quest Property BoSPoliceStation Auto Const
Quest Property BoSDialogue Auto Const
Quest Property BoS202LinkMQ Auto Const
Quest Property MQ00 Auto Const
Quest Property BoS100Fight Auto Const
Quest Property BoSFFMaster Auto Const
Quest Property DN084 Auto Const
Quest Property DN130 Auto Const
Quest Property DN165 Auto Const
Quest Property COMDanse Auto Const
Quest Property VFT Auto Const
Quest Property BoSPrydwenScene_Airport Auto Const
Quest Property BoSPrydwenScene_Barracks Auto Const
Quest Property BoSPrydwenScene_Entry Auto Const
Quest Property BoSPrydwenScene_FlightDeck Auto Const
Quest Property BoSPrydwenScene_Lab Auto Const
Quest Property BoSPrydwenScene_MessHall Auto Const
Quest Property BoSPrydwenScene_PA Auto Const
Quest Property BoSPrydwenScene_PATest Auto Const
Quest Property BoSPrydwenScene_Range Auto Const
Quest Property BoSPrydwenScene_Squires Auto Const
Quest Property BoSScene_PoliceStation Auto Const
Quest Property RECheckpoint02_SynthAttackers Auto Const
Quest Property RECheckpoint03_Gunners Auto Const
Quest Property RECheckpoint04_Deathclaws Auto Const
Quest Property RECheckpoint06_SuperMutants Auto Const
Quest Property RECheckpoint08_RRAttackers Auto Const
Quest Property RECheckpoint09_Raiders Auto Const
Quest Property RECheckpoint10_RaidersPowerArmor Auto Const
Quest Property RECheckpoint11_FeralGhouls Auto Const
Quest Property RECheckpoint12_Deathclaw Auto Const
Quest Property RECheckpoint13_YaoGuai Auto Const
Quest Property RECheckpoint14_SynthAttackers Auto Const
Quest Property RECheckpoint15_Gunners Auto Const
Quest Property RECheckpoint16_Radscorpions Auto Const
Quest Property BoSDansePostGame Auto Const

BoSKickOutScript Property BoSKOScript Auto Const
ActorBase Property BoSPaladinDanseAB Auto Const
Faction Property BrotherhoodofSteelFaction Auto Const
Faction Property PlayerFaction Auto Const
Faction Property PlayerEnemyFaction Auto Const
Faction Property HasBeenCompanionFaction Auto Const
Message Property BoSKickoutMessage Auto Const
ObjectReference Property BostonAirportWorkshopRef Auto Const
ReferenceAlias Property Alias_BoSKickOutDanse Auto Const
ReferenceAlias Property BoSKnightRhys Auto Const
GlobalVariable Property BoSFastTravelCanUse Auto Const
GlobalVariable Property PlayerBoS_KickedOut Auto Const
GlobalVariable Property RECheckpointDisableAttackers Auto Const
GlobalVariable Property RECheckpointMQWonBoS Auto Const
ReferenceAlias Property BoSRBerylliumAgitatorQuestItem Auto Const
ReferenceAlias Property BoSKickoutDanseAlias Auto Const
Keyword Property PowerArmorPreventArmorDamageKeyword Auto Const

; DARYL - For handling setup of the LvlHostile Factions
DNMasterHostileFactionScript Property DNMasterHFScript Auto Const

Function KickOut()

	;Initial trace
	debug.trace("BoSKickout Started")

	;Set the master Kickout Global
	PlayerBoS_KickedOut.SetValue(1)

	; Set Brotherhood of Steel as Enemy
	Game.GetPlayer().RemoveFromFaction(BrotherhoodofSteelFaction)
	BrotherhoodofSteelFaction.SetPlayerEnemy()
	BrotherhoodofSteelFaction.SetEnemy(PlayerFaction)

	; Send out the Kickout Event to Main Quest(1)
	(MQ00 as MQ00Script).MQFactionKickoutPlayer(1)

	;Clear Agitator from Quest Item flagged alias
	BoSRBerylliumAgitatorQuestItem.Clear()

	;Shutdown VFT
	BoSFastTravelCanUse.SetValue(0)

	;Shutdown Workshop Ownership
	(BostonAirportWorkshopRef as WorkshopScript).SetOwnedByPlayer(false)

	;Disable Doctor Li if necessary
	if BoSLiLeftInstitute.GetValue() == 1
		if BoS301LiSetupDone.GetValue() == 0
			BoSDoctorLi.GetReference().Disable()
		endif
	endif


	; Pop Message Box
	BoSKickoutMessage.Show()
	
	; Adjust Danse's Affinity and flip him to Protected (Hatred + Shutdown)
	if BoSKickoutDanseAlias.GetActorRef().IsInFaction(HasBeenCompanionFaction) == 1
		COMDanse.SetStage(91)
		(Alias_BoSKickOutDanse.GetActorRef() as CompanionActorScript).SetAffinity(-5000)
	endIf
	if BoSDansePostGame.GetStageDone(10) == 0
		Alias_BoSKickOutDanse.GetActorRef().AddToFaction(PlayerEnemyFaction)
	endif
	BoSPaladinDanseAB.SetEssential(false)
	BoSPaladinDanseAB.SetProtected(true)

	;Remove Danse's Power Armor Damage Prevention.
	Alias_BoSKickOutDanse.GetActorRef().RemoveKeyword(PowerArmorPreventArmorDamageKeyword)

	;Disable connector doors
	BoSDoors.Disable()

	;Shutdown Individual Quests
	BoS100Radio.SetStage(255)

	if BoS000.IsRunning() == 1
		if BoS000.GetStage() >= 10 && BoS000.GetStage() < 255
			debug.trace("BoS000 Shutdown")
			BoS000.SetStage(355)
		else
			debug.trace("BoS000 Shutdown")
			BoS000.Stop()
		endif
	endif

	if BoS100.IsRunning() == 1
		debug.trace("BoS100 Shutdown")
		BoS100.SetStage(355)
	endif

	if BoS101.IsRunning() == 1
		debug.trace("BoS101 Shutdown")
		BoS101.SetStage(655)
	endif

	if BoS200.IsRunning() == 1
		debug.trace("BoS200 Shutdown")
		BoS200.SetStage(355)
	endif

	if BoS201.IsRunning() == 1
		if BoS201.GetStage() >= 10 && BoS201.GetStage() < 255
			debug.trace("BoS201 Shutdown")
			BoS201.SetStage(355)
		else
			debug.trace("BoS201 Shutdown")
			BoS201.Stop()
		endif
	endif

	if BoS201B.IsRunning() == 1
		debug.trace("BoS201B Shutdown")
		BoS201B.SetStage(355)
	endif

	if BoS202.IsRunning() == 1
		if BoS202.GetStage() >= 10 && BoS202.GetStage() < 255
			debug.trace("BoS202 Shutdown")
			BoS202.SetStage(355)
		else
			debug.trace("BoS202 Shutdown")
			BoS202.Stop()
		endif
	endif

	if BoS202LinkMQ.IsRunning() == 1
		debug.trace("BoS202LinkMQ Shutdown")
		BoS202LinkMQ.Stop()
	endif

	if BoS203.IsRunning() == 1
		if BoS203.GetStage() >= 30 && BoS203.GetStage() < 255
			debug.trace("BoS203 Shutdown")
			BoS203.SetStage(355)
		else
			debug.trace("BoS203 Shutdown")
			BoS203.Stop()
		endif
	endif

	if BoS204.IsRunning() == 1
		debug.trace("BoS204 Shutdown")
		BoS204.SetStage(355)
	endif

	if BoS301.IsRunning() == 1
		debug.trace("BoS301 Shutdown")
		BoS301.SetStage(355)
	endif

	if BoS302.IsRunning() == 1
		debug.trace("BoS302 Shutdown")
		BoS302.SetStage(355)
	endif

	if BoS302B.IsRunning() == 1
		debug.trace("BoS302B Shutdown")
		BoS302B.SetStage(355)
	endif

	if BoS303.IsRunning() == 1
		debug.trace("BoS303 Shutdown")
		BoS303.SetStage(355)
	endif

	if BoS304.IsRunning() == 1
		debug.trace("BoS304 Shutdown")
		BoS304.SetStage(355)
		debug.trace("BoSMarshal Shutdown")
		BoSMarshal.SetStage(255)
	endif

	if BoS305.IsRunning() == 1
		debug.trace("BoS305 Shutdown")
		BoS305.SetStage(355)
	endif

	if BoSStoragePointer.IsRunning() == 1
		debug.trace("BoSStoragePointer Shutdown")
		BoSStoragePointer.SetStage(355)
	endif		

	;DON'T shut down BoS100Fight. If it was still running, it will shut down when
	;Danse dies and it adds the key to Cambridge PD to his corpse.
	;if BoS100Fight.IsRunning() == 1
	;	debug.trace("BoS100Fight Shutdown")
	;	BoS100Fight.SetStage(255)
	;endif

	if ((DN084.GetStageDone(11)) && (DN084.GetStage() < 500))
		DN084.SetStage(13)
	EndIf

	if BoSM00.IsRunning() == 1
		debug.trace("BoSM00 Shutdown")
		BoSM00.SetStage(11)
	endif

	if BoSM01.IsRunning() == 1
		debug.trace("BoSM01 Shutdown")
		BoSM01.SetStage(11)
	endif

	if BoSM01Pointer.IsRunning() == 1
		debug.trace("BoSM01Pointer Shutdown")
		BoSM01Pointer.SetStage(11)
	endif

	if BoSM01Postquest.IsRunning() == 1
		debug.trace("BoSM01Postquest Shutdown")
		BoSM01Postquest.SetStage(11)
	endif

	if BoSM02.IsRunning() == 1
		debug.trace("BoSM02 Shutdown")
		BoSM02.SetStage(11)
	endif

	if BoSM04.IsRunning() == 1
		debug.trace("BoSM04 Shutdown")
		BoSM04.SetStage(11)
	endif

	if BoSM04Postquest.IsRunning() == 1
		debug.trace("BoSM04Postquest Shutdown")
		BoSM04Postquest.SetStage(11)
	endif

	if BoSR01.IsRunning() == 1
		if BoSR01.IsObjectiveDisplayed(10) || BoSR01.IsObjectiveDisplayed(20)
			debug.trace("BoSR01 Shutdown")
			BoSR01.SetStage(355)
		else
			debug.trace("BoSR01 Shutdown")
			BoSR01.Stop()
		endif
	endif

	if BoSR02.IsRunning() == 1
		if BoSR02.IsObjectiveDisplayed(10) || BoSR02.IsObjectiveDisplayed(20)
			debug.trace("BoSR02 Shutdown")
			BoSR02.SetStage(355)
		else
			debug.trace("BoSR02 Shutdown")
			BoSR02.Stop()
		endif
	endif

	if BoSR03.IsRunning() == 1
		if BoSR03.IsObjectiveDisplayed(10) || BoSR03.IsObjectiveDisplayed(30) || BoSR03.IsObjectiveDisplayed(40) || BoSR03.IsObjectiveDisplayed(50)
			debug.trace("BoSR03 Shutdown")
			BoSR03.SetStage(355)
		else
			debug.trace("BoSR03 Shutdown")
			BoSR03.Stop()
		endif
	endif

	if BoSR04.IsRunning() == 1
		if BoSR04.IsObjectiveDisplayed(10) || BoSR04.IsObjectiveDisplayed(25) || BoSR04.IsObjectiveDisplayed(30) || BoSR04.IsObjectiveDisplayed(40)
			debug.trace("BoSR04 Shutdown")
			BoSR04.SetStage(355)
		else
			debug.trace("BoSR04 Shutdown")
			BoSR04.Stop()
		endif
	endif

	if BoSR05.IsRunning() == 1
		if BoSR05.IsObjectiveDisplayed(10) || BoSR05.IsObjectiveDisplayed(20)
			debug.trace("BoSR05 Shutdown")
			BoSR05.SetStage(355)
		else
			debug.trace("BoSR05 Shutdown")
			BoSR05.Stop()
		endif
	endif

	;Update the Police Station's state.
	DN130.SetStage(11)

	;Make sure Rhys is no longer restrained.
	BoSKnightRhys.GetActorRef().SetRestrained(False)

	;Update the Airport Ruins' state.
	DN165.SetStage(11)

	;Clean up the BoS101 POI (Walk to Arcjet) Encounters.
	BoS101POI.SetStage(255)

	if BoSPoliceStation.IsRunning() == 1
		debug.trace("BoSPoliceStation Shutdown")
		BoSPoliceStation.SetStage(355)
	endif

	if BoSFFMaster.IsRunning() == 1
		debug.trace("BoSFFMaster Shutdown")
		BoSFFMaster.SetStage(355)
	endif

	if BoSDialogue.IsRunning() == 1
		debug.trace("BoSDialogue Shutdown")
		BoSDialogue.SetStage(355)
	endif

	if VFT.IsRunning() == 1
		debug.trace("VFT Shutdown")
		VFT.SetStage(355)
	endif

	;If the player has already won the game with the Brotherhood, block future checkpoints quests
	if RECheckpointMQWonBoS.GetValue() == 1
		RECheckpointDisableAttackers.SetValue(1)

		;If checkpoint quests are running, pull their objectives
		if RECheckpoint02_SynthAttackers.IsRunning()
			RECheckpoint02_SynthAttackers.SetStage(600)
		endif

		if RECheckpoint03_Gunners.IsRunning()
			RECheckpoint03_Gunners.SetStage(600)
		endif

		if RECheckpoint04_Deathclaws.IsRunning()
			RECheckpoint04_Deathclaws.SetStage(600)
		endif

		if RECheckpoint06_SuperMutants.IsRunning()
			RECheckpoint06_SuperMutants.SetStage(600)
		endif

		if RECheckpoint08_RRAttackers.IsRunning()
			RECheckpoint08_RRAttackers.SetStage(600)
		endif

		if RECheckpoint09_Raiders.IsRunning()
			RECheckpoint09_Raiders.SetStage(600)
		endif

		if RECheckpoint10_RaidersPowerArmor.IsRunning()
			RECheckpoint10_RaidersPowerArmor.SetStage(600)
		endif

		if RECheckpoint11_FeralGhouls.IsRunning()
			RECheckpoint11_FeralGhouls.SetStage(600)
		endif

		if RECheckpoint12_Deathclaw.IsRunning()
			RECheckpoint12_Deathclaw.SetStage(600)
		endif

		if RECheckpoint13_YaoGuai.IsRunning()
			RECheckpoint13_YaoGuai.SetStage(600)
		endif

		if RECheckpoint14_SynthAttackers.IsRunning()
			RECheckpoint14_SynthAttackers.SetStage(600)
		endif

		if RECheckpoint15_Gunners.IsRunning()
			RECheckpoint15_Gunners.SetStage(600)
		endif

		if RECheckpoint16_Radscorpions.IsRunning()
			RECheckpoint16_Radscorpions.SetStage(600)
		endif
	endif

	;Set BoS Airport scene to done and prep NPC's to be removed on unload 
	if !BoSPrydwenScene_Airport.GetStageDone(10)
		BoSPrydwenScene_Airport.SetStage(10)
	endif

	;Kill Bos Prydwen Barracks scene if it hasn't already finished
	if !BoSPrydwenScene_Barracks.GetStageDone(110)
		BoSPrydwenScene_Barracks.SetStage(90)
	endif

	;Kill Bos Prydwen Entryway scene if it hasn't already finished
	if !BoSPrydwenScene_Entry.GetStageDone(100)
		BoSPrydwenScene_Entry.SetStage(90)
	endif

	;Kill Bos Prydwen Flight Deck scene if it hasn't already finished
	if !BoSPrydwenScene_FlightDeck.GetStageDone(100)
		BoSPrydwenScene_FlightDeck.SetStage(90)
	endif

	;Kill Bos Lab scene if it hasn't already finished
	if !BoSPrydwenScene_Lab.GetStageDone(100)
		BoSPrydwenScene_Lab.SetStage(90)
	endif

	;Kill Bos Mess Hall scene if it hasn't already finished
	if !BoSPrydwenScene_MessHall.GetStageDone(100)
		BoSPrydwenScene_MessHall.SetStage(90)
	endif

	;Kill Bos Power Armor Bay scene if it hasn't already finished
	if !BoSPrydwenScene_PA.GetStageDone(100)
		BoSPrydwenScene_PA.SetStage(90)
	endif

	;Kill Bos Power Armor Testing scene if it hasn't already finished
	if !BoSPrydwenScene_PATest.GetStageDone(110)
		BoSPrydwenScene_PATest.SetStage(90)
	endif

	;Kill Bos Firing Range scene if it hasn't already finished
	if !BoSPrydwenScene_Range.GetStageDone(100)
		BoSPrydwenScene_Range.SetStage(90)
	endif

	;Kill Bos Squires scene if it hasn't already finished
	if !BoSPrydwenScene_Squires.GetStageDone(110)
		BoSPrydwenScene_Squires.SetStage(90)
	endif

	;Kill Bos Police Station scene if it hasn't already finished
	if !BoSScene_PoliceStation.IsRunning()
		if !BoSScene_PoliceStation.GetStageDone(50)
			BoSScene_PoliceStation.SetStage(50)
		endif
	else
		BoSScene_PoliceStation.SetStage(20)
	endif

	BoSKickOut.SetStage(255)

		; DARYL - For handling setup of the LvlHostile Factions
	DNMasterHFScript.UpdateHostileFactionGlobals()

EndFunction
ObjectReference Property BoSDoors Auto Const

GlobalVariable Property BoSLiLeftInstitute Auto Const Mandatory

GlobalVariable Property BoS301LiSetupDone Auto Const Mandatory

ReferenceAlias Property BoSDoctorLi Auto Const
