Scriptname DLC04:DLC04PackScentGrenadeScript extends ObjectReference Const
{script for summoning in Pack animals with a smoke grenade}

Keyword Property DLC04PackScentGrenadeStart Auto Const Mandatory
{Quest starting keywork}

Message Property DLC04PackScentGrenadeFailureMessage Auto Const Mandatory
{Message to throw if we're unable to start the quest}

Message Property DLC04PackScentGrenadeAlreadyActiveMessage Auto Const Mandatory
{Message to throw if the quest is already running or hasn't yet passed its cooldown}

Quest Property DLC04PackScentGrenadeQuest auto const Mandatory
{Quest that creates the beasts}

GlobalVariable Property DLC04PackScentGrenadeCurrentCoolDown Auto Const Mandatory
{Global that manages grenade cooldown}

GlobalVariable Property GameDaysPassed Auto Const Mandatory
{Global to check against cooldown timing}

REParentScript Property REParent Auto const mandatory
{Used to clean up any latent RE systems}

event OnInit()
	; send RE cleanup event - try to stop scent grenade quest if currently waiting to shut down
	REParent.SendCustomEvent("RECheckForCleanup")
	utility.wait(1.0)
	if GameDaysPassed.GetValue() >= DLC04PackScentGrenadeCurrentCoolDown.GetValue()
		if DLC04PackScentGrenadeStart.SendStoryEventAndWait(akLoc = GetCurrentLocation(), akRef1 = self) == false
			debug.trace(self + " DLC04PackScentGrenadeScript didn't start")
			if DLC04PackScentGrenadeQuest.IsRunning()
				DLC04PackScentGrenadeAlreadyActiveMessage.Show()
			else
				DLC04PackScentGrenadeFailureMessage.Show()
			endif
		endif
	else
		debug.trace(self + " DLC04PackScentGrenadeScript cooldown time hasn't elapsed.")
		DLC04PackScentGrenadeAlreadyActiveMessage.Show()
	endif
endEvent