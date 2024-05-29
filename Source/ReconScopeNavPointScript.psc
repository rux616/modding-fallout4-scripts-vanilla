Scriptname ReconScopeNavPointScript extends ObjectReference

Quest Property ReconScopeQuest Auto Const
ReferenceAlias Property NavPoint Auto Const
Location Property NavPointLocation Auto Hidden

Event OnLoad()
	;debug.trace("ReconScopeNavPointScript attempting to force alias.")
	NavPoint.ForceRefTo(self)
	ReconScopeQuest.SetStage(10)

	;send the location to the main quest to reveal
	NavPointLocation = self.GetCurrentLocation()
	if NavPointLocation != None
		(ReconScopeQuest as ReconScopeQuestScript).SetNavLocation(NavPointLocation)
	endif
EndEvent