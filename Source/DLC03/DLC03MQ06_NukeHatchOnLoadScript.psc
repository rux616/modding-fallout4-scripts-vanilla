Scriptname DLC03:DLC03MQ06_NukeHatchOnLoadScript extends ObjectReference Const

string Property AnimName01 Auto Const Mandatory
{Anim to be played on load}

string Property AnimName02 Auto Const Mandatory
{Anim to be played on load}

Quest Property myQuest Auto Const Mandatory
{Quest to check for stage set (in general, will be stage 50 on DLC03MQ06_WindFarmHandling) }

int Property iPreReqStage01 Auto Const
{Prereq stages to check}

int Property iPreReqStage02 Auto Const
{Prereq stages to check}

Event OnLoad()
	;Launch hatch has a series fo sequential anims. After certain stages have been set, just jump right to those anims
	if myQuest.GetStageDone(iPreReqStage02)
		self.PlayAnimation(AnimName02)
	elseif myQuest.GetStageDone(iPreReqStage01)
		self.PlayAnimation(AnimName01)
	endif
EndEvent

