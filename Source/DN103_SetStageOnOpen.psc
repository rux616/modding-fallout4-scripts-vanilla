Scriptname DN103_SetStageOnOpen extends Default2StateActivator

Quest Property myQuest Auto
int Property myStage Auto

Function SetOpenNoWait(bool abOpen = true)
	;Set quest stage
	myQuest.SetStage(myStage)

	;Allow Default2StateActivator to handle door as usual.
	Parent.SetOpenNoWait(abOpen)
EndFunction