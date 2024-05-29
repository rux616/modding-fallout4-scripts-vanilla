Scriptname MinRadiantOwned10Script extends MinRecruitQuestScript Conditional

int killIntervalDays = 1

ReferenceAlias Property SuspectedSynth const auto mandatory
ReferenceAlias Property WorkshopSpokesman const auto mandatory

ActorValue Property WorkshopRatingPopulationSynths const auto mandatory

Keyword Property AnimArchetypeScared const auto mandatory

Faction Property MinRadiantOwned10SpecialCombatFaction const auto mandatory

int Property SynthChance = 50 const auto
{ % chance the accused is actually a synth }

; called by parent Startup function
function StartupCustom()
	SetupAccusedSynth()
	RegisterForDistanceLessThanEvent(Game.GetPlayer(), SuspectedSynth.GetRef(), RangeCheckDistance)
endFunction

function DailyUpdateCustom()
	; quest has never started
	if GetStageDone(activeStage) == false
		if shutdownIfNotActive && dailyUpdateCount >= shutdownDays && PrestonIntroOn == false
			debug.trace(self + " DailyUpdateCustom: shutdown days reached, quest not active")
			Cleanup()
		endif
	else
		if dailyUpdateCount >= killIntervalDays
			if GetStageDone(20)
				; kill him
				SetStage(failureStage)
			endif
		endif
	endif
endFunction

function SetupAccusedSynth()
	; make not protected
	WorkshopNPCScript suspect = SuspectedSynth.GetActorRef() as WorkshopNPCScript
	suspect.SetProtected(false)
	suspect.ChangeAnimArchetype(AnimArchetypeScared)
	; randomly roll for him being a synth
	int dieRoll = Utility.RandomInt(1, 100)
	if dieRoll <= SynthChance
		; I'm a synth!
		suspect.SetSynth(true)
	endif
endFunction

function ResolveDeath()
	WorkshopNPCScript suspect = SuspectedSynth.GetActorRef() as WorkshopNPCScript
	if suspect.bIsSynth == false
		; innocent person murdered
		ModifyWorkshopHappiness(-10)
		; send affinity event
		followersScript.SendAffinityEvent(self, MinutemenCentralQuest.CA__CustomEvent_SynthSuspectKillFalse)		
	else
		; send affinity event
		followersScript.SendAffinityEvent(self, MinutemenCentralQuest.CA__CustomEvent_SynthSuspectKillTrue)		
	endif	
endFunction

function Cleanup()
	; make suspect protected again if still alive
	Actor suspect = SuspectedSynth.GetActorRef()
	if suspect && suspect.IsDead() == false
		suspect.SetProtected(true)
		suspect.ChangeAnimArchetype()
	endif
	; remove everybody from special combat faction
	WorkshopSpokesman.TryToRemoveFromFaction(MinRadiantOwned10SpecialCombatFaction)
	SuspectedSynth.TryToRemoveFromFaction(MinRadiantOwned10SpecialCombatFaction)
	Game.GetPlayer().RemoveFromFaction(MinRadiantOwned10SpecialCombatFaction)
endFunction
