Scriptname DN036_PhyllisShutDownScript extends ReferenceAlias


Event OnUnload()
	if GetActorRef().IsDead() && !GetOwningQuest().GetStageDone(1000)
		GetOwningQuest().SetStage(1000)
	endif
endEvent