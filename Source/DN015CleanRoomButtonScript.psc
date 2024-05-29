Scriptname DN015CleanRoomButtonScript extends ObjectReference Const

Quest Property DN015 Auto Const
ReferenceAlias Property Robot Auto Const


Event onActivate(ObjectReference akActivator)
	if akActivator == game.GetPlayer() || akActivator == Robot.GetActorRef()
		(DN015 as DN015QuestScript).ActivateCleanRoomDoor()
	endif
endEvent