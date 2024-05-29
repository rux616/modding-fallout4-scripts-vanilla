Scriptname DLC03:DLC03MQ06_PlayAnimOnLoad extends ObjectReference

string Property AnimName Auto Const Mandatory
{Anim to be played on load}

Quest Property myQuest Auto Const Mandatory
{Quest to check for stage set (in general, will be stage 50 on DLC03MQ06_WindFarmHandling) }

int Property iPreReqStage Auto Const
{Prereq stage to check}

Auto State WaitingForLoad
	Event OnLoad()
		if myQuest.GetStageDone(iPreReqStage)
			self.PlayAnimation(AnimName)
			GotoState("AnimUpdateComplete")
		endif
	EndEvent
EndState

State AnimUpdateComplete
	Event OnLoad()
		;Do nothing. 
	EndEvent
EndState