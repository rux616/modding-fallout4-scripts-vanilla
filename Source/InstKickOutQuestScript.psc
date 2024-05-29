Scriptname InstKickOutQuestScript extends Quest Conditional

Quest Property ComX688 Auto Const

Quest Property Inst301 Auto Const

Quest Property Inst302 Auto Const

Quest Property Inst303 Auto Const

Quest Property InstMassFusion Auto Const

Quest Property Inst305 Auto Const

Quest Property Inst302_BOS Auto Const

Quest Property Inst302_RR Auto Const

Quest Property Inst306 Auto Const

Quest Property Inst307 Auto Const

Quest Property Inst308 Auto Const

Quest Property InstM01 Auto Const

Quest Property MinVsInst Auto Const

Quest Property InstM02 Auto Const

Quest Property InstM03 Auto Const

Quest Property InstR01 Auto Const

Quest Property InstR02 Auto Const

Quest Property InstR03 Auto Const

Quest Property InstR04 Auto Const

Quest Property InstR05 Auto Const

Quest Property MQ207 Auto Const

Quest Property MQ00 Auto Const

Quest Property DN084 Auto Const

Quest Property MQ302RR Auto Const

ReferenceAlias Property Alias_InstKickoutX6 Auto Const

	; DARYL - For handling setup of the LvlHostile Factions
DNMasterHostileFactionScript Property DNMasterHFScript Auto Const

Function Kickout(Location PlayerLoc)

;Start by disabling fast travel if player is inside Institute

	if PlayerLoc == InstituteLocation || InstituteLocation.IsChild(PlayerLoc)
		ControlToggle(0)
	endif

;next, run through shutting down any and all active Institute quests
;

;If Inst308 has started, disregard this

	if Inst308.IsRunning() == 0
		
		;if MQ207.IsRunning()
		;	MQ207.SetStage(200)
		;endif


		if Inst301.IsRunning()
			Inst301.SetStage(1500)
		endif
		if Inst302.IsRunning()
			Inst302.SetStage(1500)
		endif
		if Inst303.IsRunning()
			Inst303.SetStage(1500)
		endif
		if InstMassFusion.IsRunning()
			InstMassFusion.SetStage(1500)
		endif
		if ((DN084.GetStageDone(12)) && (DN084.GetStage() < 500))
			DN084.SetStage(14)
		EndIf
		if MinVsInst.IsRunning()
			MinVsInst.SetStage(1500)
		endif
		if Inst305.IsRunning()
			Inst305.SetStage(1500)
		endif
		if Inst306.IsRunning()
			Inst306.SetStage(1500)
		endif
		if Inst307.IsRunning()
			Inst307.SetStage(1500)
		endif

		if InstM01.IsRunning()
			InstM01.SetStage(1500)
		endif
		if InstM02.IsRunning()
			InstM02.SetStage(2500)
		endif
		if InstM03.IsRunning()
			InstM03.SetStage(2500)
		endif

		if InstR01.IsRunning()
			InstR01.SetStage(1500)
		endif
		if InstR02.IsRunning()
			InstR02.SetStage(1500)
		endif
		if InstR03.IsRunning()
			InstR03.SetStage(1500)
		endif
		if InstR04.IsRunning()
			InstR04.SetStage(1500)
		endif
		if InstR05.IsRunning()
			InstR05.SetStage(1500)
		endif
		if MQ302RR.IsRunning() && MQ302RR.GetStage() < 325
			MQ302RR.SetStage(9000)
		endif


	endif

;kick the player out of the Institute and make him an enemy

;Permanently dismiss X6-88 

ComX688.SetStage(91)
(Alias_InstKickoutX6.GetActorRef() as CompanionActorScript).SetAffinity(-5000)

Game.GetPlayer().RemoveFromFaction(InstituteFaction)
InstituteFaction.SetEnemy(PlayerFaction)

;show message declaring enemy status
InstituteKickOutMessage.Show()


;Next update this quest based on player's current location


	if PlayerLoc == InstituteLocation || InstituteLocation.IsChild(PlayerLoc)
		SetStage(20)
	else

;if player is outside Institute, re-route his fast travel location

		InstituteMapMarker.SetLinkedRef(InstituteStartRef)
		InstituteMapMarker.AddtoMap(1)

;and lock off the Relay room so he can't wander

		InstituteRelayDoorRef.SetOpen(False)
		InstituteRelayDoorRef.SetLockLevel(255)
		InstituteRelayDoorRef.Lock()

		SetStage(10)
	endif

;Finally, send Faction Kickout Event

	(MQ00 as MQ00Script).MQFactionKickoutPlayer(4)


		; DARYL - For handling setup of the LvlHostile Factions
	DNMasterHFScript.UpdateHostileFactionGlobals()

EndFunction

InputEnableLayer InstKickOutLayer

Function ControlToggle(int togglevalue)

	if togglevalue == 0

		 InstKickOutLayer = InputEnablelayer.Create()
		 InstKickOutLayer.EnableFastTravel(False)


	elseif togglevalue == 1

		 InstKickOutLayer.EnableFastTravel(True)
		 InstKickOutLayer.Delete()

	endif

EndFunction


Location Property InstituteLocation Auto Const

ObjectReference Property InstituteMapMarker Auto Const

ObjectReference Property InstituteStartRef Auto Const

ObjectReference Property InstituteRelayDoorRef Auto Const

Bool Property RelaySceneDone Auto Conditional

Faction Property PlayerFaction Auto Const

Faction Property InstituteFaction Auto Const

Message Property InstituteKickoutMessage Auto Const

Int Property PlayerInRelay Auto Conditional
