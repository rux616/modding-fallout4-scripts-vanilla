Scriptname DLC03:DLC03CoA_FFNucleus03Script extends Quest

Quest Property DLC03CoA_Kickout Auto Const Mandatory
{Manages shutting down quest on kick out from Children}

DLC03:DLC03MQ06_NukeHandlingScript Property DLC03MQ06_NukeHandlingScript Auto Const Mandatory
{Manages firing nuke, which fails all quests}

int Property iCoAKickOutStage = 700 Auto Const 
{Stage for Children of Atom kick out on kickout quest}

Event OnQuestInit()
	;Register for Nuke firing custom event
	RegisterforCustomEvent(DLC03MQ06_NukeHandlingScript, "NukeCountdownStarted")

	;When quest starts, register for OnStageSet event on kickout quest
	RegisterforRemoteEvent(DLC03CoA_Kickout, "OnStageSet")
EndEvent

Event Quest.OnStageSet(Quest aksender, int auiStageID, int auiItemID)
	;If this stage gets set on kickout quest, shut this quest down
	if aksender == DLC03CoA_Kickout && auiStageID == iCoAKickOutStage
		SetStage(750)
	endif
EndEvent

Event DLC03:DLC03MQ06_NukeHandlingScript.NukeCountdownStarted(DLC03:DLC03MQ06_NukeHandlingScript akSender, Var[] akArgs)
	;If the nuke countdown has started, fail this quest
	SetStage(750)
EndEvent