Scriptname DN070_HackComputerQuestScript extends Quest Hidden Const
{Watches for the player to hack a specific terminal, and notifies DN070 if they do.}

ObjectReference property DN070_JamaicaPlainAccessTerminal Auto Const Mandatory
{If the player hacks this terminal, we need to notify DN070.}

Quest property DN070 Auto Const Mandatory
{DN070}

int property stageToSet Auto Const Mandatory
{The stage to set.}

Event OnStoryHackTerminal(ObjectReference akComputer, bool abSucceeded)
	if (akComputer == DN070_JamaicaPlainAccessTerminal)
		DN070.SetStage(stageToSet)
	EndIf
	;Either way, stop DN070_HackComputerQuestScript.
	Stop()
EndEvent