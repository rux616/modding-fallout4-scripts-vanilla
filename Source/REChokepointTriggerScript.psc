Scriptname REChokepointTriggerScript extends RETriggerScript
{Script for Chokepoint triggers. These are always on load, but in this case, we *do* care about the player entering the trigger, since it represents the guarded area.}

Event OnTriggerEnter(ObjectReference akActionRef)
	if (akActionRef == Game.GetPlayer())
		myQuest.SetStage(11)
	EndIf
	Parent.OnTriggerEnter(akActionRef)
EndEvent