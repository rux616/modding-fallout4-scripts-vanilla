Scriptname DN009_SetStageOnEnterScript extends ObjectReference
{Script for DN009_MQ205 that simple calls setstage}

Quest Property myQuest Auto Const
Int Property myStage Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
	if(akActionRef == Game.GetPlayer())
		myQuest.SetStage(myStage)
	endif
EndEvent