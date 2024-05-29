Scriptname DLC03:DLC03CoA_NucleusEntranceScript extends Quest Const

float Property fFailSafeTimerLength = 8.0 Auto Const
{Length of failsafe timer to kill CoA Male}

;Local vars
int iFailSafeTimerID = 1 Const

Quest Property DLC03CoA_Kickout Auto Const Mandatory
{Manages shutting down quest on kick out from Children}

DLC03:DLC03MQ06_NukeHandlingScript Property DLC03MQ06_NukeHandling Auto Const Mandatory
{Manages firing nuke, which fails all quests}

int Property iCoAKickOutStage = 700 Auto Const 
{Stage for Children of Atom kick out on kickout quest}

Event OnQuestInit()
	;Register for Nuke firing custom event
	RegisterforCustomEvent(DLC03MQ06_NukeHandling, "NukeCountdownStarted")

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

Event OnTimer(int aiTimerID)
	;Trigger stage to kill CoA male if is hasn't already happened
	if aiTimerID == iFailSafeTimerID && !GetStageDone(20)
		SetStage(20)
	endif
EndEvent

Function StartFailsafeTimer()
	StartTimer(fFailSafeTimerLength, iFailSafeTimerID)
EndFunction

Function CancelFailsafeTimer()
	CancelTimer(iFailSafeTimerID)
EndFunction