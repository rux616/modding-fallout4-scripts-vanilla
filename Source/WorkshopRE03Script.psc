Scriptname WorkshopRE03Script extends MinRecruitQuestScript Conditional

ReferenceAlias Property DiscountDanAlias const auto

; called by parent Startup function
function StartupCustom()
endFunction

function DailyUpdate()
	; TODO  - maybe have Dan leave after a few days?
endFunction

function ShowWorkshopAssignmentMenu()
	debug.trace(self + "ShowWorkshopAssignmentMenu " + DiscountDanAlias.GetRef())
	RegisterForCustomEvent(WorkshopParent, "WorkshopAddActor")	
	WorkshopParent.AddPermanentActorToWorkshopPlayerChoice(DiscountDanAlias.GetActorRef())
endFunction
 
; handle workshopAddActor event
Event WorkshopParentScript.WorkshopAddActor(WorkshopParentScript akSender, Var[] akArgs)
	if (akArgs.Length > 0)
		Actor assignedActor = akArgs[0] as Actor
		int workshopID = akArgs[1] as int

		if assignedActor == DiscountDanAlias.GetActorRef()
			Debug.Trace(self + " WorkshopAddActor event received for " + assignedActor)
			UnregisterForCustomEvent(WorkshopParent, "WorkshopAddActor")	
			SetStage(100)
		endif
	endif
EndEvent



