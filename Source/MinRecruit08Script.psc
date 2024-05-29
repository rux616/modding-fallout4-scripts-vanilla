Scriptname MinRecruit08Script extends MinRecruitQuestScript Conditional

int killIntervalDays = 3

ReferenceAlias Property KidnappedActor const auto
ReferenceAlias Property CaptiveMarker const auto
Faction Property CaptiveFaction const auto
GlobalVariable Property MinRecruit08Ransom Auto Const

RefCollectionAlias Property GoHomeActors Auto Const
{alias to make sure actors get home even if quest shuts down}

; called by parent Startup function
function StartupCustom()
	debug.tracestack(self + "StartupCustom")
	actor captive = KidnappedActor.GetActorRef()
	captive.MoveTo(CaptiveMarker.GetRef())
	captive.SetRestrained(true)
	captive.FollowerFollow()
	; put in "go home" alias to make sure doesn't get stuck in kidnap location after quest shuts down
	GoHomeActors.AddRef(captive)
	; randomize ransom value
	WorkshopParent.RandomizeRansom(MinRecruit08Ransom)
endFunction

function FreeCaptive()
	KidnappedActor.GetActorRef().SetRestrained(false)
	KidnappedActor.GetActorRef().RemoveFromFaction(CaptiveFaction)

endFunction

function DailyUpdateCustom()
	; player has to have spoken to NPC for this to count
	if dailyUpdateCount >= killIntervalDays && GetStageDone(80) && GetStageDone(200) == false
		if GetStageDone(90)
			; player paid ransom
			; TODO - roll randomly as to outcome? (free him/kill him)
			; for now, just free him
			SetStage(200)
		else
			; kill him
			KidnappedActor.GetActorRef().Kill(Game.GetPlayer())
			SetStage(250)
		endif
	endif
endFunction
