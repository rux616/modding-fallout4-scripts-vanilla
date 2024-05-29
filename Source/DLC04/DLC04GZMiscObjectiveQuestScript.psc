Scriptname DLC04:DLC04GZMiscObjectiveQuestScript Extends Quest
{Quest script for the Galactic Zone Misc Objective quest.}

GlobalVariable property DLC04GZ_StarCoresInstalled Auto Const Mandatory
{Number of Star Cores that have been installed.}

GlobalVariable property DLC04GZ_StarCoresTotal Auto Const Mandatory
{Total number of Star Cores.}

int property StageToSetWhenAllCoresInstalled Auto Const Mandatory
{Stage to set when DLC04GZ_StarCoresInstalled = DLC04GZ_StarCoresTotal}


;Called by DLC04GZTrackingQuestScript when a Star Core is installed.
;Update the Globals, complete the objective if it's done, re-display it if it isn't.
Function UpdateStarCoreInstallCount(bool isInitialDisplay=False)
	UpdateCurrentInstanceGlobal(DLC04GZ_StarCoresInstalled)
	UpdateCurrentInstanceGlobal(DLC04GZ_StarCoresTotal)
	if (DLC04GZ_StarCoresInstalled.GetValue() == DLC04GZ_StarCoresTotal.GetValue())
		Self.SetStage(StageToSetWhenAllCoresInstalled)
	ElseIf (Self.IsObjectiveDisplayed(10))
		Self.SetObjectiveDisplayed(10, True, True)
	ElseIf (Self.IsObjectiveDisplayed(11))
		Self.SetObjectiveDisplayed(11, True, True)		
	EndIf
EndFunction