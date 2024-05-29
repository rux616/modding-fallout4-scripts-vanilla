Scriptname MinRecruit05Script extends Quest Const

ReferenceAlias Property Alias_HostileWorkshop Auto Const
WorkshopParentScript Property WorkshopParent Auto Const

function Startup()
	RegisterForCustomEvent(WorkshopParent, "WorkshopPlayerOwnershipChanged")
endFunction

Event WorkshopParentScript.WorkshopPlayerOwnershipChanged(WorkshopParentScript akSender, Var[] akArgs)
	if (akArgs.Length > 0)
		bool bPlayerOwned = akArgs[0] as bool
		WorkshopScript workshopRef = akArgs[1] as WorkshopScript
		if workshopRef == (Alias_HostileWorkshop.GetRef() as WorkshopScript) && bPlayerOwned
			; set "cleared" stage
			SetStage(200)
		endif
	endif
EndEvent


