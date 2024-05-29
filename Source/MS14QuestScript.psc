Scriptname MS14QuestScript extends Quest Conditional

; If player immediately agrees to help in stage 10 scene
Int Property Stage10SceneEarlyAgree Auto Conditional

; If player refuses to help in stage 10
Int Property Stage10SceneRefuse Auto Conditional

; If one or more bullies were killed in bar fight
Int Property BulliesKilled Auto Conditional

;Faction to which brawling actors are added in bar fight
Faction Property MS14BrawlFaction Auto Conditional

;Final status of fight
Int Property FightResult Auto Conditional



Event Quest.OnStageSet(Quest akSender, int auiStageID, int auiItemID)

	if akSender == GenericBrawl && auiStageID == (GenericBrawl as GenericBrawlScript).PlayerWinsStage
		debug.trace(self + "OnStageSet: stage=" + auiStageID + ", item=" + auiItemID)
		if GetStage() == 30
			FightResult=1
		endif
	endif


	if akSender == GenericBrawl && auiStageID == (GenericBrawl as GenericBrawlScript).PlayerDefeatedStage
		debug.trace(self + "OnStageSet: stage=" + auiStageID + ", item=" + auiItemID)
		if GetStage() == 30
			FightResult=2
		endif
	endif


	if akSender == GenericBrawl && auiStageID == (GenericBrawl as GenericBrawlScript).QuestDoneStage
		debug.trace(self + "OnStageSet: stage=" + auiStageID + ", item=" + auiItemID)
		if GetStage() == 30
			SetStage(35)
		endif
	endif
EndEvent



Function RunKidnapping()

	Vadim.GetReference().Moveto(VadimBeantownMarker)
	Vadim.GetActorReference().SetRestrained()
	Vadim.GetActorReference().SetEssential(true)
	Travis.GetActorReference().SetEssential(true)
	If Bully1.GetActorReference().IsDead() == 0
		Bully1.GetReference().Moveto(Bully1BeantownMarker)
		Bully1.GetActorReference().EvaluatePackage()
	endif
	if Bully2.GetActorReference().IsDead() == 0
		Bully2.GetReference().Moveto(Bully2BeantownMarker)
		Bully2.GetActorReference().EvaluatePackage()
	endif

EndFunction


Float Property TimeUntilFight Auto Conditional

GlobalVariable Property GameHour Auto Conditional

Function FightTimerSetup()

;called when player is given objective to help in fight
;determines how much time needs to pass before we start fight

;if it's before 4 pm, set it up for this day

	if GameHour.GetValue() < 16
		TimeUntilFight = 18 - (GameHour.GetValue())
	else
		TimeUntilFight = (24 - GameHour.GetValue()) + 18 
	endif	

	StartTimerGameTime(TimeUntilFight, 24)

EndFunction


Function FightSetup()

;called when fight timer expires
;sets up actors and scene for pre-bar fight

Debug.Trace("MS14 FightSetup function running")
MS14ReadyforFight=1

Travis.GetReference().MoveTo(MS14TravisBarMarker)

Travis.GetActorReference().EvaluatePackage()
Bully1.GetReference().Enable()
Bully1.GetActorReference().EvaluatePackage()
Bully2.GetReference().Enable()
Bully2.GetActorReference().EvaluatePackage()
MS14BarPreFightScene.Start()

EndFunction

Event OnTimerGameTime(int aiTimerID)

if aiTimerID == 24

	FightSetup()

endif

EndEvent

ReferenceAlias Property Travis Auto Const

ReferenceAlias Property Bully1 Auto Const

ReferenceAlias Property Bully2 Auto Const

Quest Property GenericBrawl Auto Const

ReferenceAlias Property Vadim Auto Const

ObjectReference Property VadimBeantownMarker Auto Const

ObjectReference Property Bully1BeantownMarker Auto Const

ObjectReference Property Bully2BeantownMarker Auto Const

ObjectReference Property MS14TravisBarMarker Auto Const

Scene Property MS14BarPreFightScene Auto Const

Int Property MS14ReadyForFight Auto Conditional
Int Property BullyFightWon Auto Conditional

Int Property Stage80TravisCatchUp Auto Conditional

Int Property Stage60TravisGetOut Auto Conditional

Int Property VadimFree Auto Conditional
