Scriptname DLC03:DLC03CoA_PointerQuestScript extends Quest

Quest Property DLC03CoA_Kickout Auto Const Mandatory
{Manages shutting down quest on kick out from Children}

Quest Property DLC03CoA_DialogueNucleus Auto Const Mandatory
{Special additional to handle the variety of different ways objetive related to this quest can complete}

DLC03:DLC03MQ06_NukeHandlingScript Property DLC03MQ06_NukeHandlingScript Auto Const Mandatory
{Manages firing nuke, which fails all quests}

int Property iCoAKickOutStage = 700 Auto Const 
{Stage for Children of Atom kick out on kickout quest}

int[] Property iCompletionStages Auto Const
{List of stages to check for mission completion}

;Local vars
int iFailureStageToSet = 750 Const

Event OnQuestInit()
	;Register for Nuke firing custom event
	RegisterforCustomEvent(DLC03MQ06_NukeHandlingScript, "NukeCountdownStarted")

	;When quest starts, register for OnStageSet event on kickout quest
	RegisterforRemoteEvent(DLC03CoA_Kickout, "OnStageSet")
EndEvent

Event Quest.OnStageSet(Quest aksender, int auiStageID, int auiItemID)
	;If this stage gets set on kickout quest, shut this quest down
	if aksender == DLC03CoA_Kickout && auiStageID == iCoAKickOutStage
		SetStage(iFailureStageToSet)
	endif
EndEvent

Event DLC03:DLC03MQ06_NukeHandlingScript.NukeCountdownStarted(DLC03:DLC03MQ06_NukeHandlingScript akSender, Var[] akArgs)
	;If the nuke countdown has started, fail this quest
	SetStage(iFailureStageToSet)
EndEvent

bool Function CheckForAllQuestsCompletedAndSetStage()
	int i = 0
	int iCount = iCompletionStages.Length
	bool bQuestsActive = false

	;Check all quests to see if their completion stage is done. 
	while i < iCount && !bQuestsActive

		if !GetStageDone(iCompletionStages[i])
			bQuestsActive = true
		endif

		i += 1
	endWhile

	;If all quests are completed, shut this thing down
	if !bQuestsActive
		SetStage(600)
	endif

	return !bQuestsActive
EndFunction 