Scriptname DefaultQuestShutdownScript extends Quest Const Default 

{shuts the quest down when a timer expires}

Int Property StartTimerStage = 10 Auto Const
{quest stage which will start the shutdown timer}

Int Property ShutdownTimerID = 99 Auto Const

float Property ShutdownTime = 0.2 Auto Const
{time (in game hours) before shutdown}

Event OnStageSet(int auiStageID, int auiItemID)
	debug.trace(self + " stage=" + auiStageID)
	if auiStageID == StartTimerStage
		; start shutdown timer
		StartTimerGameTime(ShutdownTime, ShutdownTimerID)
	endif
endEvent

Event OnTimerGameTime(int aiTimerID)		
	If aiTimerID == ShutdownTimerID
		; stop the quest
		Stop()
	endif
endEvent
