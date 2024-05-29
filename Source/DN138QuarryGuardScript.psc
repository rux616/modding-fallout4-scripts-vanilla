Scriptname DN138QuarryGuardScript extends Actor Hidden const

DN138QuestScript Property MyQuestScript auto const
ActorValue Property Aggression auto const


Event OnLoad()
	if MyQuestScript.GetStageDone(20)
		self.SetValue(Aggression, 2)
	else
    	RegisterForCustomEvent(MyQuestScript, "MakeAggressive")
    endif
EndEvent


Event DN138QuestScript.MakeAggressive(DN138QuestScript akSender, Var[] akArgs)
	self.SetValue(Aggression, 2)
EndEvent


Event OnUnLoad()
    UnRegisterForCustomEvent(MyQuestScript, "MakeAggressive")
EndEvent