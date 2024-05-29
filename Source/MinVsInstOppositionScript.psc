Scriptname MinVsInstOppositionScript extends ReferenceAlias

Quest Property MinVsInst Auto Const


Event OnDeath(Actor Killer)

	(MinVsInst as MinVsInstQuestScript).UpdateKills()
	Stage30Trigger.GetReference().Disable()

	if Killer == Game.GetPlayer()
		if MinVsInst.GetStage() == 30
			MinVsInst.SetStage(40)
		endif
	endif
EndEvent
ReferenceAlias Property Stage30Trigger Auto Const
