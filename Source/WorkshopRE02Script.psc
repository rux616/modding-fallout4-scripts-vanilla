Scriptname WorkshopRE02Script extends MinRecruitQuestScript Conditional

int killIntervalDays = 3

ReferenceAlias Property CaravanActor const auto
ReferenceAlias Property CaptiveMarker const auto
Faction Property CaptiveFaction const auto
GlobalVariable Property MinRadiantOwned03Ransom Auto Const
GlobalVariable Property MinRadiantOwned03Kidnapper Auto Const

Keyword Property LocEncRaiders Auto Const
Keyword Property LocEncGunners Auto Const
Keyword Property LocEncSuperMutants Auto Const
LocationAlias Property KidnapperDungeon Auto Const

GenericGoHomeScript Property GenericGoHome Auto Const
{ quest that makes sure actors get home }

; called by parent Startup function
function StartupCustom()
	CheckLocationEncType()
	
	actor captive = CaravanActor.GetActorRef()
	captive.MoveTo(CaptiveMarker.GetRef())
	captive.SetRestrained(true)
	WorkshopParent.TurnOnCaravanActor(captive as WorkshopNPCScript, bTurnOn = false)

	; put in "go home" alias to make sure doesn't get stuck in kidnap location after quest shuts down
	GenericGoHome.AddRef(captive)

	; randomize ransom value
	WorkshopParent.RandomizeRansom(MinRadiantOwned03Ransom)

	; happiness modifier
	ModifyWorkshopHappiness(-10)
endFunction

function FreeCaptive()
	actor captive = CaravanActor.GetActorRef()
	captive.SetRestrained(false)
	captive.RemoveFromFaction(CaptiveFaction)
	GenericGoHome.TryToSendHome(captive)
	WorkshopParent.TurnOnCaravanActor(captive as WorkshopNPCScript, bTurnOn = true, bBrahminCheck = false)
	UndoAppliedHappinessModifier()
endFunction

function DailyUpdateCustom()
	; quest has never started
	if GetStageDone(activeStage) == false
		if shutdownIfNotActive && dailyUpdateCount >= shutdownDays && PrestonIntroOn == false
			debug.trace(self + " DailyUpdateCustom: shutdown days reached, quest not active - free captive")
			FreeCaptive()
		endif
	else
		if dailyUpdateCount >= killIntervalDays
			if GetStageDone(90)
				; player paid ransom
				; free him
				SetStage(successStage)
			else
				actor victim = CaravanActor.GetActorRef()
				; kill victim if player is not nearby
				if victim.is3DLoaded() == false && Game.GetPlayer().GetCurrentLocation() != KidnapperDungeon.GetLocation()
					; kill him
					victim.KillEssential()
					SetStage(failureStage)
				endif
			endif
		endif
	endif
endFunction

Function CheckLocationEncType()
	int encType = 0
	Location LocActual = KidnapperDungeon.GetLocation()
	if LocActual.HasKeyword(LocEncRaiders) 
		MinRadiantOwned03Kidnapper.SetValue(1)
	elseif  LocActual.HasKeyword(LocEncGunners) 
		MinRadiantOwned03Kidnapper.SetValue(2)
	elseif  LocActual.HasKeyword(LocEncSuperMutants) 
		MinRadiantOwned03Kidnapper.SetValue(3)
	endif
EndFunction