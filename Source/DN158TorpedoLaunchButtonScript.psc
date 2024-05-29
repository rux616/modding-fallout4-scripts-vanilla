Scriptname DN158TorpedoLaunchButtonScript extends ObjectReference

int property TorpedoTubeNumber = 1 auto
{Default == 1
	2	3
	1	4}

Quest property DN158 auto
DN158QuestScript property myQuestScript auto hidden
bool property TorpedoLoaded = false auto hidden
Keyword property LinkCustom01 auto

Auto State Waiting
	event onActivate(objectReference akActivator)
		GoToState("Busy")
		playAnimation("Play01")
		if !myQuestScript
			myQuestScript = DN158 as DN158QuestScript
		endif
		if TorpedoLoaded
			TorpedoLoaded = false
			PlayAnimation("red")
			(GetLinkedRef(LinkCustom01) as DN158TorpedoLoadButtonScript).SetTorpedoTubeClear()
			myQuestScript.LaunchTorpedo(TorpedoTubeNumber)
		else
			Debug.Notification("Torpedo Tube " + TorpedoTubeNumber + " not loaded")
		endif
		GoToState("Waiting")
	endEvent
endState

State Busy
EndState

Function SetTubeLoaded(bool isLoaded = true)
	if !myQuestScript
		myQuestScript = DN158 as DN158QuestScript
	endif
	TorpedoLoaded = isLoaded
	PlayAnimation("green")
	myQuestScript.ReadyFiringBlip(TorpedoTubeNumber)
EndFunction

Function SetTubeLoading()
	PlayAnimation("yellow")
EndFunction

Event onActivate(objectReference akActivator)
	GoToState("Busy")
	playAnimation("Play01")
	GoToState("Waiting")
endEvent