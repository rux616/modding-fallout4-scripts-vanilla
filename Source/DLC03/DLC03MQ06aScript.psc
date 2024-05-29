Scriptname DLC03:DLC03MQ06aScript extends Quest

Quest Property DLC03CoA_Kickout Auto Const Mandatory
{Manages shutting down quest on kick out from Children}

int Property iCoAKickOutStage = 700 Auto Const 
{Stage for Children of Atom kick out on kickout quest}

float Property fDiMAHCSceneTimerLength = 15.0 Auto Const
{Failsafe timer for DiMA and the High Confessor's scene}

; Local vars
int iDiMAHCSceneTimerID = 1 Const

Event OnQuestInit()
	;When quest starts, register for OnStageSet event on kickout quest
	RegisterforRemoteEvent(DLC03CoA_Kickout, "OnStageSet")
EndEvent

Event Quest.OnStageSet(Quest aksender, int auiStageID, int auiItemID)
	;If this stage gets set on kickout quest, shut this quest down
	if aksender == DLC03CoA_Kickout && auiStageID == iCoAKickOutStage
		SetStage(750)
	endif
EndEvent

Event OnTimer(int aiTimerID)
	if iDiMAHCSceneTimerID == aiTimerID
		;If the wrap up stage for DiMA and the HC's scene hasn't fired, kick it off now
		if !GetStageDone(270)
			SetStage(270)
		endif
	endif
EndEvent

Function StartDiMAHCTimer()
	StartTimer(fDiMAHCSceneTimerLength, iDiMAHCSceneTimerID)
EndFunction

Function CancelDiMAHCTimer()
	CancelTimer(iDiMAHCSceneTimerID)
EndFunction