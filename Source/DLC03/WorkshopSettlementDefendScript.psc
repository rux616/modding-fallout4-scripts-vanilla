Scriptname DLC03:WorkshopSettlementDefendScript extends MinRadiantOwned01Script

int attackTimerID = 1

float startingDamageRating

; override parent (MinRecruitQuestScript)
function Startup()
	Debug.Trace(self + " DLC03:WorkshopSettlementDefendScript Startup")
	parent.Startup()
	; register for update events
	RegisterForCustomEvent(WorkshopParent, "WorkshopDailyUpdate")

	; FROM MinRadiantOwned01.StartupCustom - which we don't need since we're already overriding Startup()
	; register for events
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	; store current damage rating
	startingDamageRating =  WorkshopParent.GetRating(Workshop.GetRef() as WorkshopScript, WorkshopParent.WorkshopRatingDamageCurrent)
	; check if current location is target (when this quest starts from a location change event)
	CheckLocation(Game.GetPlayer().GetCurrentLocation())

	; clear globals
	MinRadiantOwned01SafetyCount.SetValue(0.0)
	MinRadiantOwned01SafetyPercent.SetValue(0.0)
	UpdateCurrentInstanceGlobal(MinRadiantOwned01SafetyCount)
	UpdateCurrentInstanceGlobal(MinRadiantOwned01SafetyPercent)

	; need to call directly since we're not using story manager, we don't get OnStoryScript event
	WorkshopAttackScript attackQuest = ((self as Quest) as WorkshopAttackScript)
	attackQuest.RegisterForPlayerWait()
	attackQuest.numAttackers = 10
endFunction

Event WorkshopParentScript.WorkshopObjectDestructionStageChanged(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + "WorkshopObjectDestructionStageChanged")
	if (akArgs.Length > 0)
		WorkshopObjectScript newObject = akArgs[0] as WorkshopObjectScript
		WorkshopScript workshopRef = akArgs[1] as WorkshopScript

		; check for current damage level - if it exceeds threshold, set damaged stage
		if workshopRef == Workshop.GetRef() && getStageDone(300) == 0 && getStageDone(250) == 0 && getStageDone(200) == 0 && getStageDone(130)

			float currentDamageRating =  WorkshopParent.GetRating(Workshop.GetRef() as WorkshopScript, WorkshopParent.WorkshopRatingDamageCurrent)
			debug.trace(self + " destruction event: currentDamageRating" + currentDamageRating)
			if currentDamageRating >= 99.0 || currentDamageRating >= (startingDamageRating + FailureDamageIncrease)
				setStage(250) ; damage "failure" stage
			endif
		endif
	endif
EndEvent

function PlayerOwnsWorkshop()
	debug.traceStack(self + "PlayerOwnsWorkshop ")
	WorkshopScript workshopRef = (Workshop.GetRef() as WorkshopScript)
	; Make this workshop player owned
	workshopRef.SetOwnedByPlayer(true)
endFunction