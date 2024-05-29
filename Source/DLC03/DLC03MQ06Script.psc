Scriptname DLC03:DLC03MQ06Script extends Quest

Quest Property DLC03CoA_Kickout Auto Const Mandatory
{Manages shutting down quest on kick of from Children}

int Property iCoAKickOutStage = 700 Auto Const 
{Stage for Children of Atom kick out}

int Property iNukeVictoryTimerLength = 15 Auto Const
{Length of timer for Nuke Victory time (called once stage 250 is fired)}

;Local vars
int iNukeVictoryTimerID = 1 Const

Event OnQuestInit()
	;When quest starts, register for OnStageSet event on kickout quest
	RegisterforRemoteEvent(DLC03CoA_Kickout, "OnStageSet")
EndEvent

Event Quest.OnStageSet(Quest aksender, int auiStageID, int auiItemID)
	;If this gets set on kickout quest, trigger "Fail CoA branch" stage
	if aksender == DLC03CoA_Kickout && auiStageID == iCoAKickOutStage
		SetStage(249)
	endif
EndEvent

Event OnTimer(int aiTimerID)
	;Once this timer is done, set stage to shutdown quest
	if aiTimerID == iNukeVictoryTimerID
		SetStage(255)
	endif
EndEvent

Function StartNukeVictoryTimer()
	StartTimer(iNukeVictoryTimerLength, iNukeVictoryTimerID)
EndFunction