Scriptname DN158TorpedoFightBypass extends ObjectReference

Quest Property DN158 auto

Event OnActivate(objectReference akActivator)
	(DN158 as DN158QuestScript).BypassTorpedoFight()
	self.disable()
EndEvent