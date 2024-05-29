Scriptname DLC04:DLC04KOQuestScript extends Quest

GlobalVariable Property DLC04PlayerKickedOut Auto Conditional
GlobalVariable Property DLC04BossCount Auto Conditional
Quest Property DLC04RaiderKickout Auto Const Mandatory
Quest Property DLC04COMGage Auto Const Mandatory
Quest Property DLC04MQ05 Auto Const Mandatory
Quest Property DLC04PowerTracker Auto Const Mandatory
Quest Property DLC04RaiderControllerQuest Auto Const Mandatory
Quest Property DLC04ParkPopulationHandler Auto Const Mandatory
Quest Property DLC04DialogueSettlement Auto Const Mandatory
Faction Property DLC04GangDisciplesFaction Auto Const Mandatory
Faction Property DLC04GangOperatorsFaction Auto Const Mandatory
Faction Property DLC04GangPackFaction Auto Const Mandatory
Faction Property PlayerFaction Auto Const Mandatory
Faction Property HasBeenCompanionFaction Auto Const Mandatory
Faction Property PlayerEnemyFaction Auto Const Mandatory
Faction Property DLC04ShankCrimeFaction Auto Const Mandatory
Message Property DLC04KickoutMessage Auto Const Mandatory
ReferenceAlias Property DLC04KOGage Auto Const Mandatory
ReferenceAlias Property DLC04KONisha Auto Const Mandatory
ReferenceAlias Property DLC04KOWilliam Auto Const Mandatory
ReferenceAlias Property DLC04KOMags Auto Const Mandatory
ReferenceAlias Property	DLC04KOMason Auto Const Mandatory
ActorBase Property DLC04Gage Auto Const Mandatory

DLC04:DLC04WorkshopParentScript Property DLC04WorkshopParent Auto Const Mandatory

CustomEvent DLC04KickOut

Function DLC04SendKickOut()

	;Initial trace
	debug.trace("DLC04 - RaiderKickout Started")

	;Set the master Kickout Global
	DLC04PlayerKickedOut.SetValue(1)

	;Set All Raider Gangs as Enemy
	Game.GetPlayer().RemoveFromFaction(DLC04GangDisciplesFaction)
	Game.GetPlayer().RemoveFromFaction(DLC04GangOperatorsFaction)
	Game.GetPlayer().RemoveFromFaction(DLC04GangPackFaction)
	DLC04GangDisciplesFaction.SetEnemy(PlayerFaction)
	DLC04GangOperatorsFaction.SetEnemy(PlayerFaction)
	DLC04GangPackFaction.SetEnemy(PlayerFaction)
	DLC04ShankCrimeFaction.SetEnemy(PlayerFaction)
	DLC04GangDisciplesFaction.SetPlayerEnemy()
	DLC04GangOperatorsFaction.SetPlayerEnemy()
	DLC04GangPackFaction.SetPlayerEnemy()
	DLC04ShankCrimeFaction.SetPlayerEnemy()

	;Send Event
	SendCustomEvent("DLC04KickOut")

	; Pop Message Box
	DLC04KickoutMessage.Show()

	; Send Stage to Power Tracker Quest
	DLC04PowerTracker.SetStage(100)

	;Enable any Disabled Boss
	DLC04KOMason.GetActorRef().Enable()
	DLC04KONisha.GetActorRef().Enable()
	DLC04KOMags.GetActorRef().Enable()
	DLC04KOWilliam.GetActorRef().Enable()

	;Change allegiance of Traders
	;Traders and Travelers now allied with Player and enemies with all Raiders
	DLC04DialogueSettlement.SetStage(700)

	; Adjust Gage's Affinity and flip him to Protected (Hatred + Shutdown)
	If DLC04KOGage.GetActorRef().IsInFaction(HasBeenCompanionFaction) == 1

		DLC04COMGage.SetStage(91)
		(DLC04KOGage.GetActorRef() as CompanionActorScript).SetAffinity(-5000)
		DLC04KOGage.GetActorRef().SetEssential(false)
		DLC04KOGage.GetActorRef().SetProtected(true)
		DLC04Gage.SetEssential(false)
		DLC04Gage.SetProtected(true)
		DLC04KOGage.GetActorRef().AddToFaction(PlayerEnemyFaction)

	EndIf

	;Kill All Flag and Controller Quests
	DLC04RaiderControllerQuest.Stop()
	DLC04ParkPopulationHandler.Stop()
	
	; #102775 - clear player ownership of all raider settlements, clear vassal status
	DLC04WorkshopParent.ClearRaiderSettlementOwnership()

EndFunction

Function DLC04CountBoss()

	If DLC04BossCount.GetValue() >= 4
	
		DLC04RaiderKickout.SetStage(100)
	
	EndIf

EndFunction