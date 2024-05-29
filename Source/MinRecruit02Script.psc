Scriptname MinRecruit02Script extends MinRecruitQuestScript Conditional

int killIntervalDays = 3

ReferenceAlias Property KidnappedActor const auto
ReferenceAlias Property CaptiveMarker const auto
Faction Property CaptiveFaction const auto
GlobalVariable Property MinRecruit02Ransom Auto Const
GlobalVariable Property MinRecruit02Kidnapper Auto Const

Keyword Property LocEncRaiders Auto Const
Keyword Property LocEncGunners Auto Const
Keyword Property LocEncSuperMutants Auto Const
LocationAlias Property KidnapperDungeon Auto Const

GenericGoHomeScript Property GenericGoHome Auto Const
{ quest that makes sure actors get home }

; called by parent Startup function
function StartupCustom()
	CheckLocationEncType()

	debug.tracestack(self + "StartupCustom")
	actor captive = KidnappedActor.GetActorRef()
	captive.MoveTo(CaptiveMarker.GetRef())
	captive.SetRestrained(true)
	captive.FollowerFollow()

	; put in "go home" alias to make sure doesn't get stuck in kidnap location after quest shuts down
	GenericGoHome.AddRef(captive)
	; randomize ransom value
	WorkshopParent.RandomizeRansom(MinRecruit02Ransom)
	UpdateCurrentInstanceGlobal(MinRecruit02Ransom)

	; happiness modifier
	ModifyWorkshopHappiness(-10)
endFunction

function FreeCaptive()
	actor captive = KidnappedActor.GetActorRef()

	captive.SetRestrained(false)
	captive.RemoveFromFaction(CaptiveFaction)
	GenericGoHome.TryToSendHome(captive)
	UndoAppliedHappinessModifier()
endFunction

function DailyUpdateCustom()
	debug.trace(self + " DailyUpdateCustom: activeStage=" + activeStage + ", shutdownIfNotActive=" + shutdownIfNotActive + ", shutdownDays=" + shutdownDays + ", dailyUpdateCount=" + dailyUpdateCount)
	; player hasn't accepted quest and hasn't talked to NPC
	if GetStageDone(activeStage) == false && GetStageDone(80) == false
		if shutdownIfNotActive && dailyUpdateCount >= shutdownDays && PrestonIntroOn == false
			debug.trace(self + " DailyUpdateCustom: shutdown days reached, quest not active - free captive")
			FreeCaptive()
		endif
	else
		; player has to have spoken to NPC for this to count
		if dailyUpdateCount >= killIntervalDays && GetStageDone(80) && GetStageDone(200) == false
			if GetStageDone(90)
				; player paid ransom
				; free captive
				SetStage(200)
			else
				actor victim = KidnappedActor.GetActorRef()
				if victim.is3DLoaded() == false && Game.GetPlayer().GetCurrentLocation() != KidnapperDungeon.GetLocation()
					; kill him
					victim.KillEssential()
					SetStage(250)
				endif
			endif
		endif
	endif
endFunction


Function CheckLocationEncType()
	int encType = 0
	Location LocActual = KidnapperDungeon.GetLocation()
	if LocActual.HasKeyword(LocEncRaiders) 
		MinRecruit02Kidnapper.SetValue(1)
	elseif  LocActual.HasKeyword(LocEncGunners) 
		MinRecruit02Kidnapper.SetValue(2)
	elseif  LocActual.HasKeyword(LocEncSuperMutants) 
		MinRecruit02Kidnapper.SetValue(3)
	endif
EndFunction